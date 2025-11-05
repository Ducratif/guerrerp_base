--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if (Config.Framework == "auto" and GetResourceState("qbx_core") == "started") or Config.Framework == "Qbox" then
  -- Player data
  Globals.PlayerData = exports.qbx_core:GetPlayerData()

  RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
  AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    Globals.PlayerData = exports.qbx_core:GetPlayerData()
    TriggerEvent("jg-mechanic:client:refresh-mechanic-zones-and-blips")
  end)

  RegisterNetEvent("QBCore:Client:OnJobUpdate")
  AddEventHandler("QBCore:Client:OnJobUpdate", function(job)
    Globals.PlayerData.job = job
    TriggerEvent("jg-mechanic:client:refresh-mechanic-zones-and-blips")
  end)

  RegisterNetEvent("QBCore:Client:OnGangUpdate")
  AddEventHandler("QBCore:Client:OnGangUpdate", function(gang)
    Globals.PlayerData.gang = gang
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
