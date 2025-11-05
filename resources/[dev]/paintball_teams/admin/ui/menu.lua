--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local menu = {}

function menu.open()
    lib.registerContext({
        id = 'paintball_admin_menu',
        title = "🛠️ Menu Admin Paintball",
        options = {
            {
                title = '📁 Gestion des Équipes',
                description = 'Modifier les compétences et scores des teams',
                icon = 'users',
                event = 'paintball_admin:teamsMenu'
            },
            {
                title = '🧍 Gestion des Joueurs',
                description = 'Voir ou modifier les infos d\'un joueur',
                icon = 'user',
                event = 'paintball_admin:playersMenu'
            },
            {
                title = '📋 Liste des Joueurs',
                description = 'Lister tous les joueurs classés par statut d\'équipe',
                icon = 'list',
                event = 'paintball_admin:listPlayersByTeamStatus'
            },
            {
                title = '👑 Fondateurs d\'Équipe',
                description = 'Voir tous les propriétaires d\'équipes',
                icon = 'crown',
                event = 'paintball_admin:listTeamOwners'
            },
            {
                title = '⚙️ Configuration Dynamique',
                description = 'Modifier les effets ou le coût des compétences',
                icon = 'sliders',
                event = 'paintball_admin:configMenu'
            },
            {
                title = '📊 Statistiques & Logs',
                description = 'Voir les classements et les logs récents',
                icon = 'chart-bar',
                event = 'paintball_admin:statsMenu'
            },
            {
                title = '🧪 Outils de Test / Debug',
                description = 'Simuler des effets ou forcer des événements',
                icon = 'flask',
                event = 'paintball_admin:debugMenu'
            }
        }
    })

    lib.showContext('paintball_admin_menu')
end

return menu

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
