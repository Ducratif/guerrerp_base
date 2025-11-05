--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports['es_extended']:getSharedObject()

------------------------------------------------------------
--ENVOIE DES POSITION AU CLIENT
------------------------------------------------------------------
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        print("Script debug gps_portable lancer !")

    end
end)
---------------------------
local frequencyGroups = {}
---------------------------
RegisterNetEvent('gps:joinFrequency', function(freq)
    local src = source
    freq = tostring(freq)

    if not frequencyGroups[freq] then frequencyGroups[freq] = {} end
    frequencyGroups[freq][src] = true

    updateUsersOnFrequency(freq)
    SendFrequencyLog(freq, ("✅ **Un individu** s’est connecté à la fréquence."):format(GetPlayerName(src)))
end)
---------------------------
RegisterNetEvent('gps:leaveFrequency', function(freq)
    local src = source
    freq = tostring(freq)

    if frequencyGroups[freq] then
        frequencyGroups[freq][src] = nil
        if next(frequencyGroups[freq]) == nil then
            frequencyGroups[freq] = nil
            SendFrequencyLog(freq, ("🚪 **Un individu** a quitté la fréquence."):format(GetPlayerName(src)))
        else
            updateUsersOnFrequency(freq)
            SendFrequencyLog(freq, ("🚪 **Un individu** a quitté la fréquence."):format(GetPlayerName(src)))
        end
    end
end)
---------------------------
AddEventHandler('playerDropped', function()
    local src = source
    for freq, group in pairs(frequencyGroups) do
        if group[src] then
            group[src] = nil
            updateUsersOnFrequency(freq)
        end
    end
end)
---------------------------
function updateUsersOnFrequency(freq)
    local players = {}
    for id in pairs(frequencyGroups[freq]) do
        local xPlayer = ESX.GetPlayerFromId(id)
        table.insert(players, {id = id, firstname = xPlayer and xPlayer.get('firstName') or 'Anonyme'})
    end

    for id in pairs(frequencyGroups[freq]) do
        TriggerClientEvent('gps:updateUsers', id, players)
    end
end

---------------------------
lib.callback.register('gps:getFavorites', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return {} end

    local identifier = xPlayer.identifier
    if not identifier then return {} end

    local result = MySQL.query.await('SELECT frequency FROM gps_favorites WHERE identifier = ?', { identifier })
    local list = {}
    for _, row in ipairs(result) do
        table.insert(list, row.frequency)
    end
    return list
end)
---------------------------
RegisterNetEvent('gps:addFavorite', function(freq)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local identifier = xPlayer.identifier
    if not identifier then return end

    local exists = MySQL.scalar.await('SELECT id FROM gps_favorites WHERE identifier = ? AND frequency = ?', {
        identifier, freq
    })

    if not exists then
        MySQL.insert.await('INSERT INTO gps_favorites (identifier, frequency) VALUES (?, ?)', {
            identifier, freq
        })
    end
end)
---------------------------
RegisterNetEvent('gps:removeFavorite', function(freq)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local identifier = xPlayer.identifier
    if not identifier then return end

    MySQL.update.await('DELETE FROM gps_favorites WHERE identifier = ? AND frequency = ?', {
        identifier, freq
    })
end)


---------------------------

RegisterNetEvent('gps:buyFrequency', function(freq, payType)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer or not freq or not payType then
        print('[GPS] Erreur : données d’achat invalides')
        return
    end

    freq = tostring(freq)
    local identifier = xPlayer.identifier
    if not identifier then return end

    local exists = MySQL.scalar.await('SELECT id FROM gps_frequencies WHERE frequency = ?', { freq })
    if exists then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "GPS",
            description = "Cette fréquence est déjà achetée.",
            type = "error"
        })
        return
    end

    local cost = 5000 -- 💰 Coût de la fréquence
    local balance = xPlayer.getAccount(payType)?.money or 0

    if balance < cost then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "GPS",
            description = "Fonds insuffisants pour acheter cette fréquence.",
            type = "error"
        })
        return
    end

    xPlayer.removeAccountMoney(payType, cost)

    local insert = promise.new()
    MySQL.execute('INSERT INTO gps_frequencies (frequency, owner_identifier) VALUES (?, ?)', {
        freq, identifier
    }, function(result)
        insert:resolve(result)
    end)
    Citizen.Await(insert)

    TriggerClientEvent('ox_lib:notify', src, {
        title = "GPS",
        description = "Fréquence achetée avec succès.",
        type = "success"
    })
end)


---------------------------

lib.callback.register('gps:getOwnedFrequencies', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return {} end

    local identifier = xPlayer.identifier
    if not identifier then return {} end

    local result = MySQL.query.await('SELECT frequency FROM gps_frequencies WHERE owner_identifier = ?', { identifier })
    local list = {}
    for _, row in ipairs(result) do
        table.insert(list, row.frequency)
    end
    return list
end)
---------------------------

---------------------------

RegisterNetEvent('gps:updateFrequency', function(freq, password)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer or not freq then return end

    freq = tostring(freq)
    local identifier = xPlayer.identifier
    if not identifier then return end

    -- Vérifie que le joueur est bien propriétaire
    local result = MySQL.scalar.await('SELECT id FROM gps_frequencies WHERE frequency = ? AND owner_identifier = ?', {
        freq, identifier
    })

    if not result then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "GPS",
            description = "Vous ne possédez pas cette fréquence.",
            type = "error"
        })
        return
    end

    -- Applique la mise à jour
    local success = MySQL.update.await('UPDATE gps_frequencies SET password = ? WHERE frequency = ? AND owner_identifier = ?', {
        password ~= "" and password or nil, freq, identifier
    })

    if success and success > 0 then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "GPS",
            description = "Mot de passe mis à jour avec succès.",
            type = "success"
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = "GPS",
            description = "La mise à jour a échoué.",
            type = "error"
        })
    end
end)


---------------------------

RegisterNetEvent('gps:updateWebhook', function(freq, webhook)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer or not freq then return end

    freq = tostring(freq)
    local identifier = xPlayer.identifier
    if not identifier then return end

    -- Vérifie la possession de la fréquence
    local result = MySQL.scalar.await('SELECT id FROM gps_frequencies WHERE frequency = ? AND owner_identifier = ?', {
        freq, identifier
    })

    if not result then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "GPS",
            description = "Vous ne possédez pas cette fréquence.",
            type = "error"
        })
        return
    end

    -- Applique le webhook (vide si champ effacé)
    local success = MySQL.update.await('UPDATE gps_frequencies SET webhook = ? WHERE frequency = ? AND owner_identifier = ?', {
        webhook ~= "" and webhook or nil, freq, identifier
    })

    if success and success > 0 then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "GPS",
            description = "Webhook mis à jour avec succès.",
            type = "success"
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = "GPS",
            description = "La mise à jour du webhook a échoué.",
            type = "error"
        })
    end
end)


-------------------------

RegisterNetEvent('gps:updateFrequencyData', function(freq, password, webhook)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer or not freq then return end

    freq = tostring(freq)
    local identifier = xPlayer.identifier
    if not identifier then return end

    local result = MySQL.query.await('SELECT password, webhook FROM gps_frequencies WHERE frequency = ? AND owner_identifier = ?', {
        freq, identifier
    })

    if not result or not result[1] then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "GPS",
            description = "Vous ne possédez pas cette fréquence.",
            type = "error"
        })
        return
    end

    -- Récupérer les valeurs actuelles
    local current = result[1]

    local newPassword = (password ~= "" and password or current.password)
    local newWebhook = (webhook ~= "" and webhook or current.webhook)

    local success = MySQL.update.await('UPDATE gps_frequencies SET password = ?, webhook = ? WHERE frequency = ? AND owner_identifier = ?', {
        newPassword, newWebhook, freq, identifier
    })

    if success and success > 0 then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "GPS",
            description = "Fréquence mise à jour.",
            type = "success"
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = "GPS",
            description = "Échec de la mise à jour.",
            type = "error"
        })
    end
end)


--------------------------
lib.callback.register('gps:checkItem', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    local inventory = exports.ox_inventory:GetInventory(source, false)
    for _, item in pairs(inventory.items) do
        if item.name == 'gps' and item.count > 0 then
            return true
        end
    end

    return false
end)

--------------------------
-- Déconnexion automatique des joueurs sans GPS actif
CreateThread(function()
    while true do
        Wait(5000) -- toutes les 5 secondes

        for freq, group in pairs(frequencyGroups) do
            local toRemove = {}

            for playerId in pairs(group) do
                local xPlayer = ESX.GetPlayerFromId(playerId)
                if xPlayer then
                    local inventory = exports.ox_inventory:GetInventory(playerId, false)
                    local hasGps = false

                    for _, item in pairs(inventory.items) do
                        if item.name == 'gps' and item.count > 0 then
                            hasGps = true
                            break
                        end
                    end

                    if not hasGps then
                        table.insert(toRemove, playerId)
                    end
                end
            end

            -- Supprimer hors de la boucle pour éviter les conflits d'itération
            for _, playerId in ipairs(toRemove) do
                frequencyGroups[freq][playerId] = nil
                TriggerClientEvent('gps:updateUsers', playerId, {})
                TriggerClientEvent('ox_lib:notify', playerId, {
                    title = "GPS",
                    description = "GPS désactivé : vous n'avez plus l'appareil.",
                    type = "error"
                })
            end
        end
    end
end)


--------------------------
--Vérification fréquence -> password
--------------------------
lib.callback.register('gps:isFrequencyProtected', function(source, freq)
    local result = MySQL.query.await('SELECT password FROM gps_frequencies WHERE frequency = ?', { freq })
    if result[1] and result[1].password and result[1].password ~= "" then
        return true
    end
    return false
end)

--------------------------
--valider le mot de passe
--------------------------
lib.callback.register('gps:checkPassword', function(source, freq, inputPassword)
    local result = MySQL.query.await('SELECT password FROM gps_frequencies WHERE frequency = ?', { freq })
    if result[1] and result[1].password == inputPassword then
        return true
    end
    SendFrequencyLog(freq, ("🔒 **Un individu** a tenté un mauvais mot de passe !"):format(GetPlayerName(source)))
    return false
end)

----------------------------------------
----Actualise les joueurs
----------------------------------------
RegisterNetEvent('gps:refreshFrequency', function(freq)
    local src = source
    local group = frequencyGroups[freq]
    if not group then return end

    local users = {}
    for id in pairs(group) do
        local xPlayer = ESX.GetPlayerFromId(id)
        if xPlayer then
            local ped = GetPlayerPed(id)
            local coords = GetEntityCoords(ped)
            table.insert(users, {
                id = id,
                firstname = xPlayer.get('firstName') or "?",
                coords = { x = coords.x, y = coords.y, z = coords.z }
            })
        end
    end

    TriggerClientEvent('gps:updateUsers', src, users)
end)



--System logs public webhook
-- 📤 Logger Discord centralisé pour fréquences GPS
function SendFrequencyLog(frequency, message)
    -- Vérifie si la fréquence est achetée + a un webhook
    local result = MySQL.query.await('SELECT webhook FROM gps_frequencies WHERE frequency = ?', { frequency })
    if not result[1] or not result[1].webhook or result[1].webhook == "" then return end

    local webhook = result[1].webhook

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        username = "📡 Fréquence GPS",
        avatar_url = "https://i.imgur.com/DFt8sKm.png",
        embeds = {{
            title = "📍 Fréquence protégée : " .. frequency,
            description = message,
            color = 31487,
            footer = { text = "Ducratif GPS System" },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }), { ['Content-Type'] = 'application/json' })
end
--Coté client comme logs:
--SendFrequencyLog(freq, ("✅ Le joueur **%s** s’est connecté à la fréquence."):format(GetPlayerName(src)))
-----------------

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
