--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local IsPlayerAdmin = require 'admin.modules.permission'.IsPlayerAdmin

lib.callback.register('paintball_admin:getAllPlayersWithTeamStatus', function(src)
    if not IsPlayerAdmin(src) then return nil end

    local result = MySQL.query.await([[
        SELECT pp.identifier, pp.score, pp.total_kills, pp.team_id, u.firstname, pt.name as team_name
        FROM paintball_players pp
        LEFT JOIN users u ON u.identifier COLLATE utf8mb4_general_ci = pp.identifier COLLATE utf8mb4_general_ci
        LEFT JOIN paintball_teams pt ON pt.id = pp.team_id
    ]])
    return result
end)

lib.callback.register('paintball_admin:getAllTeams', function(src)
    if not IsPlayerAdmin(src) then return nil end

    return MySQL.query.await('SELECT id, name, score, public FROM paintball_teams')
end)

RegisterNetEvent('paintball_admin:forceAssignPlayerToTeam', function(identifier, teamId)
    local src = source
    if not IsPlayerAdmin(src) then return end

    local success = MySQL.update.await('UPDATE paintball_players SET team_id = ? WHERE identifier = ?', { teamId, identifier })
    TriggerClientEvent('ox_lib:notify', src, {
        title = "✅ Assigné",
        description = "Le joueur a été ajouté à la team avec succès.",
        type = "success"
    })
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
