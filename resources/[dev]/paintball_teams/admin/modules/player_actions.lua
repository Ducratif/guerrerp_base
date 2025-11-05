--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local IsPlayerAdmin = require 'admin.modules.permission'.IsPlayerAdmin


lib.callback.register('paintball_admin:getPlayerData', function(src, identifier)
    if not IsPlayerAdmin(src) then return nil end

    local result = MySQL.query.await([[
        SELECT pp.identifier, pp.team_id, pp.score, pp.total_kills, users.firstname, pt.name as team_name
        FROM paintball_players pp
        LEFT JOIN users ON users.identifier COLLATE utf8mb4_general_ci = pp.identifier COLLATE utf8mb4_general_ci
        LEFT JOIN paintball_teams pt ON pt.id = pp.team_id
        WHERE pp.identifier = ?
        LIMIT 1
    ]], { identifier })

    if not result or not result[1] then return nil end

    local data = result[1]

    -- Ajoute détection de zone
    --data.in_zone = ZonePlayerStates[data.identifier] == true

    --data.in_zone = data.in_zone or false

    return data
end)

---------------------------------------------------------
RegisterNetEvent('paintball_admin:resetPlayerScore', function(identifier)
    local src = source
    if not IsPlayerAdmin(source) then return nil end


    MySQL.update.await('UPDATE paintball_players SET score = 0 WHERE identifier = ?', { identifier })

    TriggerClientEvent('ox_lib:notify', src, {
        title = "✅ Score réinitialisé",
        description = "Le score du joueur a été mis à 0.",
        type = "success"
    })
end)
---------------------------------------------------------

RegisterNetEvent('paintball_admin:kickFromTeam', function(identifier)
    local src = source
    print("[SERVER] kickFromTeam déclenché par", src, "pour", identifier)

    if not IsPlayerAdmin(src) then
        print("[ADMIN BLOCK] Pas autorisé :", src)
        return
    end

    if not identifier then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Erreur",
            description = "Identifiant du joueur non transmis.",
            type = "error"
        })
        return
    end

    -- Vérifie que le joueur existe
    local exist = MySQL.scalar.await('SELECT COUNT(*) FROM paintball_players WHERE identifier = ?', { identifier })
    if exist == 0 then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Erreur",
            description = "Ce joueur n'est pas enregistré.",
            type = "error"
        })
        return
    end

    -- Supprimer son équipe
    MySQL.update.await('UPDATE paintball_players SET team_id = NULL WHERE identifier = ?', { identifier })

    TriggerClientEvent('ox_lib:notify', src, {
        title = "✅ Joueur kické",
        description = "Le joueur a été retiré de son équipe.",
        type = "success"
    })
end)


---------------------------------------------------------
lib.callback.register('paintball_admin:getPlayerSkillsFullList', function(src, identifier)
    if not exports['paintball_teams']:IsPlayerAdmin(src) then return nil end

    local skills = MySQL.query.await('SELECT * FROM paintball_skills')
    local playerTeam = MySQL.scalar.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { identifier })

    if not playerTeam then return nil end

    local owned = MySQL.query.await('SELECT skill_id FROM paintball_team_skills WHERE team_id = ?', { playerTeam })

    local ownedSet = {}
    for _, row in ipairs(owned) do
        ownedSet[row.skill_id] = true
    end

    for _, skill in ipairs(skills) do
        skill.owned = ownedSet[skill.id] or false
    end

    return skills
end)
---------------------------------------------------------
RegisterNetEvent('paintball_admin:addSkillToPlayer', function(identifier, skillId)
    local src = source
    if not IsPlayerAdmin(source) then return nil end


    local teamId = MySQL.scalar.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { identifier })
    if not teamId then return end

    local alreadyHas = MySQL.scalar.await('SELECT COUNT(*) FROM paintball_team_skills WHERE team_id = ? AND skill_id = ?', { teamId, skillId })
    if alreadyHas > 0 then return end

    MySQL.insert.await('INSERT INTO paintball_team_skills (team_id, skill_id) VALUES (?, ?)', { teamId, skillId })

    TriggerClientEvent('ox_lib:notify', src, {
        title = "🧠 Compétence ajoutée",
        description = "La compétence a été ajoutée à la team du joueur.",
        type = "success"
    })
end)
---------------------------------------------------------

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
