--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()

-- Cette fonction peut être appelée depuis ton menu ALT
function TryImpoundVehicle()
    ESX.TriggerServerCallback('custom_impound:canImpound', function(canImpound)
        if not canImpound then
            lib.notify({type = 'error', description = 'Tu n\'as pas le métier pour faire ça !'})
            return
        end

        local playerPed = PlayerPedId()
        local vehicle = ESX.Game.GetVehicleInDirection()

        if DoesEntityExist(vehicle) then
            local plate = GetVehicleNumberPlateText(vehicle)
            TriggerServerEvent('custom_impound:impoundVehicle', plate)
            ESX.Game.DeleteVehicle(vehicle)
            lib.notify({type = 'success', description = 'Véhicule mis en fourrière !'})
        else
            lib.notify({type = 'error', description = 'Aucun véhicule devant toi !'})
        end
    end)
end

-- Si tu veux garder la touche ALT en fallback
--RegisterKeyMapping('impoundVehicle', 'Mettre en fourrière', 'keyboard', 'LMENU')

--Desactiver la touche ALT du haut
RegisterKeyMapping('impoundVehicle', 'Mettre en fourrière', 'keyboard', 'F24') -- Touche inexistante

RegisterCommand('impoundVehicle', function()
    TryImpoundVehicle()
end, false)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
