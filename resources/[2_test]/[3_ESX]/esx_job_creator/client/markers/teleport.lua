--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
function teleportMarker(markerId)
    ESX.TriggerServerCallback('esx_job_creator:getTeleportCoords', function(coords) 
        if(not coords) then return end

        local plyPed = PlayerPedId()
        
        local teleportTarget = plyPed
        
        DoScreenFadeOut(500)

        Citizen.Wait(750)

        local veh = GetVehiclePedIsIn(plyPed, false)

        if(veh and veh > 0) then
            teleportTarget = veh
        end

        SetEntityCoords(teleportTarget, coords.x + .0, coords.y + .0, coords.z + .0, 0.0, 0.0, 0.0, false)

        Citizen.Wait(750)

        DoScreenFadeIn(500)
    end, markerId)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
