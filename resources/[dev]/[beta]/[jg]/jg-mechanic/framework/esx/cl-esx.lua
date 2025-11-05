--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]


if (Config.Framework == "auto" and GetResourceState("es_extended") == "started") or Config.Framework == "ESX" then
  -- Player data
  Globals.PlayerData = ESX.GetPlayerData()

  RegisterNetEvent("esx:playerLoaded")
  AddEventHandler("esx:playerLoaded", function(xPlayer)
    Globals.PlayerData = xPlayer
    TriggerEvent("jg-mechanic:client:refresh-mechanic-zones-and-blips")
  end)

  RegisterNetEvent("esx:setJob")
  AddEventHandler("esx:setJob", function(job)
    Globals.PlayerData.job = job
    TriggerEvent("jg-mechanic:client:refresh-mechanic-zones-and-blips")
  end)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
