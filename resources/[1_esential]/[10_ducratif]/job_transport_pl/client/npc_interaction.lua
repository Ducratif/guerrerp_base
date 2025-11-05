--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local npcCoords = vector3(-350.919, -2767.133, 6.040) -- Position du PNJ
local npcModel = "s_m_m_trucker_01" -- Modèle du PNJ (un chauffeur)
local playerVehicles = {} -- Stockage des véhicules déjà sortis

-- Spawn du PNJ
Citizen.CreateThread(function()
    RequestModel(GetHashKey(npcModel))
    while not HasModelLoaded(GetHashKey(npcModel)) do
        Wait(1)
    end

    local npc = CreatePed(4, GetHashKey(npcModel), npcCoords.x, npcCoords.y, npcCoords.z - 1.0, 50.2, false, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    FreezeEntityPosition(npc, true)
end)

-------------------------------------------------------------------------
-- Interaction avec le PNJ (proche du chef de transport)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - npcCoords)

        if distance < 3.0 then
            lib.showTextUI("Appuyez sur [E] pour parler au chef de transport")

            if IsControlJustReleased(0, 38) then -- Touche E
                lib.hideTextUI()
                OpenVehicleMenu()
            end
        else
            lib.hideTextUI()
        end
    end
end)

-- Fonction pour afficher le menu avec ox_lib
function OpenVehicleMenu()
    ESX.TriggerServerCallback('esx:getPlayerData', function(playerData)
        local jobGrade = playerData.job.grade_name
        local options = {}

        if vehicleConfig[jobGrade] then
            for _, vehicle in ipairs(vehicleConfig[jobGrade]) do
                table.insert(options, {
                    title = vehicle.label,
                    icon = 'truck',
                    onSelect = function()
                        SpawnJobVehicle(vehicle.model)
                    end
                })
            end
        else
            table.insert(options, {
                title = 'Aller à France Chômeur !',
                icon = 'ban',
                disabled = true
            })
        end

        lib.registerContext({
            id = 'vehicle_menu',
            title = 'Sélection de véhicule',
            options = options
        })

        lib.showContext('vehicle_menu')
    end)
end

-------------------------------------------------------------------------

-- Fonction pour spawn un véhicule
function SpawnJobVehicle(vehicleModel)
    local playerPed = PlayerPedId()
    local playerId = GetPlayerServerId(PlayerId()) -- ID du joueur
    local spawnPoints = {
        vector3(-367.73, -2767.87, 6.00),
        vector3(-363.06, -2773.15, 6.01),
        vector3(-362.24, -2783.00, 6.00)
    }

    -- Supprimer le véhicule existant du joueur
    if playerVehicles[playerId] and DoesEntityExist(playerVehicles[playerId]) then
        ESX.Game.DeleteVehicle(playerVehicles[playerId])
    end

    -- Vérifier si une place est libre et spawn le véhicule
    for _, spawnPoint in ipairs(spawnPoints) do
        if ESX.Game.IsSpawnPointClear(spawnPoint, 3.0) then
            ESX.Game.SpawnVehicle(vehicleModel, spawnPoint, 50.2, function(vehicle)
                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                playerVehicles[playerId] = vehicle -- Sauvegarde du véhicule
                ESX.ShowNotification("Véhicule sorti avec succès !")
            end)
            return
        end
    end

    ESX.ShowNotification("Toutes les places de spawn sont occupées !")
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
