--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local dialogs = require 'admin.ui.dialogs'

local function openTeamActionsMenu(team)
    lib.registerContext({
        id = 'paintball_admin_team_actions',
        title = 'Équipe : ' .. team.name,
        options = {
            {
                title = '👥 Voir les membres',
                description = 'Afficher tous les joueurs dans cette équipe',
                icon = 'user-group',
                event = 'paintball_admin:viewTeamMembers',
                args = team.id
            },
            {
                title = '🗑️ Supprimer l\'équipe',
                description = 'Efface complètement cette équipe et ses membres',
                icon = 'trash',
                event = 'paintball_admin:deleteTeam',
                args = team.id
            },
            {
                title = '👁️ Voir les compétences',
                description = 'Afficher la liste des compétences actuelles',
                icon = 'list',
                event = 'paintball_admin:viewTeamSkills',
                args = team.id
            },
            {
                title = '➕ Ajouter une compétence',
                description = 'Donner une compétence à cette team',
                icon = 'plus-circle',
                event = 'paintball_admin:addSkillToTeam',
                args = team.id
            },
            {
                title = '➖ Retirer une compétence',
                description = 'Supprimer une compétence de cette team',
                icon = 'minus-circle',
                event = 'paintball_admin:removeSkillFromTeam',
                args = team.id
            },
            {
                title = '🧨 Réinitialiser toutes les compétences',
                description = 'Supprime toutes les compétences de cette team',
                icon = 'trash',
                event = 'paintball_admin:resetTeamSkills',
                args = team.id
            },
            {
                title = team.public == 1 and '🔒 Rendre Privée' or '🌐 Rendre Publique',
                description = 'Changer le statut de visibilité de cette team',
                icon = 'globe',
                onSelect = function()
                    TriggerServerEvent('paintball_admin:toggleTeamPublicStatus', team.id, team.public)
                end
            }

        }
    })

    lib.showContext('paintball_admin_team_actions')
end

RegisterNetEvent('paintball_admin:teamsMenu', function()
    lib.callback('paintball_admin:getAllTeams', false, function(teams)
        if not teams or #teams == 0 then
            return lib.notify({ title = "Teams", description = "Aucune équipe trouvée", type = "error" })
        end


        local options = {}
        for _, t in ipairs(teams) do
            --print('[CLIENT DEBUG]', json.encode(t))
            table.insert(options, {
                title = ('%s (ID %d)'):format(t.name, t.id),
                description = ('🏆 Score: %s | 👥 Membres: %s'):format(
                    t.score,
                    t.members or 0
                ),

                --print(('TEAM #%s | OWNER ID = %s'):format(t[i].id, t[i].owner_identifier)),
                icon = 'users',
                onSelect = function()
                    openTeamActionsMenu(t)
                end
            })

        end

        lib.registerContext({
            id = 'paintball_admin_team_list',
            title = '📁 Liste des Équipes',
            options = options
        })

        lib.showContext('paintball_admin_team_list')
    end)
end)



-----------------------------------------

RegisterNetEvent('paintball_admin:viewTeamSkills', function(teamId)
    lib.callback('paintball_admin:getTeamSkills', false, function(skills)
        if not skills then
            return lib.notify({ title = "Erreur", description = "Impossible de charger les compétences", type = "error" })
        end

        local options = {}

        if #skills == 0 then
            table.insert(options, {
                title = "Aucune compétence",
                description = "Cette équipe ne possède actuellement aucune compétence.",
                icon = 'ban'
            })
        else
            for _, skill in ipairs(skills) do
            local typeText = skill.type and skill.type:upper() or 'INCONNU'
            local desc = skill.description or 'Aucune description'
                    
            table.insert(options, {
                title = '🧠 ' .. skill.name,
                description = typeText .. ' – ' .. desc,
                icon = 'star'
            })
end

        end

        lib.registerContext({
            id = 'paintball_admin_team_skills',
            title = 'Compétences de l\'équipe',
            menu = 'paintball_admin_team_actions',
            options = options
        })

        lib.showContext('paintball_admin_team_skills')
    end, teamId)
end)
------------------------------------------------

RegisterNetEvent('paintball_admin:addSkillToTeam', function(teamId)
    lib.callback('paintball_admin:getAllSkillsWithTeamStatus', false, function(skillList)
        if not skillList then
            return lib.notify({ title = "Erreur", description = "Chargement impossible", type = "error" })
        end

        local options = {}

        for _, skill in ipairs(skillList) do
            table.insert(options, {
                title = (skill.owned and '✅ ' or '➕ ') .. skill.name,
                description = skill.type:upper() .. ' – ' .. skill.description,
                icon = skill.owned and 'lock' or 'plus-circle',
                disabled = skill.owned,
                onSelect = function()
                    TriggerServerEvent('paintball_admin:forceAddSkill', teamId, skill.id)
                end
            })
        end

        lib.registerContext({
            id = 'paintball_admin_add_skill',
            title = 'Ajouter une compétence',
            menu = 'paintball_admin_team_actions',
            options = options
        })

        lib.showContext('paintball_admin_add_skill')
    end, teamId)
end)
-----------------------------------------------------
RegisterNetEvent('paintball_admin:removeSkillFromTeam', function(teamId)
    lib.callback('paintball_admin:getTeamSkills', false, function(skills)
        if not skills or #skills == 0 then
            return lib.notify({
                title = "Aucune compétence",
                description = "Cette équipe ne possède aucune compétence.",
                type = "inform"
            })
        end

        local options = {}
        for _, skill in ipairs(skills) do
            table.insert(options, {
                title = '❌ ' .. skill.name,
                --description = typeText .. ' – ' .. desc,
                --description = skill.type:upper() .. ' – ' .. skill.description,
                icon = 'minus-circle',
                onSelect = function()
                    TriggerServerEvent('paintball_admin:removeSkill', teamId, skill.identifier)
                end
            })
        end

        lib.registerContext({
            id = 'paintball_admin_remove_skill',
            title = 'Retirer une compétence',
            menu = 'paintball_admin_team_actions',
            options = options
        })

        lib.showContext('paintball_admin_remove_skill')
    end, teamId)
    TriggerClientEvent('paintball_admin:refreshTeamSkills', src, teamId)
end)
-----------------------------------------------------------------
RegisterNetEvent('paintball_admin:resetTeamSkills', function(teamId)
    local confirm = lib.alertDialog({
        header = '❗ Réinitialiser les compétences',
        content = 'Cette action supprimera **toutes les compétences** de l\'équipe.\nEs-tu sûr ?',
        centered = true,
        cancel = true
    })

    local confirm = dialogs.confirmReset("🧨 Réinitialiser ?", "Cette action est irréversible.")
    if confirm == 'confirm' then
        TriggerServerEvent('paintball_admin:resetTeamSkillsNow', teamId)
    end
end)
--------------------------------------
RegisterNetEvent('paintball_admin:viewTeamMembers', function(teamId)
    lib.callback('paintball_admin:getTeamMembers', false, function(players)
        if not players or #players == 0 then
            return lib.notify({
                title = "Aucun membre",
                description = "Cette équipe ne contient aucun joueur.",
                type = "inform"
            })
        end

        local options = {}
        for _, p in ipairs(players) do
            table.insert(options, {
                title = p.firstname or p.identifier,
                description = 'Score : ' .. p.score .. ' | Kills : ' .. p.total_kills,
                icon = 'user',
                onSelect = function()
                    TriggerEvent('paintball_admin:viewPlayerMenu', p.identifier)
                end
            })
        end

        lib.registerContext({
            id = 'paintball_admin_team_members',
            title = '👥 Membres de l\'équipe',
            menu = 'paintball_admin_team_actions',
            options = options
        })

        lib.showContext('paintball_admin_team_members')
    end, teamId)
end)
---------------------------------------------
RegisterNetEvent('paintball_admin:deleteTeam', function(teamId)
    local confirm = lib.alertDialog({
        header = '⚠️ Supprimer cette équipe ?',
        content = 'Tous les membres seront aussi supprimés.\nEs-tu sûr ?',
        centered = true,
        cancel = true
    })

    if confirm == 'confirm' then
        TriggerServerEvent('paintball_admin:deleteTeamNow', teamId)
    end
end)


RegisterNetEvent('paintball_admin:refreshTeamSkills', function(teamId)
    TriggerEvent('paintball_admin:viewTeamSkills', teamId)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
