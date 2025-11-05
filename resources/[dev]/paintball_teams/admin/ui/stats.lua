--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterNetEvent('paintball_admin:statsMenu', function()
    lib.registerContext({
        id = 'paintball_admin_stats',
        title = '📊 Statistiques & Logs',
        options = {
            {
                title = '🏆 Classement des Équipes',
                icon = 'trophy',
                event = 'paintball_admin:viewTeamScores'
            },
            {
                title = '🎯 Top 5 Joueurs',
                icon = 'target',
                event = 'paintball_admin:viewTopPlayers'
            },
            {
                title = '🗒️ Dernières actions admin',
                icon = 'clipboard-list',
                event = 'paintball_admin:viewLogs'
            },
            {
                title = '🕓 Zones dominées (actives)',
                icon = 'flag',
                event = 'paintball_admin:viewActiveDominance'
            },
            {
                title = '📤 Export JSON (debug)',
                icon = 'download',
                event = 'paintball_admin:exportAll'
            }
        }
    })

    lib.showContext('paintball_admin_stats')
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
