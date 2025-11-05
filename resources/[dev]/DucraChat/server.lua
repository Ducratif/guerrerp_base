--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()

function GenerateId()
    local charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local id = ''
    for i = 1, 8 do
        local rand = math.random(1, #charset)
        id = id .. charset:sub(rand, rand)
    end
    return id
end


-- Génère un ID unique si le joueur n'en a pas
lib.callback.register('ducrachat:getOrCreateId', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil end
    local identifier = xPlayer.identifier
    local row = MySQL.single.await('SELECT id_telegram FROM ducrachat_users WHERE identifier = ?', {identifier})
    if row and row.id_telegram then
        return { id_telegram = row.id_telegram, identifier = identifier }
    end
    -- Génère un ID et vérifie qu’il est unique
    local id
    repeat
        id = GenerateId()
        local check = MySQL.single.await('SELECT 1 FROM ducrachat_users WHERE id_telegram = ?', {id})
    until not check
    MySQL.update.await('INSERT INTO ducrachat_users (identifier, id_telegram) VALUES (?, ?)', {identifier, id})
    return { id_telegram = id, identifier = identifier }
end)


-- Recherche un ID unique
lib.callback.register('ducrachat:searchId', function(source, searchId)
    local row = MySQL.single.await('SELECT identifier FROM ducrachat_users WHERE id_telegram = ?', {searchId})
    return row and row.identifier or false
end)

-- Récupère l’historique des conversations (derniers messages par conversation)
lib.callback.register('ducrachat:getConversations', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return {} end
    local identifier = xPlayer.identifier

    local conversations = MySQL.query.await([[
        SELECT 
            c.id,
            convs.participant_id,
            u.id_telegram,
            c.message AS last_message,
            c.timestamp AS last_time,
            convs.unread,
            convs.receiver
        FROM (
            SELECT 
                IF(sender = ?, receiver, sender) AS participant_id, 
                MAX(id) AS last_message_id,
                SUM(IF(receiver = ? AND is_read = 0, 1, 0)) AS unread,
                MAX(receiver = ?) AS receiver
            FROM ducrachat_messages 
            WHERE sender = ? OR receiver = ?
            GROUP BY participant_id
        ) as convs
        JOIN ducrachat_messages c ON c.id = convs.last_message_id
        LEFT JOIN ducrachat_users u ON u.identifier = convs.participant_id
    ]], {identifier, identifier, identifier, identifier, identifier})

    return conversations or {}
end)

-- Récupère les messages d'une conversation
lib.callback.register('ducrachat:getMessages', function(source, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return {} end
    local identifier = xPlayer.identifier
    local otherId = data and data.id_telegram
    if not otherId then return {} end
    local row = MySQL.single.await('SELECT identifier FROM ducrachat_users WHERE id_telegram = ?', {otherId})
    if not row then return {} end
    local targetIdentifier = row.identifier

    -- Marque comme lu tous les messages reçus par ce joueur
    MySQL.update('UPDATE ducrachat_messages SET is_read = 1 WHERE receiver = ? AND sender = ? AND is_read = 0', {identifier, targetIdentifier})

    local messages = MySQL.query.await([[
        SELECT id, sender, receiver, message, timestamp
        FROM ducrachat_messages
        WHERE (sender = ? AND receiver = ?) OR (sender = ? AND receiver = ?)
        ORDER BY id DESC LIMIT 50
    ]], {identifier, targetIdentifier, targetIdentifier, identifier})
    return messages or {}
end)

-- Envoie un message (gestion du délai)
RegisterNetEvent('ducrachat:sendMessage', function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local identifier = xPlayer.identifier

    local targetId = data and data.id_telegram
    local message = data and data.message
    if not targetId or not message or #message < 1 then return end

    local row = MySQL.single.await('SELECT identifier FROM ducrachat_users WHERE id_telegram = ?', {targetId})
    if not row then
        TriggerClientEvent('ducrachat:popupInvalidId', src)
        return
    end
    local targetIdentifier = row.identifier

    -- Vérif des délais
    local user = MySQL.single.await('SELECT * FROM ducrachat_users WHERE identifier = ?', {identifier})
    local delay = 10 * 60 -- secondes (par défaut)
    if user and user.delay_override then
        delay = user.delay_override
    end
    local receive_at = os.time() + delay

    MySQL.insert.await([[
        INSERT INTO ducrachat_messages (sender, receiver, message, timestamp, deliver_at, is_read)
        VALUES (?, ?, ?, NOW(), FROM_UNIXTIME(?), 0)
    ]], {identifier, targetIdentifier, message, receive_at})

    TriggerClientEvent('ducrachat:messageSent', src, delay)
end)

-- Achats d'options
RegisterNetEvent('ducrachat:buyOption', function(option, value)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then print("[DEBUG] NO XPLAYER") return end
    local identifier = xPlayer.identifier
    print("[DEBUG] Achat option", option, value, identifier)
    print("[DEBUG] Argent dispo:", xPlayer.getAccount('money').money)

    if option == "read" then
        if xPlayer.getAccount('money').money >= 50000 then
            xPlayer.removeAccountMoney('money', 50000)
            MySQL.update('UPDATE ducrachat_users SET can_read = 1 WHERE identifier = ?', {identifier})
            TriggerClientEvent('ducrachat:showNotif', src, "Option achetée !", "success")
        else
            print("[DEBUG] Pas assez d'argent pour read")
        end

    elseif option == "delay" then
        local min = tonumber(value)
        print("[DEBUG] Achat delay:", min)
        if not min or min < 1 or min > 9 then print("[DEBUG] Mauvais min:", min) return end
        local base = 10000 * min
        local prices = { [1]=10000, [2]=20000, [3]=28000, [4]=35000, [5]=45000, [6]=50000, [7]=55000, [8]=65000, [9]=70000 }
        local price = prices[min] or base
        local user = MySQL.single.await('SELECT delay_override FROM ducrachat_users WHERE identifier = ?', {identifier})
        local delay = (user and user.delay_override) or 600
        print("[DEBUG] Prix à payer:", price, "Delay actuel:", delay, "Demande:", min)
        if delay <= 60*min then
            TriggerClientEvent('ducrachat:showNotif', src, "Tu ne peux pas réduire plus que le temps restant !", "error")
            print("[DEBUG] Refus: trop bas")
            return
        end
        if xPlayer.getAccount('money').money >= price then
            xPlayer.removeAccountMoney('money', price)
            local newdelay = delay - 60*min
            print("[DEBUG] On UPDATE le delay à:", newdelay)
            MySQL.update('UPDATE ducrachat_users SET delay_override = ? WHERE identifier = ?', {newdelay, identifier})
            TriggerClientEvent('ducrachat:showNotif', src, "Réduction du délai achetée !", "success")

        else
            print("[DEBUG] Pas assez d'argent pour delay")
        end

    elseif option == "instant" then
        print('[DEBUG] achat instant!')
        local user = MySQL.single.await('SELECT delay_override FROM ducrachat_users WHERE identifier = ?', {identifier})
        print('[DEBUG] delay avant:', user and user.delay_override)
        if user and user.delay_override == 0 then
            print('[DEBUG] déjà instantané!')
            return false
        end
        if xPlayer.getAccount('money').money >= 80000 then
            print('[DEBUG] paiement OK, on set à 0')
            xPlayer.removeAccountMoney('money', 80000)
            MySQL.update('UPDATE ducrachat_users SET delay_override = 0 WHERE identifier = ?', {identifier})
            TriggerClientEvent('ducrachat:showNotif', src, "Envoi instantané activé !", "success")
        else
            TriggerClientEvent('ducrachat:showNotif', src, "Pas assez d’argent.", "error")
            print('[DEBUG] pas assez d’argent')
        end

    elseif option == "changeid" then
        if xPlayer.getAccount('money').money >= 200000 then
            xPlayer.removeAccountMoney('money', 200000)
            -- Nouveau ID + reset convos
            local newid
            repeat
                newid = GenerateId()
                local check = MySQL.single.await('SELECT 1 FROM ducrachat_users WHERE id_telegram = ?', {newid})
            until not check
            MySQL.update('UPDATE ducrachat_users SET id_telegram = ? WHERE identifier = ?', {newid, identifier})
            MySQL.query('DELETE FROM ducrachat_messages WHERE sender = ? OR receiver = ?', {identifier, identifier})
            TriggerClientEvent('ducrachat:changedId', src, newid)
        else
            print('[DEBUG] pas assez d’argent pour changeid')
        end
    end
end)




lib.callback.register('ducrachat:getOptions', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    print("[DEBUG GET OPTIONS]", source, xPlayer and xPlayer.identifier)
    if not xPlayer then return {} end
    local identifier = xPlayer.identifier
    local row = MySQL.single.await('SELECT can_read, delay_override FROM ducrachat_users WHERE identifier = ?', {identifier})
    return row or { can_read = 0, delay_override = 600 }
end)



RegisterCommand('ducra_debug_setdelay', function(source, args)
    local identifier = args[1]
    local newDelay = tonumber(args[2]) or 0
    print("[DEBUG] TEST SET DELAY", identifier, newDelay)
    local res = MySQL.update.await('UPDATE ducrachat_users SET delay_override = ? WHERE identifier = ?', {newDelay, identifier})
    print("[DEBUG SQL UPDATE RESULT]", res)
end, true)

--TEST NOTIFICATION
--RegisterCommand('testnui', function(source)
--    TriggerClientEvent('ducrachat:showNotif', source, "Test notification côté NUI !", "success")
--end, false)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
