--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local existingCalls = {}

RegisterNetEvent("luxu_admin:server:setCallChannel", function(channel)
    local source = source
    existingCalls[source] = channel
    exports['saltychat']:AddPlayerToCall(channel, source)
end)

RegisterNetEvent("luxu_admin:server:leaveCall", function(channel)
    if existingCalls[source] then
        exports['saltychat']:RemovePlayerFromCall(existingCalls[source], source)
        existingCalls[source] = nil
    end
end)


AddEventHandler("onPlayerDropped", function(source)
    if existingCalls[source] then
        existingCalls[source] = nil
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
