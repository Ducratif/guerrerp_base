--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports['es_extended']:getSharedObject()
--local SkillSystem = require 'server.paintball_skills'

local zonePlayers = {}
local killStreaks = {} -- [playerId] = nombre de kills consécutifs
local dominanceTracking = {} -- [teamId] = { active = false, time = os.time(), members = { [src] = true }, timerThread = nil }


RegisterNetEvent('paintball:checkTeamStatusForHelp', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local identifier = xPlayer.identifier:gsub("^char%d+:", "")
    local result = MySQL.query.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { identifier })

    if not result[1] then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "🎯 Bienvenue au Paintball !",
            description = "Rejoins une équipe pour commencer.\n\n\nTu peux gagner des points via les kills et dégâts.\n\n\n\n\nUtilise le muscle F9!",
            type = "inform",
            duration = 15000
        })
    end
end)


function GetIdentifier(src)
    local identifiers = GetPlayerIdentifiers(src)
    for _, id in ipairs(identifiers) do
        if string.sub(id, 1, 8) == "license:" then
            return string.sub(id, 9) -- enlève "license:"
        end
    end
    return nil
end

function updateHud(src)
    if not src or not GetPlayerName(src) then
        --print("[SERVER] ❌ updateHud: src n'est pas un joueur valide !", src)
        return
    end

    local identifier = GetIdentifier(src):gsub("^char%d+:", "")
    local player = MySQL.query.await('SELECT score, team_id FROM paintball_players WHERE identifier = ?', { identifier })
    if not player[1] then return end


    local playerScore = player[1].score
    local teamId = player[1].team_id

    local team = MySQL.query.await('SELECT score FROM paintball_teams WHERE id = ?', { teamId })
    if not team[1] then return end

    local teamScore = team[1].score
    local teamCount, totalCount = 0, 0

    for id in pairs(zonePlayers) do
        totalCount += 1
        local otherIdentifier = GetIdentifier(id)
        local p = MySQL.query.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { otherIdentifier })
        if p[1] and p[1].team_id == teamId then
            teamCount += 1
        end
    end

    TriggerClientEvent('paintball:showHud', src, teamScore, playerScore, teamCount, totalCount)
end



AddEventHandler('playerDropped', function()
    zonePlayers[source] = nil
end)

RegisterNetEvent('paintball:enteredZone', function()
    local src = source
    zonePlayers[src] = true
    updateHud(src)

    -- Met à jour tous les autres joueurs dans la zone
    for id in pairs(zonePlayers) do
        updateHud(id)
    end
    TriggerEvent('paintball:checkTeamStatus')

    --Compétence: zone_dominance
        -- Vérif si team a zone_dominance
    local identifier = GetIdentifier(src):gsub("^char%d+:", "")
    local res = MySQL.query.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { identifier })
    if res[1] then
        local teamId = res[1].team_id

        if exports['paintball_teams']:hasSkill(teamId, 'zone_dominance') then
            dominanceTracking[teamId] = dominanceTracking[teamId] or { active = false, members = {}, timerThread = nil }
            dominanceTracking[teamId].members[src] = true

            StartDominanceTimerIfValid(teamId)
        end
    end

    -------------
end)


RegisterNetEvent('paintball:requestMenuData', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local identifier = xPlayer.identifier:gsub("^char%d+:", "")
    local result = MySQL.query.await('SELECT * FROM paintball_players WHERE identifier = ?', { identifier })

    if result[1] then
        local teamId = result[1].team_id

        local teamData = MySQL.query.await('SELECT id, name, password, public, owner_identifier FROM paintball_teams WHERE id = ?', { teamId })
        if not teamData[1] then return end

        local team = teamData[1]
        local isOwner = (team.owner_identifier == identifier)
        --local members = MySQL.query.await('SELECT identifier, score FROM paintball_players WHERE team_id = ?', { teamId })
        local members = MySQL.query.await([[
    SELECT pp.identifier, pp.score, users.firstname
    FROM paintball_players pp
    JOIN users ON users.identifier COLLATE utf8mb4_general_ci = pp.identifier COLLATE utf8mb4_general_ci
    WHERE pp.team_id = ?
]], { teamId })



        TriggerClientEvent('paintball:client:openTeamManagementMenu', src, {
            isOwner = isOwner,
            teamId = team.id,
            teamName = team.name,
            public = team.public,
            members = members
        })

    else
        local teams = MySQL.query.await([[
            SELECT pt.id, pt.name, pt.score, pt.public,
                   COUNT(pp.identifier) AS members
            FROM paintball_teams pt
            LEFT JOIN paintball_players pp ON pt.id = pp.team_id
            GROUP BY pt.id
        ]], {})

        TriggerClientEvent('paintball:client:openTeamMenu', src, teams)
    end
end)

RegisterNetEvent('paintball:verifyPassword', function(teamId, password)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local identifier = xPlayer.identifier:gsub("^char%d+:", "")

    local res = MySQL.query.await('SELECT password, public FROM paintball_teams WHERE id = ?', { teamId })

    if not res[1] then return end

    local isPublic = (res[1].public == true or res[1].public == 1)

    if isPublic or res[1].password == password then
        joinTeam(src, identifier, teamId)
    else
        lib.notify({
            title = "Mot de passe incorrect",
            description = "Vérifie les informations.",
            type = "error"
        })
    end
end)


RegisterNetEvent('paintball:createTeam', function(name, password)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    if xPlayer.getAccount('bank').money >= Config.TeamCreationPrice then
        xPlayer.removeAccountMoney('bank', Config.TeamCreationPrice)

        local identifier = xPlayer.identifier:gsub("^char%d+:", "")

        local inserted = MySQL.insert.await('INSERT INTO paintball_teams (name, password, public, owner_identifier) VALUES (?, ?, ?, ?)', {
            name, password, 1, identifier
        })

        if inserted then
            MySQL.insert.await('INSERT INTO paintball_players (identifier, team_id, score) VALUES (?, ?, 0)', {
                identifier, inserted
            })

            TriggerClientEvent('ox_lib:notify', src, {
                title = "Équipe créée",
                description = "Ton équipe a bien été créée et tu l\\'as rejointe.",
                type = "success"
            })
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Pas assez d'argent",
            description = "Tu n\\'as pas 1M$ en banque.",
            type = "error"
        })
    end
end)



RegisterNetEvent('paintball:addDamage', function(damage)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local identifier = xPlayer.identifier:gsub("^char%d+:", "")
    local player = MySQL.query.await('SELECT team_id, score FROM paintball_players WHERE identifier = ?', { identifier })
    if not player[1] then return end

    local newScore = player[1].score
    if damage >= 100 then
        newScore += 1
    end

    MySQL.update.await('UPDATE paintball_players SET score = ? WHERE identifier = ?', {
        newScore, identifier
    })

    -- Optionnel : ajout au score de la team
    MySQL.update.await('UPDATE paintball_teams SET score = score + 1 WHERE id = ?', {
        player[1].team_id
    })

    MySQL.update.await('UPDATE paintball_players SET total_damage = total_damage + ? WHERE identifier = ?', {
        amount, identifier
    })

    updateHud(src)
end)

function joinTeam(src, identifier, teamId)
    local hasStartBoost = exports['paintball_teams']:hasSkill(teamId, 'start_boost')
    local startScore = hasStartBoost and 10 or 0

    MySQL.insert.await('INSERT INTO paintball_players (identifier, team_id, score) VALUES (?, ?, ?)', {
        identifier, teamId, startScore
    })

    if hasStartBoost then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "🎖️ Bonus de Recrue",
            description = "Tu démarres avec 10 points bonus grâce à la compétence de ton équipe.",
            type = "success"
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Paintball",
            description = "Tu as rejoint l'équipe !",
            type = "success"
        })
    end

    updateHud(src)
end



RegisterNetEvent('paintball:requestTeamManagement', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local identifier = xPlayer.identifier:gsub("^char%d+:", "")

    local playerData = MySQL.query.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { identifier })
    if not playerData[1] then return end
    local teamId = playerData[1].team_id

    local teamData = MySQL.query.await('SELECT id, name, password, public, owner_identifier FROM paintball_teams WHERE id = ?', { teamId })
    if not teamData[1] then return end

    local team = teamData[1]
    local isOwner = (team.owner_identifier == identifier)

   -- local members = MySQL.query.await('SELECT identifier, score FROM paintball_players WHERE team_id = ?', { teamId })
    local members = MySQL.query.await([[
    SELECT pp.identifier, pp.score, users.firstname
    FROM paintball_players pp
    JOIN users ON users.identifier COLLATE utf8mb4_general_ci = pp.identifier COLLATE utf8mb4_general_ci
    WHERE pp.team_id = ?
]], { teamId })



    TriggerClientEvent('paintball:client:openTeamManagementMenu', src, {
        isOwner = isOwner,
        teamId = team.id,
        teamName = team.name,
        public = team.public,
        members = members,
        selfIdentifier = identifier
    })
end)


RegisterNetEvent('paintball:kickMember', function(teamId, targetIdentifier)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local identifier = xPlayer.identifier:gsub("^char%d+:", "")

    local owner = MySQL.scalar.await('SELECT owner_identifier FROM paintball_teams WHERE id = ?', { teamId })
    if owner ~= identifier then return end

    MySQL.update.await('DELETE FROM paintball_players WHERE identifier = ? AND team_id = ?', {
        targetIdentifier, teamId
    })

    TriggerClientEvent('ox_lib:notify', src, { title = "Team", description = "Joueur expulsé.", type = "success" })
end)

RegisterNetEvent('paintball:changePassword', function(teamId, newPassword)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local identifier = xPlayer.identifier:gsub("^char%d+:", "")

    local owner = MySQL.scalar.await('SELECT owner_identifier FROM paintball_teams WHERE id = ?', { teamId })
    if owner ~= identifier then return end

    MySQL.update.await('UPDATE paintball_teams SET password = ? WHERE id = ?', {
        newPassword, teamId
    })

    TriggerClientEvent('ox_lib:notify', src, { title = "Team", description = "Mot de passe modifié.", type = "success" })
end)

RegisterNetEvent('paintball:togglePublicStatus', function(teamId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local identifier = xPlayer.identifier:gsub("^char%d+:", "")

    local current = MySQL.scalar.await('SELECT public FROM paintball_teams WHERE id = ?', { teamId })
    local newStatus = (current == true or current == 1) and 0 or 1


    MySQL.update.await('UPDATE paintball_teams SET public = ? WHERE id = ?', {
        newStatus, teamId
    })

    TriggerClientEvent('ox_lib:notify', src, { title = "Team", description = "Visibilité modifiée.", type = "success" })
end)

----------------------------------
RegisterNetEvent('paintball:transferTeam', function(teamId, newOwner)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local identifier = xPlayer.identifier:gsub("^char%d+:", "")

    -- Vérifie que le joueur est bien propriétaire
    local owner = MySQL.scalar.await('SELECT owner_identifier FROM paintball_teams WHERE id = ?', { teamId })
    if not owner or owner ~= identifier then
        print(("[ALERTE] Tentative de transfert illégitime par %s (team %s)"):format(identifier, teamId))
        return
    end

    -- Vérifie que le nouveau owner fait bien partie de l'équipe
    local validMember = MySQL.scalar.await([[
        SELECT COUNT(*) FROM paintball_players
        WHERE identifier = ? AND team_id = ?
    ]], { newOwner, teamId })

    if validMember == 0 then
        return TriggerClientEvent('ox_lib:notify', src, {
            title = "Erreur",
            description = "Le joueur n'appartient pas à cette équipe.",
            type = "error"
        })
    end

    -- Transfert
    MySQL.update.await('UPDATE paintball_teams SET owner_identifier = ? WHERE id = ?', {
        newOwner, teamId
    })

    TriggerClientEvent('ox_lib:notify', src, {
        title = "Transfert effectué",
        description = "La propriété a été transférée avec succès.",
        type = "success"
    })

    -- Notify le nouveau owner si en ligne
    for _, id in pairs(GetPlayers()) do
        local target = ESX.GetPlayerFromId(tonumber(id))
        if target and target.identifier == newOwner then
            TriggerClientEvent('ox_lib:notify', target.source, {
                title = "🎉 Nouvelle Propriété",
                description = "Tu es maintenant chef de ton équipe.",
                type = "success"
            })
            break
        end
    end
end)

-----------------------------------------------

RegisterNetEvent('paintball:deleteTeam', function(teamId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local identifier = xPlayer.identifier:gsub("^char%d+:", "")

    local owner = MySQL.scalar.await('SELECT owner_identifier FROM paintball_teams WHERE id = ?', { teamId })
    if owner ~= identifier then return end

    MySQL.update.await('DELETE FROM paintball_players WHERE team_id = ?', { teamId })
    MySQL.update.await('DELETE FROM paintball_teams WHERE id = ?', { teamId })

    TriggerClientEvent('ox_lib:notify', src, { title = "Team", description = "Équipe supprimée.", type = "success" })
end)

RegisterNetEvent('paintball:leaveTeam', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local identifier = xPlayer.identifier:gsub("^char%d+:", "")

    local ownerCheck = MySQL.scalar.await('SELECT id FROM paintball_teams WHERE owner_identifier = ?', { identifier })
    if ownerCheck then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Team",
            description = "Tu es le fondateur, transfère avant de partir.",
            type = "error"
        })
        return
    end

    MySQL.update.await('DELETE FROM paintball_players WHERE identifier = ?', { identifier })
    TriggerClientEvent('ox_lib:notify', src, {
        title = "Team",
        description = "Tu as quitté l'équipe.",
        type = "success"
    })
end)



------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------

--=============SYSTEM DE KILL/DEGAT=============--

------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------

local damageTracker = {}
local pendingScores = {}

-- ✅ Enregistrement des dégâts
local lastVictimHealth = {}

-- ✅ Ajout de points de dégâts toutes les 30 sec
CreateThread(function()
    while true do
        Wait(30000)
        for id, amount in pairs(damageTracker) do
            local points = math.floor(amount / 100)
            if points > 0 then
                local identifier = GetIdentifier(id)
                MySQL.update.await('UPDATE paintball_players SET score = score + ? WHERE identifier = ?', { points, identifier })
                MySQL.update.await([[UPDATE paintball_teams SET score = score + ? WHERE id = (SELECT team_id FROM paintball_players WHERE identifier = ?)]]
                    , { points, identifier })
                pendingScores[id] = (pendingScores[id] or 0) + points

                TriggerClientEvent('ox_lib:notify', id, {
                    type = 'inform',
                    title = 'Paintball',
                    description = ('Tu as gagné %s point(s) pendant ce round.'):format(points)
                })
            end
        end
        damageTracker = {}
    end
end)

-- ✅ Quand il quitte la zone
RegisterNetEvent('paintball:onLeaveZone', function()
    local src = source
    --print("[SERVER] Reçu : paintball:onLeaveZone de", src)
    zonePlayers[src] = nil
    killStreaks[src] = nil


    --TriggerClientEvent('paintball:showHud', src, 0, 0, 0, 0)
    TriggerClientEvent('paintball:leftZone', src)
    --updateHud(src)

    if pendingScores[src] then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'inform',
            title = 'Paintball',
            description = ('Tu as gagné %s point(s) durant ton passage.'):format(pendingScores[src])
        })
        pendingScores[src] = nil
    end

    ---Compétence: zone_dominance
        local identifier = GetIdentifier(source)
        local res = MySQL.query.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { identifier })
        if res[1] then
            local teamId = res[1].team_id
            if dominanceTracking[teamId] then
                CancelDominance(teamId, "Un membre est mort ou a quitté la zone.")
            end
        end

    ------

    -- Update les autres joueurs
    for id in pairs(zonePlayers) do
        updateHud(id)
    end
end)

RegisterNetEvent('paintball:playerKilled', function(killerId)
    local victim = source
    killStreaks[victim] = 0
    if not zonePlayers[victim] then return end
    if not killerId or not zonePlayers[killerId] then return end

    local killerIdent = GetIdentifier(killerId)
    local victimIdent = GetIdentifier(victim)

    ---Compétence: zone_dominance
        local identifier = GetIdentifier(source)
        local res = MySQL.query.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { identifier })
        if res[1] then
            local teamId = res[1].team_id
            if dominanceTracking[teamId] then
                CancelDominance(teamId, "Un membre est mort ou a quitté la zone.")
            end
        end

    ------

    -- ✅ Vérifie si c’est un coéquipier
    local sameTeam = MySQL.scalar.await([[
        SELECT COUNT(*) FROM paintball_players
        WHERE team_id = (SELECT team_id FROM paintball_players WHERE identifier = ?)
        AND identifier = ?
    ]], { killerIdent, victimIdent })

    if sameTeam and sameTeam > 0 then
        --print("[PAINTBALL] 🔁 Kill entre coéquipiers ignoré.")
        TriggerClientEvent('ox_lib:notify', -1, {
            type = 'error',
            title = "Paintball",
            description = ("☠️ TIRE SUR ALLIE = AUCUN POINT"),
            duration = 5000
        })
        return
    end

    -- ✅ Requête pour les noms des teams
    local teams = MySQL.query.await([[
        SELECT
            (SELECT name FROM paintball_teams WHERE id = (SELECT team_id FROM paintball_players WHERE identifier = ?)) AS killer_team,
            (SELECT name FROM paintball_teams WHERE id = (SELECT team_id FROM paintball_players WHERE identifier = ?)) AS victim_team
    ]], { killerIdent, victimIdent })

    local killerTeam = teams[1] and teams[1].killer_team or "Inconnu"
    local victimTeam = teams[1] and teams[1].victim_team or "Inconnu"

    -- ✅ Log et notification
    MySQL.update.await('UPDATE paintball_players SET total_kills = total_kills + 1 WHERE identifier = ?', { killerIdent })

    local teamId = MySQL.scalar.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { killerIdent })
    
    --Activation des compétences s'il les ont    
    local basePoints = 2
    if exports['paintball_teams']:hasSkill(teamId, 'extra_kill_point') then
        basePoints = 3
    end

    -- Incrémentation du streak
    killStreaks[killerId] = (killStreaks[killerId] or 0) + 1

    local bonusPoints = 0
    if exports['paintball_teams']:hasSkill(teamId, 'kill_streak') then
        local streakBonus = 2
        local streakRequired = 3

        if killStreaks[killerId] % streakRequired == 0 then
            bonusPoints = streakBonus
            TriggerClientEvent('ox_lib:notify', killerId, {
                title = "🔥 Série de Kills !",
                description = ("+%s points bonus pour %s kills consécutifs !"):format(streakBonus, streakRequired),
                type = "success"
            })
        end
    end

    local totalPoints = basePoints + bonusPoints

    MySQL.update.await('UPDATE paintball_players SET score = score + ? WHERE identifier = ?', { totalPoints, killerIdent })
    MySQL.update.await('UPDATE paintball_teams SET score = score + ? WHERE id = (SELECT team_id FROM paintball_players WHERE identifier = ?)', { totalPoints, killerIdent })

    pendingScores[killerId] = (pendingScores[killerId] or 0) + totalPoints
    -----

    updateHud(killerId)

    ---Compétence: team_kill_bonus
    -- 🎯 Bonus motivation (si la team a la compétence)
    if exports['paintball_teams']:hasSkill(teamId, 'team_kill_bonus') then
        for otherId in pairs(zonePlayers) do
            if otherId ~= killerId then
                local otherIdent = GetIdentifier(otherId)
                local sameTeam = MySQL.scalar.await([[
                    SELECT COUNT(*) FROM paintball_players
                    WHERE team_id = ? AND identifier = ?
                ]], { teamId, otherIdent })

                if sameTeam and sameTeam > 0 then
                    MySQL.update.await('UPDATE paintball_players SET score = score + 1 WHERE identifier = ?', { otherIdent })
                    MySQL.update.await([[UPDATE paintball_teams SET score = score + 1 WHERE id = ?]], { teamId })
                    
                    pendingScores[otherId] = (pendingScores[otherId] or 0) + 1

                    TriggerClientEvent('ox_lib:notify', otherId, {
                        type = 'inform',
                        title = "💪 Motivation",
                        description = "Un membre de ton équipe a fait un kill. +1 point pour toi !"
                    })
                end
            end
        end
    end


----------------------
    TriggerClientEvent('ox_lib:notify', -1, {
        type = 'inform',
        title = "Paintball",
        description = ("☠️ La team %s a éliminé %s"):format(killerTeam, victimTeam),
        duration = 5000
    })

    TriggerClientEvent('paintball:respawnCountdown', victim)
end)






-------------------------------
-------------------------------
RegisterNetEvent('paintball:checkTeamStatus', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local identifier = xPlayer.identifier:gsub("^char%d+:", "")

    local res = MySQL.scalar.await('SELECT COUNT(*) FROM paintball_players WHERE identifier = ?', { identifier })
    local inTeam = (res and res > 0)

    TriggerClientEvent('paintball:client:updateTeamStatus', src, inTeam)
end)



----------------
RegisterNetEvent('paintball:getScoreboard', function()
    local src = source
    local rows = MySQL.query.await([[
        SELECT pt.name as team_name, SUM(pp.score) as score
        FROM paintball_players pp
        JOIN paintball_teams pt ON pt.id = pp.team_id
        GROUP BY pt.name
        ORDER BY score DESC
        LIMIT 5
    ]])

    if rows then
        TriggerClientEvent('paintball:client:showScoreboard', src, rows)
    end
end)

RegisterNetEvent('paintball:openScoreboard', function()
    local src = source
    local results = MySQL.query.await([[
        SELECT pt.name AS team_name, SUM(pp.score) AS total_score
        FROM paintball_players pp
        JOIN paintball_teams pt ON pp.team_id = pt.id
        GROUP BY pt.id
        ORDER BY total_score DESC
    ]])

    local rows = {}
    for _, row in ipairs(results) do
        table.insert(rows, {
            label = ('🏆 %s - %s pts'):format(row.team_name, row.total_score)
        })
    end

   TriggerClientEvent('paintball:client:showScoreboard', src, results)

end)

lib.callback.register('paintball:getScoreboard', function()
    local teams = MySQL.query.await('SELECT name, score FROM paintball_teams ORDER BY score DESC')
    return teams
end)


----Temps passer en zone
RegisterNetEvent('paintball:logTimeInZone', function(seconds)
    local src = source
    local identifier = GetIdentifier(src):gsub("^char%d+:", "")

    -- Mise à jour cumulative
    MySQL.update.await('UPDATE paintball_players SET total_time_in_zone = total_time_in_zone + ? WHERE identifier = ?', {
        seconds, identifier
    })
end)


---------------
---Degat
AddEventHandler('gameEventTriggered', function(name, args)
    if name ~= 'CEventNetworkEntityDamage' then return end

    local victimPed = tonumber(args[1])
    local attackerPed = tonumber(args[2])

    if not victimPed or not attackerPed then return end

    local victimId = NetworkGetPlayerIndexFromPed(victimPed)
    local attackerId = NetworkGetPlayerIndexFromPed(attackerPed)

    if not NetworkIsPlayerActive(attackerId) or not NetworkIsPlayerActive(victimId) then return end

    local src = GetPlayerServerId(attackerId)
    local target = GetPlayerServerId(victimId)

    -- Skip si pas dans la zone ou self-hit
    if not zonePlayers[src] or not zonePlayers[target] or src == target then return end

    -- Vérifie si même team
    local srcIdent = GetIdentifier(src)
    local targetIdent = GetIdentifier(target)

    local sameTeam = MySQL.scalar.await([[
        SELECT COUNT(*) FROM paintball_players
        WHERE team_id = (SELECT team_id FROM paintball_players WHERE identifier = ?)
        AND identifier = ?
    ]], { srcIdent, targetIdent })

    if sameTeam and sameTeam > 0 then
        -- Dégâts entre coéquipiers ignorés
        return
    end

    -- ✅ Ajoute les dégâts seulement si pas même team
    damageTracker[src] = (damageTracker[src] or 0) + 25
end)




--Compétence: fast_respawn (réduit le temps de respawn)
lib.callback.register('paintball:getRespawnDelay', function(source)
    local identifier = GetIdentifier(source)
    local teamId = MySQL.scalar.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { identifier })

    if not teamId then return 10 end -- délai par défaut

    local hasFastRespawn = exports['paintball_teams']:hasSkill(teamId, 'fast_respawn')
    return hasFastRespawn and 5 or 10
end)


--Compétence: radar_bonus (affiche un blips au dessus des énnemis pendant 10s tout les 60s)
CreateThread(function()
    while true do
        Wait(60000) -- toutes les 60s

        for id in pairs(zonePlayers) do
            local identifier = GetIdentifier(id)
            local teamId = MySQL.scalar.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { identifier })

            if teamId and exports['paintball_teams']:hasSkill(teamId, 'radar_bonus') then
                -- Obtenir les ennemis (joueurs dans la zone, mais pas dans la même team)
                local enemies = {}

                for otherId in pairs(zonePlayers) do
                    if id ~= otherId then
                        local otherIdentifier = GetIdentifier(otherId)
                        local sameTeam = MySQL.scalar.await([[
                            SELECT COUNT(*) FROM paintball_players
                            WHERE team_id = ? AND identifier = ?
                        ]], { teamId, otherIdentifier })

                        if not sameTeam or sameTeam == 0 then
                            table.insert(enemies, otherId)
                        end
                    end
                end

                if #enemies > 0 then
                    TriggerClientEvent('paintball:radarBlips', id, enemies)
                end
            end
        end
    end
end)



-----------------------
--Compétence: zone_dominance

function CancelDominance(teamId, reason)
    if dominanceTracking[teamId] then
        dominanceTracking[teamId].active = false
        dominanceTracking[teamId].members = {}
        dominanceTracking[teamId].timerThread = nil
        for src in pairs(dominanceTracking[teamId].members) do
            TriggerClientEvent('paintball:dominanceStatus', src, 'cancel')
        end

        print("[ZONE DOMINÉE] Annulée pour teamId " .. teamId .. " - " .. reason)
    end
end

function StartDominanceTimerIfValid(teamId)
    if dominanceTracking[teamId].active then return end

    --Start compétence: zone_dominance
    for src in pairs(dominanceTracking[teamId].members) do
        TriggerClientEvent('paintball:dominanceStatus', src, 'start')
    end


    -- Vérifie présence de 5 ennemis dans la zone
    local enemyCount = 0
    local teamPlayers = {}

    for src in pairs(dominanceTracking[teamId].members) do
        table.insert(teamPlayers, src)
    end

    for src in pairs(zonePlayers) do
        local identifier = GetIdentifier(src):gsub("^char%d+:", "")
        local player = MySQL.query.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { identifier })
        if player[1] and player[1].team_id ~= teamId then
            enemyCount += 1
        end
    end

    if enemyCount < 5 then return end

    dominanceTracking[teamId].active = true
    print("[ZONE DOMINÉE] Début suivi teamId " .. teamId)

    -- Lance le timer
    dominanceTracking[teamId].timerThread = CreateThread(function()
        Wait(180000) -- 3 minutes

        -- Vérifie que tous les membres sont encore là
        local stillValid = true
        for src in pairs(dominanceTracking[teamId].members) do
            if not zonePlayers[src] then
                stillValid = false
                break
            end
        end

        if stillValid then
            print("[ZONE DOMINÉE] Succès teamId " .. teamId)

            for src in pairs(dominanceTracking[teamId].members) do
                local identifier = GetIdentifier(src):gsub("^char%d+:", "")
                MySQL.update.await('UPDATE paintball_players SET score = score + 5 WHERE identifier = ?', { identifier })
                pendingScores[src] = (pendingScores[src] or 0) + 5

                TriggerClientEvent('paintball:dominanceSuccess', src)
            end

            MySQL.update.await('UPDATE paintball_teams SET score = score + 5 WHERE id = ?', { teamId })
        else
            print("[ZONE DOMINÉE] Échec final, un joueur est sorti.")
        end

        CancelDominance(teamId, "Fin de vérification")
    end)
end


------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------

--=============COMMANDE DEBUG TEAM=============--

------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
-- ✅ Commande de création d'équipe de test
--RegisterCommand('createTeamDebug', function(source, args)
--    local name = args[1] or ('EquipeTest_' .. math.random(100, 999))
--    local score = tonumber(args[2]) or math.random(10, 100)
--
--    local identifier = GetPlayerIdentifiers(source)[1]
--    if not identifier then return end
--
--    -- On utilise un identifiant bidon (CFX) pour les tests
--    local fakeId = string.sub(identifier, 9) .. '_test' .. math.random(1000, 9999)
--
--    local teamId = MySQL.insert.await([[
--        INSERT INTO paintball_teams (name, password, public, score, owner_identifier)
--        VALUES (?, '', 1, ?, ?)
--    ]], { name, score, fakeId })
--
--    if teamId then
--        local success = pcall(function()
--            MySQL.insert.await([[
--                INSERT INTO paintball_players (identifier, team_id, score)
--                VALUES (?, ?, ?)
--            ]], { fakeId, teamId, score })
--        end)
--
--        if success then
--            TriggerClientEvent('ox_lib:notify', source, {
--                title = "Team Debug",
--                description = ("%s créée avec %s points."):format(name, score),
--                type = "success"
--            })
--        else
--            TriggerClientEvent('ox_lib:notify', source, {
--                title = "Erreur",
--                description = "Impossible d'ajouter le joueur factice dans la team.",
--                type = "error"
--            })
--        end
--    else
--        TriggerClientEvent('ox_lib:notify', source, {
--            title = "Erreur",
--            description = "Création de l'équipe impossible.",
--            type = "error"
--        })
--    end
--end, false)
--
---- ✅ Supprimer toutes les équipes de test (nom contient EquipeTest_)
--RegisterCommand('clearTestTeams', function(source)
--    local deleted = MySQL.update.await([[DELETE FROM paintball_players WHERE identifier LIKE '%_test%']])
--    local deleted2 = MySQL.update.await([[DELETE FROM paintball_teams WHERE name LIKE 'EquipeTest_%']])
--
--    TriggerClientEvent('ox_lib:notify', source, {
--        title = "Debug Paintball",
--        description = ("%s joueurs test et %s équipes test supprimées."):format(deleted, deleted2),
--        type = "inform"
--    })
--end, false)
--
---- ✅ Liste les équipes test pour vérification
--RegisterCommand('listTestTeams', function(source)
--    local result = MySQL.query.await([[SELECT id, name, score FROM paintball_teams WHERE name LIKE 'EquipeTest_%']])
--    if #result == 0 then
--        TriggerClientEvent('ox_lib:notify', source, {
--            title = "Liste",
--            description = "Aucune équipe de test trouvée.",
--            type = "error"
--        })
--        return
--    end
--
--    local lines = {}
--    for _, t in ipairs(result) do
--        table.insert(lines, ("ID: %s | %s - %s points"):format(t.id, t.name, t.score))
--    end
--
--    TriggerClientEvent('ox_lib:notify', source, {
--        title = "Equipes de Test",
--        description = table.concat(lines, '\n'),
--        type = "inform",
--        duration = 10000
--    })
--end, false)
--

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
