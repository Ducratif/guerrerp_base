--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports["es_extended"]:getSharedObject()

-- this will send information to server.
function CheckPlayerCar(vehicle)
	if ESX then
		local veh = ESX.Game.GetVehicleProperties(vehicle)
		TriggerServerEvent("lg-radiocar:openUI", veh.plate)
	else
		TriggerServerEvent("lg-radiocar:openUI", GetVehicleNumberPlateText(vehicle))
	end
end

-- if you want this script for... lets say like only vip, edit this function.
function YourSpecialPermission()
    return true
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
