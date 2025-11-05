--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Variables globales
local dispatchOpen = false
local playerData = {}

-- Fonction pour ouvrir/fermer le dispatch
function ToggleDispatch()
    dispatchOpen = not dispatchOpen
    
    if dispatchOpen then
        -- Ouvrir l'interface
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = 'openDispatch',
            playerData = playerData
        })
        
        -- Désactiver les contrôles du joueur
        DisplayRadar(false)
        
        -- Animation d'ouverture
        CreateThread(function()
            while dispatchOpen do
                DisableControlAction(0, 1, true) -- LookLeftRight
                DisableControlAction(0, 2, true) -- LookUpDown
                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 25, true) -- Aim
                DisableControlAction(0, 142, true) -- MeleeAttackAlternate
                DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
                Wait(0)
            end
        end)
        
        print("^2[DISPATCH]^7 Interface ouverte")
    else
        -- Fermer l'interface
        SetNuiFocus(false, false)
        SendNUIMessage({
            type = 'closeDispatch'
        })
        
        DisplayRadar(true)
        print("^2[DISPATCH]^7 Interface fermée")
    end
end

-- Commande pour ouvrir le dispatch
RegisterCommand('dispatch', function(source, args, rawCommand)
    -- Vérifier si le joueur a les permissions (à adapter selon votre framework)
    local playerJob = GetPlayerJob() -- Fonction à adapter
    
    if IsPlayerPolice() then -- Fonction à adapter selon votre système
        ToggleDispatch()
    else
        print("^1[DISPATCH]^7 Vous n'avez pas accès au système de dispatch!")
    end
end, false)

-- Commande pour demander un backup avec un argument (1, 2 ou 3)
RegisterCommand('backup', function(source, args, rawCommand)
    local level = tonumber(args[1]) or 1
    if level < 1 or level > 3 then
        print("^1[DISPATCH]^7 Utilisation: /backup [1, 2 ou 3]")
        return
    end
    local playerData = GetPlayerData()
    TriggerServerEvent('dispatch:requestBackup', level, playerData)
    -- Afficher la notification dans le dispatch UI localement (comme les boutons)
    SendNUIMessage({ type = 'requestBackup', level = level })
end, false)

-- Suggestion de commande
TriggerEvent('chat:addSuggestion', '/dispatch', 'Ouvrir le système de dispatch', {})
TriggerEvent('chat:addSuggestion', '/backup', 'Demander un renfort (niveau 1, 2 ou 3)', {
    { name = 'niveau', help = '1 = vert, 2 = orange, 3 = rouge' }
})

-- Événements NUI
RegisterNUICallback('closeDispatch', function(data, cb)
    ToggleDispatch()
    cb('ok')
end)

RegisterNUICallback('requestBackup', function(data, cb)
    local level = data.level or 1
    
    -- Envoyer la demande de renfort au serveur
    TriggerServerEvent('dispatch:requestBackup', level, GetPlayerData())
    
    print("^3[DISPATCH]^7 Demande de renfort niveau " .. level .. " envoyée")
    cb('ok')
end)

RegisterNUICallback('updateStatus', function(data, cb)
    local status = data.status
    
    -- Mettre à jour le statut sur le serveur
    TriggerServerEvent('dispatch:updateStatus', status)
    
    print("^3[DISPATCH]^7 Statut mis à jour: " .. status)
    cb('ok')
end)

RegisterNUICallback('takeCall', function(data, cb)
    local callId = data.callId
    
    -- Prendre l'appel
    TriggerServerEvent('dispatch:takeCall', callId)
    
    print("^3[DISPATCH]^7 Appel pris: " .. callId)
    cb('ok')
end)

RegisterNUICallback('assignSquad', function(data, cb)
    local callId = data.callId
    local squadName = data.squadName
    
    -- Assigner l'équipe à l'appel
    TriggerServerEvent('dispatch:assignSquad', callId, squadName)
    
    print("^3[DISPATCH]^7 Équipe " .. squadName .. " assignée à l'appel " .. callId)
    cb('ok')
end)

-- Événements reçus du serveur
RegisterNetEvent('dispatch:newCall')
AddEventHandler('dispatch:newCall', function(callData)
    if dispatchOpen then
        SendNUIMessage({
            type = 'newCall',
            call = callData
        })
    end
    
    -- Notification en jeu
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName("~r~DISPATCH~w~: Nouvel appel - " .. callData.title)
    EndTextCommandThefeedPostTicker(true, true)
end)

RegisterNetEvent('dispatch:backupRequested')
AddEventHandler('dispatch:backupRequested', function(level, location, requester)
    if dispatchOpen then
        SendNUIMessage({
            type = 'backupRequested',
            level = level,
            location = location,
            requester = requester
        })
    end
    
    -- Notification en jeu
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName("~o~RENFORT~w~: Niveau " .. level .. " demandé à " .. location)
    EndTextCommandThefeedPostTicker(true, true)
end)

RegisterNetEvent('dispatch:updatePlayerData')
AddEventHandler('dispatch:updatePlayerData', function(data)
    playerData = data
    
    if dispatchOpen then
        SendNUIMessage({
            type = 'updatePlayerData',
            playerData = playerData
        })
    end
end)

-- Fonctions utilitaires (à adapter selon votre framework)
function GetPlayerJob()
    -- ESX
    -- return ESX.GetPlayerData().job.name
    
    -- QBCore
    -- local PlayerData = QBCore.Functions.GetPlayerData()
    -- return PlayerData.job.name
    
    -- Version par défaut
    return "police"
end

function IsPlayerPolice()
    local job = GetPlayerJob()
    local policeJobs = {"police", "sheriff", "bcso", "sasp", "lspd"} -- Ajoutez vos jobs police
    
    for _, policeJob in ipairs(policeJobs) do
        if job == policeJob then
            return true
        end
    end
    
    return false
end

function GetPlayerData()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    return {
        id = GetPlayerServerId(PlayerId()),
        name = GetPlayerName(PlayerId()),
        job = GetPlayerJob(),
        position = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        },
        vehicle = IsPedInAnyVehicle(ped, false) and GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(ped, false))) or nil
    }
end

-- Fermer avec Échap
CreateThread(function()
    while true do
        Wait(0)
        if dispatchOpen then
            if IsControlJustPressed(0, 322) then -- ESC
                ToggleDispatch()
            end
        end
    end
end)

print("^2[DISPATCH]^7 Client chargé - Utilisez /dispatch pour ouvrir l'interface")

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
