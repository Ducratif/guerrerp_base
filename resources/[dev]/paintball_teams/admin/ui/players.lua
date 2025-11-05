--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterNetEvent('paintball_admin:playersMenu', function()
    local dialogs = require 'admin.ui.dialogs'

    local input = dialogs.playerSearch()
    if not input then return end


    local input = lib.inputDialog('🔍 Recherche Joueur', {
        { type = 'input', label = 'Identifiant / License / Prénom', required = true, placeholder = 'Ex: license:abc..., prénom RP...' }
    })

    if not input or not input[1] then return end

    local query = input[1]

    lib.callback('paintball_admin:getPlayerData', false, function(data)
        if not data then
            return lib.notify({
                title = "Introuvable",
                description = "Aucun joueur ne correspond à cette recherche.",
                type = "error"
            })
        end

        lib.registerContext({
            id = 'paintball_admin_player_menu',
            title = ('Joueur : %s'):format(data.firstname or data.identifier),
            options = {
                {
                    title = '👥 Team : ' .. (data.team_name or 'Aucune'),
                    description = 'Score: ' .. data.score,
                    icon = 'users'
                },
                {
                    title = '🎯 Total Kills : ' .. (data.total_kills or 0),
                    icon = 'skull'
                },
                {
                    title = '🧠 Compétences',
                    description = 'Voir ou forcer des compétences',
                    icon = 'brain',
                    event = 'paintball_admin:viewPlayerSkills',
                    args = data.identifier
                },
                {
                    title = '🧯 Reset Score',
                    description = 'Remet le score joueur à 0',
                    icon = 'rotate-ccw',
                    event = 'paintball_admin:resetPlayerScore',
                    args = data.identifier
                },
                {
                    
                    title = '🚫 Kick de l\'équipe',
                    description = 'Force la sortie du joueur de sa team',
                    icon = 'user-x',
                    onSelect = function()
                        print("[UI] Envoi au serveur : kick", data.identifier)
                        TriggerServerEvent('paintball_admin:kickFromTeam', data.identifier)
                    end
                
                }

            }
        })

        lib.showContext('paintball_admin_player_menu')
    end, query)
end)
----------------------------------------------------------
RegisterNetEvent('paintball_admin:viewPlayerSkills', function(identifier)
    lib.callback('paintball_admin:getPlayerSkillsFullList', false, function(skills)
        if not skills then
            return lib.notify({ title = "Erreur", description = "Impossible de charger les compétences", type = "error" })
        end

        local options = {}

        for _, skill in ipairs(skills) do
            table.insert(options, {
                title = (skill.owned and '✅ ' or '➕ ') .. skill.name,
                description = skill.type:upper() .. ' – ' .. skill.description,
                icon = skill.owned and 'lock' or 'plus',
                disabled = skill.owned,
                onSelect = function()
                    TriggerServerEvent('paintball_admin:addSkillToPlayer', identifier, skill.id)
                end
            })
        end

        lib.registerContext({
            id = 'paintball_admin_player_skills',
            title = 'Compétences du joueur',
            menu = 'paintball_admin_player_menu',
            options = options
        })

        lib.showContext('paintball_admin_player_skills')
    end, identifier)
end)

--------------------------------------------------------------
RegisterNetEvent('paintball_admin:viewPlayerMenu', function(identifier)
    if not identifier then return end

    lib.callback('paintball_admin:getPlayerData', false, function(data)
        if not data then
            return lib.notify({
                title = "Introuvable",
                description = "Impossible de charger ce joueur.",
                type = "error"
            })
        end

        lib.registerContext({
            id = 'paintball_admin_player_menu',
            title = ('Joueur : %s'):format(data.firstname or data.identifier),
            menu = 'paintball_admin_team_members', -- retour arrière sur la liste
            options = {
                {
                    title = '👥 Team : ' .. (data.team_name or 'Aucune'),
                    description = 'Score: ' .. data.score,
                    icon = 'users'
                },
                --{
                --    title = '📍 Dans la zone',
                --    description = data.in_zone and '✅ Oui' or '❌ Non',
                --    icon = data.in_zone and 'map-pin' or 'slash'
                --},
                {
                    title = '🎯 Total Kills : ' .. (data.total_kills or 0),
                    icon = 'skull'
                },
                {
                    title = '🧠 Compétences',
                    description = 'Voir ou forcer des compétences',
                    icon = 'brain',
                    event = 'paintball_admin:viewPlayerSkills',
                    args = data.identifier
                },
                {
                    title = '🧯 Reset Score',
                    description = 'Remet le score joueur à 0',
                    icon = 'rotate-ccw',
                    event = 'paintball_admin:resetPlayerScore',
                    args = data.identifier
                },
                {
                    title = '🚫 Kick de l\'équipe',
                    description = 'Force la sortie du joueur de sa team',
                    icon = 'user-x',
                    onSelect = function()
                        print("[UI] Kick d'équipe via menu joueur direct", data.identifier)
                        TriggerServerEvent('paintball_admin:kickFromTeam', data.identifier)
                    end
                }
            }
        })

        lib.showContext('paintball_admin_player_menu')
    end, identifier)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
