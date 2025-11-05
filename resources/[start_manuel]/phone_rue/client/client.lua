--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports["es_extended"]:getSharedObject()

for i, model in ipairs(Config.PhoneboxModels) do
    exports.ox_target:addModel(model, {
        {
            name = 'phone_rues_'..i, -- 🔁 nom unique à chaque boucle
            event = 'phone_rues:callMenu',
            icon = 'fas fa-phone',
            label = 'Use Phone',
            distance = 1.5
        }
    })
end
RegisterNetEvent('phone_rues:callMenu')
AddEventHandler('phone_rues:callMenu', function()
    local menuOptions = {
        {
            title = 'Contacter la Police',
            description = 'APPEL D\'URGENCE',
            event = 'phone_rues:sendMessage',
            args = 'police',
        },
        {
            title = 'Contacter l\'hopital',
            description = 'APPEL D\'URGENCE',
            event = 'phone_rues:sendMessage',
            args = 'ambulance',
        }
    }

    lib.registerContext({
        id = 'phone_rues_menu',
        title = 'phone_rues',
        options = menuOptions,
    })

    lib.showContext('phone_rues_menu')
end)

RegisterNetEvent('phone_rues:sendMessage')
AddEventHandler('phone_rues:sendMessage', function(service)
    local input = lib.inputDialog('phone_rues', {'Entrer votre message'})

    if input then
        local message = input[1]
        TriggerServerEvent('phone_rues:callService', service, message)
    end
end)

local currentBlip = nil

RegisterNetEvent('phone_rues:showLocationOnMap')
AddEventHandler('phone_rues:showLocationOnMap', function(callerCoords, icon)
    if currentBlip then
        RemoveBlip(currentBlip)
    end
    
    currentBlip = AddBlipForCoord(callerCoords.x, callerCoords.y)
    SetBlipSprite(currentBlip, 1)  
    SetBlipColour(currentBlip, 3)  
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Call Location")
    EndTextCommandSetBlipName(currentBlip)

    SetNewWaypoint(callerCoords.x, callerCoords.y)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000) 

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            local distance = #(vector3(callerCoords.x, callerCoords.y, callerCoords.z) - playerCoords)
            if distance < 50.0 then 
                if currentBlip then
                    RemoveBlip(currentBlip)
                    currentBlip = nil
                end
                break 
            end
        end
    end)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
