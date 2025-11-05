--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local IsPlayerAdmin = require 'admin.modules.permission'.IsPlayerAdmin

lib.callback.register('paintball_admin:getAllTeams', function(src)
    if not IsPlayerAdmin(src) then return nil end

    return MySQL.query.await([[
        SELECT pt.id, pt.name, pt.score, pt.public, COUNT(pp.identifier) as members
        FROM paintball_teams pt
        LEFT JOIN paintball_players pp ON pp.team_id = pt.id
        GROUP BY pt.id
    ]])
end)

-----------------------------------------------------

lib.callback.register('paintball_admin:getAllTeams', function(src)
    if not IsPlayerAdmin(src) then return nil end

    local teams = MySQL.query.await('SELECT id, name, score, public FROM paintball_teams')
    for i = 1, #teams do
        local count = MySQL.scalar.await('SELECT COUNT(*) FROM paintball_players WHERE team_id = ?', { teams[i].id })
        teams[i].members = count
    end

    return teams
end)

-----------------------------------------------------------
lib.callback.register('paintball_admin:getAllSkillsWithTeamStatus', function(source, teamId)
    if not exports['paintball_teams']:IsPlayerAdmin(source) then return nil end

    local allSkills = MySQL.query.await('SELECT * FROM paintball_skills')
    local owned = MySQL.query.await('SELECT skill_id FROM paintball_team_skills WHERE team_id = ?', { teamId })

    local ownedSet = {}
    for _, row in ipairs(owned) do
        ownedSet[row.skill_id] = true
    end

    for _, skill in ipairs(allSkills) do
        skill.owned = ownedSet[skill.id] or false
    end

    return allSkills
end)
-----------------------------------------------------
RegisterNetEvent('paintball_admin:forceAddSkill', function(teamId, skillId)
    local src = source
    if not IsPlayerAdmin(source) then return nil end


    local alreadyHas = MySQL.scalar.await('SELECT COUNT(*) FROM paintball_team_skills WHERE team_id = ? AND skill_id = ?', { teamId, skillId })
    if alreadyHas > 0 then return end

    MySQL.insert.await('INSERT INTO paintball_team_skills (team_id, skill_id) VALUES (?, ?)', { teamId, skillId })

    TriggerClientEvent('ox_lib:notify', src, {
        title = "✅ Compétence ajoutée",
        description = "La compétence a bien été assignée à l'équipe.",
        type = "success"
    })
end)
------------------------------------------------------------
RegisterNetEvent('paintball_admin:removeSkill', function(teamId, skillIdentifier)
    local src = source
    if not IsPlayerAdmin(source) then return nil end


    local skillId = MySQL.scalar.await('SELECT id FROM paintball_skills WHERE identifier = ?', { skillIdentifier })
    if not skillId then return end

    MySQL.update.await('DELETE FROM paintball_team_skills WHERE team_id = ? AND skill_id = ?', { teamId, skillId })

    TriggerClientEvent('ox_lib:notify', src, {
        title = "🔧 Compétence retirée",
        description = "La compétence a été retirée de l'équipe.",
        type = "success"
    })
end)
---------------------------------------------------------
RegisterNetEvent('paintball_admin:resetTeamSkillsNow', function(teamId)
    local src = source
    if not IsPlayerAdmin(source) then return nil end


    MySQL.update.await('DELETE FROM paintball_team_skills WHERE team_id = ?', { teamId })

    TriggerClientEvent('ox_lib:notify', src, {
        title = "🧨 Réinitialisation",
        description = "Toutes les compétences de l'équipe ont été supprimées.",
        type = "success"
    })

    if AdminConfig.EnableLogging then
        print(("[PAINTBALL ADMIN] %s a reset toutes les compétences de la team ID %s"):format(GetPlayerName(src), teamId))
    end
end)
---------------------------------------------------------
lib.callback.register('paintball_admin:getTeamMembers', function(src, teamId)
    if not IsPlayerAdmin(src) then return nil end

    local rows = MySQL.query.await([[
        SELECT pp.identifier, pp.score, pp.total_kills, u.firstname
        FROM paintball_players pp
        LEFT JOIN users u ON u.identifier COLLATE utf8mb4_general_ci = pp.identifier COLLATE utf8mb4_general_ci
        WHERE pp.team_id = ?
    ]], { teamId })

    return rows
end)
-------------------------------------------------------------
RegisterNetEvent('paintball_admin:deleteTeamNow', function(teamId)
    local src = source
    if not IsPlayerAdmin(src) then return end

    -- Supprimer les membres
    MySQL.update.await('DELETE FROM paintball_players WHERE team_id = ?', { teamId })

    -- Supprimer les compétences de l’équipe
    MySQL.update.await('DELETE FROM paintball_team_skills WHERE team_id = ?', { teamId })

    -- Supprimer l’équipe elle-même
    MySQL.update.await('DELETE FROM paintball_teams WHERE id = ?', { teamId })

    TriggerClientEvent('ox_lib:notify', src, {
        title = "🗑️ Équipe supprimée",
        description = "L'équipe et tous ses membres ont été supprimés.",
        type = "success"
    })
end)
---------------------------------------------------------------
RegisterNetEvent('paintball_admin:toggleTeamPublicStatus', function(teamId, currentStatus)
    local src = source
    if not IsPlayerAdmin(src) then return end

    local newStatus = (currentStatus == 1 and 0 or 1)

    MySQL.update.await('UPDATE paintball_teams SET public = ? WHERE id = ?', {
        newStatus, teamId
    })

    TriggerClientEvent('ox_lib:notify', src, {
        title = "🔁 Statut modifié",
        description = ("Team désormais %s"):format(newStatus == 1 and "Publique" or "Privée"),
        type = "inform"
    })
end)

---------------------------------------------------
--lib.callback.register('paintball_admin:getTeamSkills', function(src, teamId)
--    if not IsPlayerAdmin(src) then return nil end
--
--    -- Récupère les compétences possédées par l'équipe
--    local rows = MySQL.query.await([[
--        SELECT s.name, s.identifier, s.description, s.type
--        FROM paintball_team_skills pts
--        JOIN paintball_skills s ON pts.skill_id = s.id
--        WHERE pts.team_id = ?
--    ]], { teamId })
--
--    return rows
--end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
