--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterNetEvent('paintball_admin:debugMenu', function()
    lib.registerContext({
        id = 'paintball_admin_debug',
        title = '🧪 Outils de Test / Debug',
        options = {
            {
                title = '📦 Ajouter 10 points à ma team',
                icon = 'plus',
                event = 'paintball_admin:addTeamPointsSelf'
            },
            {
                title = '💣 Simuler un kill entre 2 joueurs',
                icon = 'crosshair',
                event = 'paintball_admin:simulateKill'
            },
            {
                title = '🏁 Forcer “Zone Dominée” réussite',
                icon = 'flag-checkered',
                event = 'paintball_admin:forceZoneDominance'
            },
            {
                title = '🧬 Forcer une compétence à ma team',
                icon = 'bolt',
                event = 'paintball_admin:forceSkillToSelfTeam'
            }
        }
    })

    lib.showContext('paintball_admin_debug')
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
