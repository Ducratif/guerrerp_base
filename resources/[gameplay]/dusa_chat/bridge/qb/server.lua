--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local resourceName = 'qb-core'
dusa = {}

if not GetResourceState(resourceName):find('start') then return end
dusa.framework = 'qb'

QB = exports[resourceName]:GetCoreObject()
core = QB

function bridge.getPlayer(source)
    return core.Functions.GetPlayer(source)
end

function bridge.getJob(source)
    local player = bridge.getPlayer(source)
    return player.PlayerData.job
end

function bridge.registerCallback(name, cb)
    core.Functions.CreateCallback(name, cb)
end

shared.framework = 'qb'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
