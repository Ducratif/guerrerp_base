--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
function getJobOutfits(playerId, cb, markerId)
    if(not canUseMarkerWithLog(playerId, markerId)) then return end

    local xPlayer = ESX.GetPlayerFromId(playerId)
    local jobName = xPlayer.job.name
    local jobGrade = xPlayer.job.grade

    local jobOutfitsData = fullMarkerData[markerId].data or {}

    cb(jobOutfitsData.outfits)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
