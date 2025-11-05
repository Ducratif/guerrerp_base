--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if not lib then return end

local Edit = {}

function Edit.SetFuel(vehicle, fuel)
    SetVehicleFuelLevel(vehicle, fuel)
end


function Edit.GiveCarKey(vehicle, plate)
    if Shared.qb then
        TriggerEvent('vehiclekeys:client:SetOwner', plate)
    end
end


function Edit.Notify(description, type)
    lib.notify({
        description = description,
        duration = 4500,
        type = type,
        position = 'bottom'
    })
end


function Edit.RemoveKeys(vehicle, plate)
    
end


function Edit.OnExitGarage()
    -- myb weather?
end


RegisterNetEvent('uniq_garage:Notify', Edit.Notify)

return Edit

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
