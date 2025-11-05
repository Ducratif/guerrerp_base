--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterNetEvent('paintball_admin:listTeamOwners', function()
    lib.callback('paintball_admin:getAllTeamOwners', false, function(teams)
        if not teams or #teams == 0 then
            return lib.notify({
                title = "Aucune équipe",
                description = "Aucune équipe trouvée avec un fondateur.",
                type = "error"
            })
        end

        local options = {}

        for _, t in ipairs(teams) do
            table.insert(options, {
                title = ('👑 %s'):format(t.owner_name or 'Inconnu'),
                description = ('🏷️ %s | 🏆 %s pts | 👥 %s membres'):format(
                    t.name,
                    t.score or 0,
                    t.members or 0
                ),
                icon = 'crown'
            })
        end

        lib.registerContext({
            id = 'paintball_admin_team_owners',
            title = '👑 Liste des Fondateurs',
            menu = 'paintball_admin_menu',
            options = options
        })

        lib.showContext('paintball_admin_team_owners')
    end)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
