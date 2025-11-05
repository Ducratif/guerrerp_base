--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local qb = GetResourceState('qb-core'):find("start")
if not qb then return end

local QBCore = exports['qb-core']:GetCoreObject()

function hasAccess(job)
    if not job then return true end

    local playerData = QBCore.Functions.GetPlayerData()

    if playerData.job.name == job then return true end
    
    return false
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
