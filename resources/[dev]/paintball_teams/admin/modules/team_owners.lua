--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local IsPlayerAdmin = require 'admin.modules.permission'.IsPlayerAdmin

lib.callback.register('paintball_admin:getAllTeamOwners', function(src)
    if not IsPlayerAdmin(src) then return nil end

    local teams = MySQL.query.await('SELECT id, name, score, public, owner_identifier FROM paintball_teams')

    for i = 1, #teams do
        -- Nombre de membres
        local count = MySQL.scalar.await('SELECT COUNT(*) FROM paintball_players WHERE team_id = ?', { teams[i].id })
        teams[i].members = count

        -- Récupération du prénom du propriétaire
        local ownerId = teams[i].owner_identifier
        if ownerId then
            local row = MySQL.single.await('SELECT firstname FROM users WHERE identifier = ?', { ownerId })
            teams[i].owner_name = row and row.firstname or "Inconnu"
        else
            teams[i].owner_name = "Inconnu"
        end
    end

    return teams
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
