--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local clothing = {}

function clothing.loadPlayerSkin()
    if GetResourceState("qb-clothing") == "started" then
        TriggerServerEvent("qb-clothes:loadPlayerSkin")
    elseif GetResourceState("illenium-appearance") == "started" then
        local result = lib.callback.await("illenium-appearance:server:getAppearance")
        exports["illenium-appearance"]:setPlayerAppearance(result)
    elseif GetResourceState("rcore_clothing") == "started" then
        TriggerServerEvent('rcore_clothing:reloadSkin')
    elseif GetResourceState("skinchanger") == "started" and GetResourceState("esx_skin") == "started" then
        Framework.object.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
    elseif GetResourceState("qs-appearance") == "started" or GetResourceState("ak47_clothing") == "started" or GetResourceState("ak47_qb_clothing") == "started" then
        ExecuteCommand("reloadskin")
    end
end

return clothing

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
