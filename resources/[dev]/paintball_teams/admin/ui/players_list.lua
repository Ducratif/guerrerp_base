--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterNetEvent('paintball_admin:listPlayersByTeamStatus', function()
    lib.callback('paintball_admin:getAllPlayersWithTeamStatus', false, function(data)
        if not data then
            return lib.notify({ title = "Erreur", description = "Impossible de charger les joueurs", type = "error" })
        end

        local withTeam, noTeam = {}, {}

        for _, p in ipairs(data) do
            local label = (p.firstname or p.identifier) .. ' – ' .. (p.team_name or 'Aucune')
            local line = {
                title = label,
                description = ('Score: %s | Kills: %s'):format(p.score or 0, p.total_kills or 0),
                icon = p.team_id and 'users' or 'user-x',
                onSelect = function()
                    if p.team_id then
                        TriggerEvent('paintball_admin:viewPlayerMenu', p.identifier)
                    else
                        TriggerEvent('paintball_admin:assignTeamToPlayer', p.identifier)
                    end
                end
            }
            if p.team_id then
                table.insert(withTeam, line)
            else
                table.insert(noTeam, line)
            end
        end

        lib.registerContext({
            id = 'paintball_admin_player_list',
            title = '📋 Tous les Joueurs',
            options = {
                {
                    title = '✅ Avec une Team',
                    icon = 'users',
                    description = 'Joueurs déjà assignés',
                    menu = 'paintball_admin_list_with_team'
                },
                {
                    title = '🚫 Sans Team',
                    icon = 'user-x',
                    description = 'Joueurs à assigner',
                    menu = 'paintball_admin_list_no_team'
                }
            }
        })

        lib.registerContext({
            id = 'paintball_admin_list_with_team',
            title = '✅ Joueurs avec une Team',
            menu = 'paintball_admin_player_list',
            options = withTeam
        })

        lib.registerContext({
            id = 'paintball_admin_list_no_team',
            title = '🚫 Joueurs sans Team',
            menu = 'paintball_admin_player_list',
            options = noTeam
        })

        lib.showContext('paintball_admin_player_list')
    end)
end)

RegisterNetEvent('paintball_admin:assignTeamToPlayer', function(identifier)
    lib.callback('paintball_admin:getAllTeams', false, function(teams)
        if not teams or #teams == 0 then
            return lib.notify({ title = "Aucune team", description = "Aucune équipe disponible", type = "error" })
        end

        local options = {}
        for _, t in ipairs(teams) do
            local isPrivate = t.public == false

            table.insert(options, {
                title = (isPrivate and '🔒 ' or '🌐 ') .. t.name,
                description = ('Score: %s | Privée: %s'):format(
                    t.score,
                    isPrivate and 'Oui' or 'Non'
                ),
                icon = 'plus-circle',
                onSelect = function()
                    TriggerServerEvent('paintball_admin:forceAssignPlayerToTeam', identifier, t.id)
                end
            })
        end

        lib.registerContext({
            id = 'paintball_admin_team_assign_list',
            title = '🧩 Ajouter à une Team',
            menu = 'paintball_admin_list_no_team',
            options = options
        })

        lib.showContext('paintball_admin_team_assign_list')
    end)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
