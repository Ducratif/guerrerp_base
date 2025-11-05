--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Variables globales du serveur
local activeCalls = {}
local onlineOfficers = {}
local callIdCounter = 1

-- Configuration
local Config = {
    MaxCalls = 50,
    AutoCallCleanup = true,
    CallExpiryTime = 30 * 60 * 1000, -- 30 minutes en millisecondes
    BackupCooldown = 60 * 1000, -- 1 minute entre les demandes de renfort
}

-- Stockage des cooldowns
local backupCooldowns = {}

-- Événements pour les appels
RegisterServerEvent('dispatch:createCall')
AddEventHandler('dispatch:createCall', function(callData)
    local source = source
    
    if #activeCalls >= Config.MaxCalls then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"DISPATCH", "Limite d'appels atteinte!"}
        })
        return
    end
    
    local call = {
        id = callIdCounter,
        title = callData.title or "Appel d'urgence",
        description = callData.description or "Aucune description",
        location = callData.location or "Position inconnue",
        priority = callData.priority or "Code 2",
        caller = callData.caller or "Anonyme",
        timestamp = os.time(),
        assignedSquads = {},
        takenBy = nil,
        status = "active"
    }
    
    activeCalls[callIdCounter] = call
    callIdCounter = callIdCounter + 1
    
    -- Diffuser le nouvel appel à tous les officiers connectés
    for playerId, _ in pairs(onlineOfficers) do
        TriggerClientEvent('dispatch:newCall', playerId, call)
    end
    
    print("^2[DISPATCH]^7 Nouvel appel créé: " .. call.title .. " (ID: " .. call.id .. ")")
end)

RegisterServerEvent('dispatch:takeCall')
AddEventHandler('dispatch:takeCall', function(callId)
    local source = source
    
    if activeCalls[callId] and activeCalls[callId].takenBy == nil then
        activeCalls[callId].takenBy = source
        
        -- Notifier tous les officiers
        for playerId, _ in pairs(onlineOfficers) do
            TriggerClientEvent('dispatch:callTaken', playerId, callId, GetPlayerName(source))
        end
        
        print("^3[DISPATCH]^7 Appel " .. callId .. " pris par " .. GetPlayerName(source))
    end
end)

RegisterServerEvent('dispatch:closeCall')
AddEventHandler('dispatch:closeCall', function(callId)
    local source = source
    
    if activeCalls[callId] then
        activeCalls[callId].status = "closed"
        
        -- Notifier tous les officiers
        for playerId, _ in pairs(onlineOfficers) do
            TriggerClientEvent('dispatch:callClosed', playerId, callId, GetPlayerName(source))
        end
        
        -- Nettoyer l'appel après un délai
        SetTimeout(5000, function()
            activeCalls[callId] = nil
        end)
        
        print("^1[DISPATCH]^7 Appel " .. callId .. " fermé par " .. GetPlayerName(source))
    end
end)

-- Événements pour les équipes
RegisterServerEvent('dispatch:assignSquad')
AddEventHandler('dispatch:assignSquad', function(callId, squadName)
    local source = source
    
    if activeCalls[callId] then
        if not activeCalls[callId].assignedSquads then
            activeCalls[callId].assignedSquads = {}
        end
        
        table.insert(activeCalls[callId].assignedSquads, squadName)
        
        -- Notifier tous les officiers
        for playerId, _ in pairs(onlineOfficers) do
            TriggerClientEvent('dispatch:squadAssigned', playerId, callId, squadName)
        end
        
        print("^3[DISPATCH]^7 Équipe " .. squadName .. " assignée à l'appel " .. callId)
    end
end)

-- Événements pour les renforts
RegisterServerEvent('dispatch:requestBackup')
AddEventHandler('dispatch:requestBackup', function(level, playerData)
    local source = source
    -- SUPPRESSION DU COOLDOWN
    -- local currentTime = GetGameTimer()
    -- if backupCooldowns[source] and (currentTime - backupCooldowns[source]) < Config.BackupCooldown then
    --     local remaining = math.ceil((Config.BackupCooldown - (currentTime - backupCooldowns[source])) / 1000)
    --     TriggerClientEvent('chat:addMessage', source, {
    --         color = {255, 165, 0},
    --         multiline = true,
    --         args = {"DISPATCH", "Attendez " .. remaining .. " secondes avant de redemander des renforts."}
    --     })
    --     return
    -- end
    -- backupCooldowns[source] = currentTime

    local location = "Position inconnue"
    if playerData and playerData.position then
        location = string.format("%.0f, %.0f", playerData.position.x, playerData.position.y)
    end
    -- Diffuser la demande de renfort à tous les officiers
    for playerId, _ in pairs(onlineOfficers) do
        if playerId ~= source then -- Ne pas notifier celui qui demande
            TriggerClientEvent('dispatch:backupRequested', playerId, level, location, GetPlayerName(source))
        end
    end
    print("^3[DISPATCH]^7 " .. GetPlayerName(source) .. " demande des renforts niveau " .. level .. " à " .. location)
end)

-- Événements pour les statuts
RegisterServerEvent('dispatch:updateStatus')
AddEventHandler('dispatch:updateStatus', function(status)
    local source = source
    
    if onlineOfficers[source] then
        onlineOfficers[source].status = status
        onlineOfficers[source].lastUpdate = os.time()
        
        -- Diffuser le changement de statut
        for playerId, _ in pairs(onlineOfficers) do
            TriggerClientEvent('dispatch:statusUpdated', playerId, source, GetPlayerName(source), status)
        end
        
        print("^3[DISPATCH]^7 " .. GetPlayerName(source) .. " a changé son statut: " .. status)
    end
end)

-- Gestion des connexions/déconnexions
RegisterServerEvent('dispatch:officerConnect')
AddEventHandler('dispatch:officerConnect', function(playerData)
    local source = source
    
    onlineOfficers[source] = {
        name = GetPlayerName(source),
        status = "En service",
        lastUpdate = os.time(),
        data = playerData
    }
    
    -- Envoyer les appels actifs au joueur qui se connecte
    for _, call in pairs(activeCalls) do
        if call.status == "active" then
            TriggerClientEvent('dispatch:newCall', source, call)
        end
    end
    
    -- Notifier les autres officiers
    for playerId, _ in pairs(onlineOfficers) do
        if playerId ~= source then
            TriggerClientEvent('dispatch:officerConnected', playerId, source, GetPlayerName(source))
        end
    end
    
    print("^2[DISPATCH]^7 " .. GetPlayerName(source) .. " s'est connecté au dispatch")
end)

AddEventHandler('playerDropped', function(reason)
    local source = source
    
    if onlineOfficers[source] then
        -- Notifier les autres officiers
        for playerId, _ in pairs(onlineOfficers) do
            TriggerClientEvent('dispatch:officerDisconnected', playerId, source, GetPlayerName(source))
        end
        
        onlineOfficers[source] = nil
        print("^1[DISPATCH]^7 " .. GetPlayerName(source) .. " s'est déconnecté du dispatch")
    end
end)

-- Fonction utilitaire
function GetTableLength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

-- Nettoyage automatique des anciens appels
if Config.AutoCallCleanup then
    CreateThread(function()
        while true do
            Wait(60000) -- Vérifier toutes les minutes
            
            local currentTime = os.time() * 1000
            local cleanedCount = 0
            
            for callId, call in pairs(activeCalls) do
                if (currentTime - call.timestamp) > Config.CallExpiryTime then
                    activeCalls[callId] = nil
                    cleanedCount = cleanedCount + 1
                end
            end
            
            if cleanedCount > 0 then
                print("^3[DISPATCH]^7 " .. cleanedCount .. " appel(s) expiré(s) nettoyé(s)")
            end
        end
    end)
end

-- Exports pour backup 1, 2 et 3
exports('backup1', function(playerData)
    TriggerEvent('dispatch:requestBackup', 1, playerData)
end)

exports('backup2', function(playerData)
    TriggerEvent('dispatch:requestBackup', 2, playerData)
end)

exports('backup3', function(playerData)
    TriggerEvent('dispatch:requestBackup', 3, playerData)
end)

-- Event pour backup SASP SUD qui utilise les exports
RegisterServerEvent('dispatch:backupSASPSUD')
AddEventHandler('dispatch:backupSASPSUD', function(level, playerData)
    if level == 1 then
        exports['fb_ui-v2']:backup1(playerData)
    elseif level == 2 then
        exports['fb_ui-v2']:backup2(playerData)
    elseif level == 3 then
        exports['fb_ui-v2']:backup3(playerData)
    else
        print('^1[DISPATCH]^7 Niveau de backup SASP SUD invalide: ' .. tostring(level))
    end
end)

print("^2[DISPATCH]^7 Serveur chargé - Système de dispatch opérationnel")

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
