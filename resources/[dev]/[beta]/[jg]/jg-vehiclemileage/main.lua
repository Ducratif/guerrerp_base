--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Framework = {}

if (Config.Framework == "auto" and (GetResourceState("qbx_core") == "started" or GetResourceState("qb-core") == "started")) or Config.Framework == "Qbox" or Config.Framework == "QBCore" then
  Config.Framework = "QBCore"
  Framework.VehiclesTable = "player_vehicles"
elseif (Config.Framework == "auto" and GetResourceState("es_extended") == "started") or Config.Framework == "ESX" then
  Config.Framework = "ESX"
  Framework.VehiclesTable = "owned_vehicles"
else
  error("You haven't set a valid framework. Valid options can be found in main.lua!")
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
