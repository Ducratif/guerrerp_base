--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports['es_extended']:getSharedObject()
-----------------------------
-----------------------------
-----------------------------
-----------------------------

local adminIdentifiers = {
    ['char1:cf872e2dbff1cf3152fff72b147ca07238315148'] = true,
}
-----------------------------
-----------------------------
-----------------------------
-----------------------------

--ID DES ITEMS POUR LE DEFI: AVOIR X ITEM POUR DEBLOQUER LE DEFI
local SaisonpassItemMapping = {
    [1] = "phone",
    [2] = "water",
    -- etc, tu fais ce mapping toi-même
}
-----------------------------
-----------------------------
--Classement des raretés (pour le défi ouvrir une caisse avec un objet de X rareté)
local LootboxRarityMapping = {
    [1] = 'common',
    [2] = 'rare',
    [3] = 'epic',
    [4] = 'legendaire'
}
-- et l’inverse pour le lookup rapide :
local LootboxRarityReverse = {
    common = 1,
    rare = 2,
    epic = 3,
    legendaire = 4
}
-----------------------------
-----------------------------
local SaisonpassVehicleMapping = {
    [1] = "adder",
    [2] = "sultan",
    [3] = "zentorno",
    -- etc, complète comme tu veux !
}
--Véhicule + KM
local SaisonpassVehiclekmMapping = {
    [1] = { name = "adder", distance = 1000 }, -- 1km
    [2] = { name = "sultan", distance = 2000 }, -- 2km, etc.
}

-----------------------------
-----------------------------
--Rester dans la zone pendant X temps
local SaisonpassZoneMapping = {
    [1] = { coords = vector3(-1827.6046, -777.6716, 8.0848), radius = 200, time = 10 }, -- 180 secondes = 3min
    --[2] = { coords = vector3(1000, 1000, 40), radius = 100, time = 300 },
    -- etc.
}


-----------------------------
-----------------------------
-----------------------------
-----------------------------
lib.callback.register('ducratif_lootbox:isAdmin', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end
    return adminIdentifiers[xPlayer.identifier] or false
end)

-----------------------------
-----------------------------
-----------------------------
-----------------------------
lib.callback.register('ducratif_lootbox:adminGetBoxes', function(cb, source)
    local data = MySQL.query.await('SELECT * FROM lootboxes ORDER BY id DESC')
    if type(cb) ~= 'function' then
        print('[ERREUR] cb est nil ou non une fonction')
        return
    end
    cb(data)
end)
-----------------------------
-----------------------------
-----------------------------
-----------------------------

CreateThread(function()
    Wait(1000)
    print('[DEBUG] ox_lib est prêt ? ', lib and lib.callback and 'OK' or 'MISSING')
end)


-----------------------------
-----------------------------
-----------------------------
-----------------------------

lib.callback.register('ducratif_lootbox:adminToggleBox', function(cb, source, data)
    if type(cb) ~= 'function' then
        print('[ERREUR] cb est nil ou non une fonction')
        return
    end

    MySQL.update.await('UPDATE lootboxes SET is_active = ? WHERE id = ?', { data.state, data.id })
    cb({})
end)
-----------------------------
-----------------------------
-----------------------------
-----------------------------
lib.callback.register('ducratif_lootbox:adminDeleteBox', function(cb, source, data)
    if type(cb) ~= 'function' then
        print('[ERREUR] cb est nil ou non une fonction')
        return
    end
    MySQL.query.await('DELETE FROM lootboxes WHERE id = ?', { data.id })
    cb({})
end)
-----------------------------
-----------------------------
-----------------------------
-----------------------------
lib.callback.register('ducratif_lootbox:adminGetLogs', function(cb, source, data)
    if type(cb) ~= 'function' then
        print('[ERREUR] cb est nil ou non une fonction')
        return
    end
    local where, params = '1=1', {}

    if data.player and data.player ~= '' then
        where = where .. ' AND buyer_identifier LIKE ?'
        table.insert(params, '%' .. data.player .. '%')
    end

    if data.team and tonumber(data.team) then
        where = where .. ' AND team_id = ?'
        table.insert(params, tonumber(data.team))
    end

    local logs = MySQL.query.await([[SELECT h.*, b.name AS box_name FROM lootbox_history h JOIN lootboxes b ON b.id = h.lootbox_id WHERE ]] .. where .. [[ ORDER BY h.bought_at DESC LIMIT 100]], params)
    cb(logs)
end)
-----------------------------
-----------------------------
-----------------------------
-----------------------------
lib.callback.register('ducratif_lootbox:adminSaveBox', function(cb, source, data)
    if type(cb) ~= 'function' then
        print('[ERREUR] cb est nil ou non une fonction')
        return
    end
    local boxId = data.id

    local tags = {}
    if data.tags and data.tags ~= '' then
        for tag in string.gmatch(data.tags, '([^,]+)') do
            table.insert(tags, tag:match('^%s*(.-)%s*$'))
        end
    end

    if boxId then
        MySQL.update.await([[UPDATE lootboxes SET name = ?, short_description = ?, long_description = ?, image_url = ?, is_active = ?, is_random = ?, category = ?, tags = ? WHERE id = ?]], {
            data.name, data.short_description, data.long_description, data.image_url,
            data.is_active, data.is_random, data.category, json.encode(tags), boxId
        })

        MySQL.query.await('DELETE FROM lootbox_contents WHERE lootbox_id = ?', { boxId })
        MySQL.query.await('DELETE FROM lootbox_payments WHERE lootbox_id = ?', { boxId })
    else
        boxId = MySQL.insert.await([[INSERT INTO lootboxes (name, short_description, long_description, image_url, is_active, is_random, category, tags) VALUES (?, ?, ?, ?, ?, ?, ?, ?)]], {
            data.name, data.short_description, data.long_description, data.image_url,
            data.is_active, data.is_random, data.category, json.encode(tags)
        })
    end

    for _, item in ipairs(data.contents or {}) do
        MySQL.insert.await('INSERT INTO lootbox_contents (lootbox_id, item_name, amount, rarity) VALUES (?, ?, ?, ?)', {
            boxId, item.item_name, item.amount, item.rarity
        })
    end

    for _, pay in ipairs(data.payments or {}) do
        MySQL.insert.await('INSERT INTO lootbox_payments (lootbox_id, payment_type, payment_value) VALUES (?, ?, ?)', {
            boxId, pay.payment_type, pay.payment_value
        })
    end

    cb({})
end)
-----------------------------
-----------------------------
-----------------------------
-----------------------------
lib.callback.register('ducratif_lootbox:adminGetBoxDetails', function(cb, source, data)
    if type(cb) ~= 'function' then
        print('[ERREUR] cb est nil ou non une fonction')
        return
    end
    local boxId = data.id
    local box = MySQL.single.await('SELECT * FROM lootboxes WHERE id = ?', { boxId })
    if not box then return cb({}) end

    local contents = MySQL.query.await('SELECT * FROM lootbox_contents WHERE lootbox_id = ?', { boxId })
    local payments = MySQL.query.await('SELECT * FROM lootbox_payments WHERE lootbox_id = ?', { boxId })

    cb({ box = box, contents = contents, payments = payments })
end)
-----------------------------
-----------------------------
-----------------------------
-----------------------------
lib.callback.register('ducratif_lootbox:adminDuplicateBox', function(cb, source, data)
    if type(cb) ~= 'function' then
        print('[ERREUR] cb est nil ou non une fonction')
        return
    end
    local originalId = data.id
    local box = MySQL.single.await('SELECT * FROM lootboxes WHERE id = ?', { originalId })
    if not box then return cb({ success = false }) end

    local newBoxId = MySQL.insert.await([[INSERT INTO lootboxes (name, short_description, long_description, image_url, is_active, is_random) VALUES (?, ?, ?, ?, 0, ?)]], {
        box.name .. ' (copie)', box.short_description, box.long_description, box.image_url, box.is_random
    })

    local contents = MySQL.query.await('SELECT * FROM lootbox_contents WHERE lootbox_id = ?', { originalId })
    for _, c in ipairs(contents) do
        MySQL.insert.await('INSERT INTO lootbox_contents (lootbox_id, item_name, amount, rarity) VALUES (?, ?, ?, ?)', {
            newBoxId, c.item_name, c.amount, c.rarity
        })
    end

    local payments = MySQL.query.await('SELECT * FROM lootbox_payments WHERE lootbox_id = ?', { originalId })
    for _, p in ipairs(payments) do
        MySQL.insert.await('INSERT INTO lootbox_payments (lootbox_id, payment_type, payment_value) VALUES (?, ?, ?)', {
            newBoxId, p.payment_type, p.payment_value
        })
    end

    cb({
        success = true,
        box = {
            id = newBoxId,
            name = box.name,
            short_description = box.short_description,
            long_description = box.long_description,
            image_url = box.image_url,
            is_random = box.is_random
        },
        contents = contents,
        payments = payments
    })
end)
-----------------------------------------------------

-----------------------------
-----------------------------
-----------------------------
-----------------------------
lib.callback.register('ducratif_lootbox:getAllActiveBoxes', function(cb, source)
    local status, boxes = pcall(function()
        return MySQL.query.await('SELECT * FROM lootboxes WHERE is_active = 1')
    end)

    if not status then
        print('[ERREUR LOOTBOXES] =>', boxes)
        cb({})
        return
    end

    for _, box in ipairs(boxes) do
        local ok1, contents = pcall(function()
            return MySQL.query.await('SELECT item_name, amount, rarity FROM lootbox_contents WHERE lootbox_id = ?', { box.id })
        end)
        local ok2, payments = pcall(function()
            return MySQL.query.await('SELECT payment_type, payment_value FROM lootbox_payments WHERE lootbox_id = ?', { box.id })
        end)

        box.contents = ok1 and contents or {}
        box.payments = ok2 and payments or {}

        if box.tags and type(box.tags) == 'string' then
            local ok, decoded = pcall(json.decode, box.tags)
            box.tags = ok and decoded or {}
        else
            box.tags = {}
        end
    end

    return boxes --cb(boxes)
end)
-----------------------------
-----------------------------
-----------------------------
-----------------------------
--RegisterServerEvent('ducratif_lootbox:buyBox')
--AddEventHandler('ducratif_lootbox:buyBox', function(boxId)
--    local src = source
--    local xPlayer = ESX.GetPlayerFromId(src)
--    if not xPlayer then return end
--
--    local identifier = xPlayer.identifier
--    local box = MySQL.single.await('SELECT * FROM lootboxes WHERE id = ? AND is_active = 1', { boxId })
--    if not box then return TriggerClientEvent('ox_lib:notify', src, { description = "Caisse introuvable.", type = 'error' }) end
--
--    local payments = MySQL.query.await('SELECT * FROM lootbox_payments WHERE lootbox_id = ?', { boxId })
--    local canPay, usedPayment = false, nil
--
--    for _, pay in ipairs(payments) do
--        if pay.payment_type == 'money' and xPlayer.getMoney() >= tonumber(pay.payment_value) then
--            xPlayer.removeMoney(tonumber(pay.payment_value))
--            canPay, usedPayment = true, 'money'
--            break
--        elseif pay.payment_type == 'item' and xPlayer.getInventoryItem(pay.payment_value).count >= 1 then
--            xPlayer.removeInventoryItem(pay.payment_value, 1)
--            canPay, usedPayment = true, 'item'
--            break
--        elseif pay.payment_type == 'player_points' then
--    local points = MySQL.scalar.await('SELECT score FROM paintball_players WHERE identifier = ?', { identifier }) or 0
--    print('[DEBUG] Points actuels:', points, 'Requis:', pay.payment_value)
--    if points >= tonumber(pay.payment_value) then
--        MySQL.update.await('UPDATE paintball_players SET score = GREATEST(score - ?, 0) WHERE identifier = ?', { tonumber(pay.payment_value), identifier })
--        canPay, usedPayment = true, 'player_points'
--        break
--    end
--
--        elseif pay.payment_type == 'team_points' then
--            local team = MySQL.single.await([[
--                SELECT pt.id as team_id, pt.owner_identifier, pt.score
--                FROM paintball_players pp
--                JOIN paintball_teams pt ON pp.team_id = pt.id
--                WHERE pp.identifier = ?
--            ]], { identifier })
--        
--            if team and team.owner_identifier == identifier then
--                if team.score >= tonumber(pay.payment_value) then
--                    -- Retirer les points
--                    MySQL.update.await('UPDATE paintball_teams SET score = score - ? WHERE id = ?', { tonumber(pay.payment_value), team.team_id })
--                
--                    -- Donner une récompense à tous les membres de l'équipe
--                    local members = MySQL.query.await('SELECT identifier FROM paintball_players WHERE team_id = ?', { team.team_id })
--                    for _, member in ipairs(members) do
--                        MySQL.insert.await('INSERT INTO lootbox_rewards (player_identifier, lootbox_id, redeemed) VALUES (?, ?, 0)', { member.identifier, boxId })
--                    end
--                
--                    -- Historique
--                    MySQL.insert.await('INSERT INTO lootbox_history (buyer_identifier, lootbox_id, team_id, payment_type, items_given) VALUES (?, ?, ?, ?, ?)', {
--                        identifier, boxId, team.team_id, 'team_points', 'Récompense différée'
--                    })
--                    CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'open_lootbox')
--                    OnPlayerOpenLootbox(xPlayer.identifier, boxId)
--                    return TriggerClientEvent('ox_lib:notify', src, {
--                        title = 'Caisse achetée',
--                        description = 'Tous les membres de l’équipe peuvent récupérer leur caisse.',
--                        type = 'success'
--                    })
--                    
--                end
--            end
--        end
--
--    end
--
--    if not canPay then
--        return TriggerClientEvent('ox_lib:notify', src, { description = 'Tu ne peux pas acheter cette caisse.', type = 'error' })
--    end
--
--    local items = MySQL.query.await('SELECT item_name, amount FROM lootbox_contents WHERE lootbox_id = ?', { boxId })
--    for _, item in ipairs(items) do
--        xPlayer.addInventoryItem(item.item_name, item.amount)
--    end
--    MySQL.insert.await('INSERT INTO lootbox_history (buyer_identifier, lootbox_id, team_id, payment_type, items_given) VALUES (?, ?, NULL, ?, ?)', {
--        identifier, boxId, usedPayment, json.encode(items)
--    })
--    CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'open_lootbox')
--    OnPlayerOpenLootbox(xPlayer.identifier, boxId)
--    TriggerClientEvent('ox_lib:notify', src, { title = 'Caisse ouverte', description = 'Les objets ont été ajoutés à ton inventaire.', type = 'success' })
--end)

RegisterServerEvent('ducratif_lootbox:buyBox')
AddEventHandler('ducratif_lootbox:buyBox', function(boxId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local identifier = xPlayer.identifier
    local box = MySQL.single.await('SELECT * FROM lootboxes WHERE id = ? AND is_active = 1', { boxId })
    if not box then return TriggerClientEvent('ox_lib:notify', src, { description = "Caisse introuvable.", type = 'error' }) end

    local payments = MySQL.query.await('SELECT * FROM lootbox_payments WHERE lootbox_id = ?', { boxId })
    local canPay, usedPayment = false, nil

    for _, pay in ipairs(payments) do
        if pay.payment_type == 'money' and xPlayer.getMoney() >= tonumber(pay.payment_value) then
            xPlayer.removeMoney(tonumber(pay.payment_value))
            canPay, usedPayment = true, 'money'
            break
        elseif pay.payment_type == 'item' and xPlayer.getInventoryItem(pay.payment_value).count >= 1 then
            xPlayer.removeInventoryItem(pay.payment_value, 1)
            canPay, usedPayment = true, 'item'
            break
        elseif pay.payment_type == 'player_points' then
    local points = MySQL.scalar.await('SELECT score FROM paintball_players WHERE identifier = ?', { identifier }) or 0
    print('[DEBUG] Points actuels:', points, 'Requis:', pay.payment_value)
    if points >= tonumber(pay.payment_value) then
        MySQL.update.await('UPDATE paintball_players SET score = GREATEST(score - ?, 0) WHERE identifier = ?', { tonumber(pay.payment_value), identifier })
        canPay, usedPayment = true, 'player_points'
        break
    end

        elseif pay.payment_type == 'team_points' then
            local team = MySQL.single.await([[
                SELECT pt.id as team_id, pt.owner_identifier, pt.score
                FROM paintball_players pp
                JOIN paintball_teams pt ON pp.team_id = pt.id
                WHERE pp.identifier = ?
            ]], { identifier })
        
            if team and team.owner_identifier == identifier then
                if team.score >= tonumber(pay.payment_value) then
                    -- Retirer les points
                    MySQL.update.await('UPDATE paintball_teams SET score = score - ? WHERE id = ?', { tonumber(pay.payment_value), team.team_id })
                
                    -- Donner une récompense à tous les membres de l'équipe
                    local members = MySQL.query.await('SELECT identifier FROM paintball_players WHERE team_id = ?', { team.team_id })
                    for _, member in ipairs(members) do
                        MySQL.insert.await('INSERT INTO lootbox_rewards (player_identifier, lootbox_id, redeemed) VALUES (?, ?, 0)', { member.identifier, boxId })
                    end
                
                    -- Historique
                    MySQL.insert.await('INSERT INTO lootbox_history (buyer_identifier, lootbox_id, team_id, payment_type, items_given) VALUES (?, ?, ?, ?, ?)', {
                        identifier, boxId, team.team_id, 'team_points', 'Récompense différée'
                    })
                    CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'open_lootbox')
                    OnPlayerOpenLootbox(xPlayer.identifier, boxId)
                    return TriggerClientEvent('ox_lib:notify', src, {
                        title = 'Caisse achetée',
                        description = 'Tous les membres de l’équipe peuvent récupérer leur caisse.',
                        type = 'success'
                    })
                    
                end
            end
        end

    end

    if not canPay then
        return TriggerClientEvent('ox_lib:notify', src, { description = 'Tu ne peux pas acheter cette caisse.', type = 'error' })
    end

    -- On va chercher les objets de la box AVEC la rareté
    local items = MySQL.query.await('SELECT item_name, amount, rarity FROM lootbox_contents WHERE lootbox_id = ?', { boxId })
    for _, item in ipairs(items) do
        xPlayer.addInventoryItem(item.item_name, item.amount)
    end

    -- Validation du défi saison pass “trouver rareté X”
    -- 1. On récupère tous les défis de ce type
    local lootChallenges = MySQL.query.await(
        'SELECT `key`, `data` FROM lootbox_saisonpass_challenges WHERE `key` LIKE "find_%_loot" AND `type` = "action"'
    )
    if lootChallenges then
        for _, challenge in ipairs(lootChallenges) do
            local requiredRarity = LootboxRarityMapping[tonumber(challenge.data)]
            for _, item in ipairs(items) do
                if item.rarity == requiredRarity then
                    CheckAndAdvanceSaisonLevel(identifier, challenge.key)
                    break -- On ne valide qu'une fois par défi, pas besoin de continuer
                end
            end
        end
    end

    MySQL.insert.await('INSERT INTO lootbox_history (buyer_identifier, lootbox_id, team_id, payment_type, items_given) VALUES (?, ?, NULL, ?, ?)', {
        identifier, boxId, usedPayment, json.encode(items)
    })

    CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'open_lootbox')
    OnPlayerOpenLootbox(xPlayer.identifier, boxId)
    TriggerClientEvent('ox_lib:notify', src, { title = 'Caisse ouverte', description = 'Les objets ont été ajoutés à ton inventaire.', type = 'success' })

end)
-----------------------------
-----------------------------
-----------------------------
-----------------------------
lib.callback.register('ducratif_lootbox:getRewards', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return {} end
    local identifier = xPlayer.identifier
    return MySQL.query.await([[SELECT r.id as reward_id, b.name, b.short_description FROM lootbox_rewards r JOIN lootboxes b ON b.id = r.lootbox_id WHERE r.player_identifier = ? AND r.redeemed = 0]], { identifier })
end)
-----------------------------
-----------------------------
-----------------------------
-----------------------------
RegisterServerEvent('ducratif_lootbox:claimReward')
AddEventHandler('ducratif_lootbox:claimReward', function(rewardId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local identifier = xPlayer.identifier
    local reward = MySQL.single.await([[SELECT lootbox_id FROM lootbox_rewards WHERE id = ? AND player_identifier = ? AND redeemed = 0]], { rewardId, identifier })
    if not reward then return TriggerClientEvent('ox_lib:notify', src, { description = 'Récompense invalide ou déjà réclamée.', type = 'error' }) end

    local contents = MySQL.query.await('SELECT item_name, amount FROM lootbox_contents WHERE lootbox_id = ?', { reward.lootbox_id })
    for _, item in ipairs(contents) do
        xPlayer.addInventoryItem(item.item_name, item.amount)
    end
    MySQL.update.await('UPDATE lootbox_rewards SET redeemed = 1 WHERE id = ?', { rewardId })
    TriggerClientEvent('ox_lib:notify', src, { title = '🎁 Caisse ouverte', description = 'Les objets ont été ajoutés à ton inventaire.', type = 'success', duration = 10000 })
end)
-----------------------------
-----------------------------
-----------------------------
-----------------------------

--System d'historique de caisse
lib.callback.register('ducratif_lootbox:getLootboxHistory', function(source, data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then
        print("[ERREUR] xPlayer introuvable pour source:", src)
        return {}
    end

    local identifier = xPlayer.identifier
    local page = data.page or 1
    local limit = 50
    local offset = (page - 1) * limit

    print("[DEBUG] Demande d'historique par :", GetPlayerName(src))
    print("[DEBUG] Identifiant utilisé :", identifier)
    print("[DEBUG] ownOnly :", data.ownOnly, "| page :", page)

    local query = [[
        SELECT lh.*, lb.name AS box_name, u.firstname
        FROM lootbox_history lh
        JOIN lootboxes lb ON lb.id = lh.lootbox_id
        JOIN users u ON u.identifier = CONVERT(lh.buyer_identifier USING utf8mb4) COLLATE utf8mb4_uca1400_ai_ci
        %s
        ORDER BY lh.id DESC
        LIMIT ? OFFSET ?
    ]]

    local filter = data.ownOnly and "WHERE lh.buyer_identifier = ?" or ""
    local finalQuery = query:format(filter)

    local results
    if data.ownOnly then
        results = MySQL.query.await(finalQuery, {identifier, limit, offset})
    else
        results = MySQL.query.await(finalQuery, {limit, offset})
    end

    if not results then
        print("[DEBUG] Aucun résultat trouvé pour l'historique")
        return {}
    end

    for _, entry in pairs(results) do
        local ms = tonumber(entry.bought_at)
        if ms then
            local seconds = math.floor(ms / 1000)
            entry.formatted_date = os.date("%A %d %B %Y à %Hh%M", seconds)
        else
            entry.formatted_date = "??/??/???? | ??:??"
        end
    end



    --print("[DEBUG] Résultat envoyé à NUI :", json.encode(results))
    return results
end)




-----
-----
lib.callback.register('ducratif_lootbox:getTopBuyers', function(source, _)
    local results = MySQL.query.await([[
        SELECT u.firstname, COUNT(*) AS total
        FROM lootbox_history h
        JOIN users u ON u.identifier = CONVERT(h.buyer_identifier USING utf8mb4) COLLATE utf8mb4_uca1400_ai_ci
        GROUP BY h.buyer_identifier
        ORDER BY total DESC
        LIMIT 20
    ]])

    if not results then
        print("[DEBUG] Aucun acheteur trouvé")
        return {}
    end

    print("[DEBUG] Top acheteurs :", json.encode(results))
    return results
end)





-----------------------------
-----------------------------
-----------------------------
-----------------------------
lib.callback.register('ducratif_lootbox:getSaisonPasse', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        print("[SaisonPasse] ERREUR: xPlayer introuvable pour source:", source)
        return {}
    end

    local identifier = xPlayer.identifier
    local now = os.date('%Y-%m-%d %H:%M:%S')

    -- Saison active
    local saison = MySQL.single.await([[
        SELECT * FROM lootbox_saisonpasse
        WHERE start_date <= ? AND end_date >= ?
        LIMIT 1
    ]], { now, now })

    if not saison then
        local nextSaison = MySQL.single.await([[
            SELECT start_date FROM lootbox_saisonpasse
            WHERE start_date > ?
            ORDER BY start_date ASC
            LIMIT 1
        ]], { now })

        return {
            active = false,
            next_date = nextSaison and nextSaison.start_date or nil
        }
    end

    local user = MySQL.single.await([[
        SELECT current_level FROM lootbox_saisonpass_user
        WHERE identifier = ? AND saison_id = ?
    ]], { identifier, saison.id }) or { current_level = 0 }

    local userLevel = user.current_level

    local claimRows = MySQL.query.await([[
        SELECT level FROM lootbox_saisonpass_claims
        WHERE identifier = ? AND saison_id = ?
    ]], { identifier, saison.id })

    local claimedRewards = {}
    for _, row in ipairs(claimRows) do
        table.insert(claimedRewards, row.level)
    end

    local rewards = MySQL.query.await([[
        SELECT r.*, c.label as challenge_label
        FROM lootbox_saisonpass_rewards r
        LEFT JOIN lootbox_saisonpass_challenges c ON r.challenge_key = c.key
        WHERE r.saison_id = ?
        ORDER BY r.level ASC
    ]], { saison.id })

    local nextClaimableLevel = nil
    for i = 1, userLevel do
        local alreadyClaimed = false
        for _, lvl in ipairs(claimedRewards) do
            if lvl == i then
                alreadyClaimed = true
                break
            end
        end
        if not alreadyClaimed then
            nextClaimableLevel = i
            break
        end
    end

    return {
        active = true,
        saison = saison,
        rewards = rewards,
        user_level = userLevel,
        claims = claimedRewards,
        next_claimable = nextClaimableLevel
    }
end)

-----------------------------
-----------------------------
-----------------------------
-----------------------------




-----------------------------
-----------------------------
-----------------------------
-----------------------------
--lib.callback.register('ducratif_lootbox:claimSaisonReward', function(source, data, cb)
--    local respond = type(cb) == "function" and cb or function() end
--
--    if type(data) ~= "table" then
--        print('[SaisonPasse] ❌ "data" est nil ou invalide')
--        return respond(false)
--    end
--
--    local xPlayer = ESX.GetPlayerFromId(source)
--    if not xPlayer then return respond(false) end
--
--    local identifier = xPlayer.identifier
--    local requestedLevel = tonumber(data.level)
--    if not requestedLevel then return respond(false) end
--
--    local now = os.date('%Y-%m-%d %H:%M:%S')
--    local saison = MySQL.single.await('SELECT * FROM lootbox_saisonpasse WHERE start_date <= ? AND end_date >= ? LIMIT 1', { now, now })
--    if not saison then return respond(false) end
--
--    local user = MySQL.single.await('SELECT current_level FROM lootbox_saisonpass_user WHERE identifier = ? AND saison_id = ?', { identifier, saison.id }) or { current_level = 0 }
--
--    if requestedLevel > user.current_level then return respond(false) end
--
--    local claimed = MySQL.query.await('SELECT level FROM lootbox_saisonpass_claims WHERE identifier = ? AND saison_id = ?', { identifier, saison.id })
--    local claimedMap = {}
--    for _, row in ipairs(claimed) do claimedMap[row.level] = true end
--
--    for i = 1, requestedLevel - 1 do
--        if not claimedMap[i] then return respond(false) end
--    end
--
--    if claimedMap[requestedLevel] then return respond(false) end
--
--    local reward = MySQL.single.await('SELECT * FROM lootbox_saisonpass_rewards WHERE saison_id = ? AND level = ?', { saison.id, requestedLevel }) or {}
--    if not reward.reward_type then return respond(false) end
--
--    -- 🔥 Nouvelle logique pour have_item : validation ET retrait au claim
--    if reward.reward_type == 'have_item' then
--        local itemIndex = tonumber(reward.reward_value)
--        local itemName = haveItemMapping[itemIndex]
--        local itemCount = xPlayer.getInventoryItem(itemName)?.count or 0
--        if not itemName or itemCount < 1 then
--            TriggerClientEvent('ox_lib:notify', source, {
--                title = '❌ Objet manquant',
--                description = ('Tu dois avoir %s dans ton inventaire pour réclamer cette récompense.'):format(itemName or "l\'objet requis"),
--                type = 'error'
--            })
--            return respond(false)
--        end
--
--        -- ✅ On valide manuellement le niveau côté SQL (à la place du thread)
--        MySQL.update.await(
--            'UPDATE lootbox_saisonpass_user SET current_level = ? WHERE identifier = ? AND saison_id = ?',
--            { requestedLevel, identifier, saison.id }
--        )
--
--        -- On retire l’item ici :
--        xPlayer.removeInventoryItem(itemName, 1)
--    end
--
--    if reward.reward_type == 'item' then
--        xPlayer.addInventoryItem(reward.reward_value, reward.amount or 1)
--    elseif reward.reward_type == 'money' then
--        xPlayer.addAccountMoney('money', reward.amount or 1)
--    elseif reward.reward_type == 'points' then
--        -- logique perso si tu veux
--    elseif reward.reward_type ~= 'have_item' then
--        return respond(false)
--    end
--
--    MySQL.insert.await('INSERT INTO lootbox_saisonpass_claims (identifier, saison_id, level) VALUES (?, ?, ?)', {
--        identifier, saison.id, requestedLevel
--    })
--
--    LogSaisonPassEvent(identifier, saison.id, 'claim', ('Level %s (%s x%d)'):format(requestedLevel, reward.reward_value, reward.amount or 1))
--    TriggerClientEvent('ox_lib:notify', source, {
--        title = '🎁 Récompense récupérée',
--        description = ('Tu as récupéré la récompense du niveau %s.'):format(requestedLevel),
--        type = 'success',
--        duration = 10000
--    })
--
--    respond(true)
--end)


lib.callback.register('ducratif_lootbox:claimSaisonReward', function(source, data, cb)
    local respond = type(cb) == "function" and cb or function() end

    if type(data) ~= "table" then
        print('[SaisonPasse] ❌ "data" est nil ou invalide')
        return respond(false)
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return respond(false) end

    local identifier = xPlayer.identifier
    local requestedLevel = tonumber(data.level)
    if not requestedLevel then return respond(false) end

    local now = os.date('%Y-%m-%d %H:%M:%S')
    local saison = MySQL.single.await('SELECT * FROM lootbox_saisonpasse WHERE start_date <= ? AND end_date >= ? LIMIT 1', { now, now })
    if not saison then return respond(false) end

    local user = MySQL.single.await('SELECT current_level FROM lootbox_saisonpass_user WHERE identifier = ? AND saison_id = ?', { identifier, saison.id }) or { current_level = 0 }

    if requestedLevel > user.current_level then return respond(false) end

    local claimed = MySQL.query.await('SELECT level FROM lootbox_saisonpass_claims WHERE identifier = ? AND saison_id = ?', { identifier, saison.id })
    local claimedMap = {}
    for _, row in ipairs(claimed) do claimedMap[row.level] = true end

    for i = 1, requestedLevel - 1 do
        if not claimedMap[i] then return respond(false) end
    end

    if claimedMap[requestedLevel] then return respond(false) end

    local reward = MySQL.single.await('SELECT * FROM lootbox_saisonpass_rewards WHERE saison_id = ? AND level = ?', { saison.id, requestedLevel }) or {}
    if not reward.reward_type then return respond(false) end

    -- 🔥 Nouvelle logique pour have_item : validation ET retrait au claim
    if reward.reward_type == 'have_item' then
        local itemIndex = tonumber(reward.reward_value)
        local itemName = haveItemMapping[itemIndex]
        local itemCount = xPlayer.getInventoryItem(itemName)?.count or 0
        if not itemName or itemCount < 1 then
            TriggerClientEvent('ox_lib:notify', source, {
                title = '❌ Objet manquant',
                description = ('Tu dois avoir %s dans ton inventaire pour réclamer cette récompense.'):format(itemName or "l\'objet requis"),
                type = 'error'
            })
            return respond(false)
        end

        -- ✅ On valide manuellement le niveau côté SQL (à la place du thread)
        MySQL.update.await(
            'UPDATE lootbox_saisonpass_user SET current_level = ? WHERE identifier = ? AND saison_id = ?',
            { requestedLevel, identifier, saison.id }
        )

        -- On retire l’item ici :
        xPlayer.removeInventoryItem(itemName, 1)
    end

    if reward.reward_type == 'item' then
        xPlayer.addInventoryItem(reward.reward_value, reward.amount or 1)
    elseif reward.reward_type == 'money' then
        xPlayer.addAccountMoney('money', reward.amount or 1)
    elseif reward.reward_type == 'points' then
        -- logique perso si tu veux
    elseif reward.reward_type ~= 'have_item' then
        return respond(false)
    end

    MySQL.insert.await('INSERT INTO lootbox_saisonpass_claims (identifier, saison_id, level) VALUES (?, ?, ?)', {
        identifier, saison.id, requestedLevel
    })

    LogSaisonPassEvent(identifier, saison.id, 'claim', ('Level %s (%s x%d)'):format(requestedLevel, reward.reward_value, reward.amount or 1))
    TriggerClientEvent('ox_lib:notify', source, {
        title = '🎁 Récompense récupérée',
        description = ('Tu as récupéré la récompense du niveau %s.'):format(requestedLevel),
        type = 'success',
        duration = 10000
    })

    respond(true)
end)




-----------------------------
-----------------------------
-----------------------------
-----------------------------
function CheckAndAdvanceSaisonLevel(identifier, challengeKey)
    local now = os.date('%Y-%m-%d %H:%M:%S')
    local saison = MySQL.single.await('SELECT * FROM lootbox_saisonpasse WHERE start_date <= ? AND end_date >= ? LIMIT 1', { now, now })
    if not saison then return end

    local user = MySQL.single.await('SELECT * FROM lootbox_saisonpass_user WHERE identifier = ? AND saison_id = ?', { identifier, saison.id })
    if not user then
        MySQL.insert.await('INSERT INTO lootbox_saisonpass_user (identifier, saison_id, current_level) VALUES (?, ?, ?)', {
            identifier, saison.id, 0
        })
        user = { current_level = 0 }
    end

    local nextLevel = user.current_level + 1

    local nextReward = MySQL.single.await('SELECT * FROM lootbox_saisonpass_rewards WHERE saison_id = ? AND level = ?', { saison.id, nextLevel })
    if not nextReward then return end

    if nextReward.challenge_key ~= challengeKey then return end

    -- Valide et augmente le niveau
    MySQL.update.await('UPDATE lootbox_saisonpass_user SET current_level = ? WHERE identifier = ? AND saison_id = ?', {
        nextLevel, identifier, saison.id
    })

    -- Log l’évènement
    LogSaisonPassEvent(identifier, saison.id, 'progression', ('Défi validé : %s → Niveau %s'):format(challengeKey, nextLevel))

    -- Envoi la notif s'il est connecté
    local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
    if xPlayer then
        local src = xPlayer.source
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Récompense débloquée',
            description = ('Tu as débloqué une récompense (niveau %s) dans le passe de saison. Va la réclamer !'):format(nextLevel),
            type = 'inform',
            duration = 10000
        })
    end
end


-----------------------------
-----------------------------
-----------------------------
-----------------------------
--APPELER LES LOGS
function LogSaisonPassEvent(identifier, saisonId, eventType, details)
    MySQL.insert.await('INSERT INTO lootbox_saisonpass_logs (identifier, saison_id, event, details) VALUES (?, ?, ?, ?)', {
        identifier, saisonId, eventType, details
    })
end

-----------------------------
-----------------------------
-----------------------------
-----------------------------
CreateThread(function()
    Wait(1000) -- laisse le serveur initialiser les connexions SQL

    local now = os.date('%Y-%m-%d %H:%M:%S')
    local expired = MySQL.query.await('SELECT id FROM lootbox_saisonpasse WHERE end_date < ?', { now })

    for _, saison in ipairs(expired) do
        print(('[SaisonPasse] Nettoyage de la saison terminée ID %s...'):format(saison.id))

        MySQL.update.await('DELETE FROM lootbox_saisonpass_user WHERE saison_id = ?', { saison.id })
        MySQL.update.await('DELETE FROM lootbox_saisonpass_claims WHERE saison_id = ?', { saison.id })

        -- Tu peux logger ceci si tu veux garder une trace serveur
        MySQL.insert.await('INSERT INTO lootbox_saisonpass_logs (identifier, saison_id, event, details) VALUES (?, ?, ?, ?)', {
            'system', saison.id, 'cleanup', 'Suppression des données utilisateurs (fin de saison)'
        })
    end
end)

-----------------------------
-----------------------------
-----------------------------
-----------------------------
--📌 Défi kill_player
AddEventHandler('esx:onPlayerDeath', function(victimId, killerId, reason)
    if killerId and killerId ~= victimId then
        local xKiller = ESX.GetPlayerFromId(killerId)
        if xKiller then
            CheckAndAdvanceSaisonLevel(xKiller.identifier, 'kill_player')
        end
    end
end)
-----------------------------
--⏱️ Défi play_minute
CreateThread(function()
    while true do
        Wait(60000) -- 1 minute
        for _, playerId in ipairs(GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(tonumber(playerId))
            if xPlayer then
                CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'play_minute')
            end
        end
    end
end)

------------------------------------------
-- Visiter la zone apocalypse
-- Défi: Visiter la zone spécifique (50m de rayon)
local ZonesChallenges = {
    { key = 'visit_zone1', coords = vector3(1699.5299, 2600.4548, 45.5649), radius = 50.0 },
    -- { key = 'visit_zone2', coords = vector3(...), radius = 40.0 }, -- etc
}
local visitedZones = {}

CreateThread(function()
    while true do
        Wait(3000)
        for _, playerId in ipairs(GetPlayers()) do
            local src = tonumber(playerId)
            local xPlayer = ESX.GetPlayerFromId(src)
            if xPlayer then
                for _, zone in ipairs(ZonesChallenges) do
                    local uniqueKey = xPlayer.identifier .. zone.key
                    if not visitedZones[uniqueKey] then
                        local ped = GetPlayerPed(src)
                        if ped then
                            local pos = GetEntityCoords(ped)
                            if #(pos - zone.coords) < zone.radius then
                                visitedZones[uniqueKey] = true
                                CheckAndAdvanceSaisonLevel(xPlayer.identifier, zone.key)
                            end
                        end
                    end
                end
            end
        end
    end
end)
---------------------------------------------------------------
--défi de X km a pied et voiture
-- Nouvelle fonction qui utilise ta colonne "key"
local function getChallengeGoal(challenge_key)
    local row = MySQL.single.await(
        'SELECT data FROM lootbox_saisonpass_challenges WHERE `key` = ?', { challenge_key }
    )
    if row and row.data then
        return tonumber(row.data)
    end
    return nil
end

local validated = {}

RegisterNetEvent('caisse_shop:updateDistance')
AddEventHandler('caisse_shop:updateDistance', function(walk, drive)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local identifier = xPlayer.identifier

    -- Défi à pied
    local walk_goal = getChallengeGoal('walk_km')
    if walk_goal and not (validated[identifier] and validated[identifier].walk) and walk >= walk_goal then
        validated[identifier] = validated[identifier] or {}
        validated[identifier].walk = true
        CheckAndAdvanceSaisonLevel(identifier, 'walk_km')
    end

    -- Défi véhicule
    local drive_goal = getChallengeGoal('drive_km')
    if drive_goal and not (validated[identifier] and validated[identifier].drive) and drive >= drive_goal then
        validated[identifier] = validated[identifier] or {}
        validated[identifier].drive = true
        CheckAndAdvanceSaisonLevel(identifier, 'drive_km')
    end
end)

-----------------------------
--Défi ouvrir une caisse spécifique:

-- Cherche tous les défis de type "open_lootbox_x"
local function getSpecificBoxChallenges()
    return MySQL.query.await('SELECT `key`, `data` FROM lootbox_saisonpass_challenges WHERE `key` LIKE "open_lootbox_%" AND `type` = "action"')
end

-- Quand un joueur ouvre une box
function OnPlayerOpenLootbox(identifier, lootbox_id)
    -- Valide le défi classique (ouvrir X caisses)
    CheckAndAdvanceSaisonLevel(identifier, 'open_lootbox')

    -- Récupère tous les défis d'ouverture de caisse spécifique
    local specificChallenges = getSpecificBoxChallenges()
    for _, challenge in ipairs(specificChallenges) do
        if tostring(lootbox_id) == tostring(challenge.data) then
            -- Il a ouvert la caisse spécifique demandée !
            CheckAndAdvanceSaisonLevel(identifier, challenge.key)
        end
    end
end

---------------------------------------
--Avoir X item dans sont inventaire


--On check l'id de l'item depuis la table pour l'identifier
local function getItemNameById(itemId)
    local row = MySQL.single.await('SELECT name FROM items WHERE id = ?', { itemId })
    return row and row.name or nil
end

CreateThread(function()
    while true do
        Wait(10000) -- check toutes les 10 secondes (ajuste si tu veux)
        for _, playerId in ipairs(GetPlayers()) do
            local src = tonumber(playerId)
            local xPlayer = ESX.GetPlayerFromId(src)
            if not xPlayer then goto continue end
            local identifier = xPlayer.identifier

            -- On boucle sur tous les défis de type have_item
            for index, itemName in pairs(SaisonpassItemMapping) do
                local itemCount = xPlayer.getInventoryItem(itemName)?.count or 0
                if itemCount > 0 then
                    -- on valide le défi spécifique à cet item
                    CheckAndAdvanceSaisonLevel(identifier, 'have_item_'..index)
                end
            end

            ::continue::
        end
    end
end)

-- Check possession de l’item par ID
local function hasRequiredItemByIndex(xPlayer, challengeKey)
    local row = MySQL.single.await('SELECT data FROM lootbox_saisonpass_challenges WHERE `key` = ?', { challengeKey })
    if row and row.data then
        local index = tonumber(row.data)
        local itemName = SaisonpassItemMapping[index]
        if not itemName then return false end
        local count = xPlayer.getInventoryItem(itemName)?.count or 0
        return count > 0, itemName
    end
    return false
end


-------------------------------------------------------------------------
--Défi monter dans X véhicule
RegisterNetEvent('saisonpass:enteredVehicle')
AddEventHandler('saisonpass:enteredVehicle', function(carName)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local identifier = xPlayer.identifier

    -- On check tous les défis "enter_xxx"
    local challenges = MySQL.query.await(
        'SELECT `key`, `data` FROM lootbox_saisonpass_challenges WHERE `key` LIKE "enter_%" AND `type` = "action"'
    )
    for _, challenge in ipairs(challenges) do
        local wantedCar = SaisonpassVehicleMapping[tonumber(challenge.data)]
        if wantedCar and carName == wantedCar:lower() then
            CheckAndAdvanceSaisonLevel(identifier, challenge.key)
        end
    end
end)


---------------------------------------------------------------
--Défi voiture et a pied en X km
RegisterNetEvent('saisonpass:vehicleDistance')
AddEventHandler('saisonpass:vehicleDistance', function(carName, distance)

    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local identifier = xPlayer.identifier

    --print(('[SAISONPASS] %s : %d m dans %s'):format(identifier, distance, carName))

    local challenges = MySQL.query.await(
        'SELECT `key`, `data` FROM lootbox_saisonpass_challenges WHERE `key` LIKE "drive_%" AND `type` = "action"'
    )
        for _, challenge in ipairs(challenges) do
        local vehId = tonumber(challenge.data)
        local def = SaisonpassVehiclekmMapping[vehId]
        if def then
            local wantedCar = def.name
            local kmTarget = def.distance
            if wantedCar and carName == wantedCar:lower() and kmTarget > 0 and distance >= kmTarget then
                --print("[SAISONPASS] DEFIS VALIDÉ : "..identifier.." ("..challenge.key..")")
                CheckAndAdvanceSaisonLevel(identifier, challenge.key)
            end
        end
    end
end)

----------------------------------------------------------
-- 📦 Défi acheter_item_boutique (structure standard)
-- Quand un joueur achète un item en boutique, on check le défi associé

-- Ce handler est compatible ESX + ox_inventory (si besoin d'autre, dis-le !)
-- Handler universel pour valider le défi d’achat en boutique
RegisterNetEvent('saisonpass:checkItemBuyChallenge', function(src, itemName)
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then
        --print('[Defi shop] Pas de xPlayer pour src:', src)
        return
    end
    --print('[Defi shop] Achat detecté par', xPlayer.identifier, 'item:', itemName)
    CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'acheter_item_boutique')
end)



-- Ajoute le défi dans ta table lootbox_saisonpass_challenges :
-- INSERT INTO `lootbox_saisonpass_challenges` (`challenge_key`, `title`, `description`, ...) VALUES ('acheter_item_boutique', 'Acheter un article', 'Achète un article dans une boutique !', ...)


----------------------------------------------------------
--Acheter un vetement dans la boutique de vetement:
RegisterNetEvent('saisonpass:checkClothesChangeChallenge', function(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then
        --print('[Defi shop] Pas de xPlayer pour src:', src)
        return
    end
    --print('[Défi vêtements] Changement de tenue détecté par', xPlayer.identifier)
    CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'change_vetement')
end)

----------------------------------------------------------
--Défi: prendre un job temporaire (chauffeurpl/pecheur)

--CE CODE EST POUR LE CHANGEMENT DE JOB DE BASE (pas utiliser pour moi (autre script))
--RegisterNetEvent('esx:setJob', function(job)
--    local src = source
--    local xPlayer = ESX.GetPlayerFromId(src)
--    if not xPlayer then return end
--
--    -- Vérifie si le joueur prend le job "chauffeurpl" ou "pecheur"
--    local jobName = type(job) == "table" and job.name or job
--    if jobName == "chauffeurpl" or jobName == "pecheur" then
--        print('[Défi job] Job temporaire détecté pour', xPlayer.identifier, 'job:', jobName)
--        TriggerEvent('saisonpass:checkJobChangeChallenge', src, jobName)
--    end
--end)

-- Handler défi côté Saison Pass
RegisterNetEvent('saisonpass:checkJobChangeChallenge', function(src, jobName)
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    --print('[Défi job] Validation du défi pour', xPlayer.identifier, 'job:', jobName)
    CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'get_tempjob')
end)

----------------------------------------------------------
--Défi: Parler à un PNJ spécial
RegisterNetEvent('saisonpass:checkSpecialPnjChallenge', function(pnjKey)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    print(('[Défi PNJ] Dialogue avec %s terminé par %s'):format(pnjKey, xPlayer.identifier))
    -- Un défi différent par PNJ ? => adapte la clé
    CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'talk_' .. pnjKey)
end)


-------------------------------------------------------------
--Défi lié au market LBC
RegisterNetEvent('saisonpass:marketCreateChallenge', function(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'market_create')
end)

RegisterNetEvent('saisonpass:marketDeleteChallenge', function(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'market_delete')
end)

RegisterNetEvent('saisonpass:marketBuyChallenge', function(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'market_buy')
end)

RegisterNetEvent('saisonpass:marketSellChallenge', function(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'market_sell')
end)



----------------------------------------------------------

----------------------------------------------------------

----------------------------------------------------------

-----------------------------
--📦 Défi open_lootbox
--CheckAndAdvanceSaisonLevel(xPlayer.identifier, 'open_lootbox')
--Ce code est a ajouter au moment ou un joueur ouvre une caisse

-----------------------------
--✅ Tu veux en ajouter un autre ensuite ?
--Tu l’ajoutes dans ta table lootbox_saisonpass_challenges
--et il te suffira de faire :
--CheckAndAdvanceSaisonLevel(identifier, 'nouveau_defi')
-----------------------------

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
