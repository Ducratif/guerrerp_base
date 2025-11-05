--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local IsPlayerAdmin = require 'admin.modules.permission'.IsPlayerAdmin

lib.callback.register('paintball_admin:getAllSkillsRaw', function(src)
    if not exports['paintball_teams']:IsPlayerAdmin(src) then return nil end
    return MySQL.query.await('SELECT * FROM paintball_skills ORDER BY name')
end)

RegisterNetEvent('paintball_admin:updateSkillConfig', function(skillId, description, effect, cost)
    local src = source
    if not IsPlayerAdmin(source) then return nil end


    MySQL.update.await([[
        UPDATE paintball_skills SET description = ?, effect = ?, cost = ?
        WHERE id = ?
    ]], { description, effect, cost, skillId })

    TriggerClientEvent('ox_lib:notify', src, {
        title = "✅ Compétence modifiée",
        description = "Les données de la compétence ont été mises à jour.",
        type = "success"
    })

    if AdminConfig.EnableLogging then
        print(("[ADMIN CONFIG] %s a modifié skill ID %s"):format(GetPlayerName(src), skillId))
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
