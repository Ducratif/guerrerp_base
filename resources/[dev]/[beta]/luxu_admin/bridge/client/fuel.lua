--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local fuel = {}

function fuel.setFuel(vehicle, fuel)
    if (GetResourceState("ti_fuel") == "started") then
        exports["ti_fuel"]:setFuel(vehicle, fuel, "RON91")
    end
    SetVehicleFuelLevel(vehicle, fuel)
end

function fuel.getFuel(vehicle)
    return GetVehicleFuelLevel(vehicle)
end

return fuel

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
