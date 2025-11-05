--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if not Framework.ESX() then return end

local ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback("esx_skin:getPlayerSkin", function(source, cb)
	local Player = ESX.GetPlayerFromId(source)

    local appearance = Framework.GetAppearance(Player.identifier)

    cb(appearance, {
        skin_male = Player.job.skin_male,
        skin_female = Player.job.skin_female
    })
end)

lib.callback.register("illenium-appearance:server:esx:getGradesForJob", function(_, jobName)
    return Database.JobGrades.GetByJobName(jobName)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
