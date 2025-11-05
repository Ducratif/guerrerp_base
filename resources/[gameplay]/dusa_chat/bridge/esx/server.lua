--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local resourceName = 'es_extended'
if not GetResourceState(resourceName):find('start') then return end
dusa = {}
dusa.framework = 'esx'

ESX = exports[resourceName]:getSharedObject()
core = ESX

function bridge.getPlayer(source)
    return ESX.GetPlayerFromId(source)
end

function bridge.getJob(source)
    local player = bridge.getPlayer(source)
    return player.job
end

function bridge.registerCallback(name, cb)
    core.RegisterServerCallback(name, cb)
end
shared.framework = 'esx'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
