--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local insideZone = false
local isInTeam = false
local hasSeenHelp = false
local hasSeenTeamHelp = false


local entryTime = 0

RegisterNetEvent('paintball:client:enteredZone', function()
    entryTime = GetGameTimer()
end)

RegisterNetEvent('paintball:client:leftZone', function()
    local timeSpent = math.floor((GetGameTimer() - entryTime) / 1000)
    TriggerServerEvent('paintball:logTimeInZone', timeSpent)
end)


CreateThread(function()
    while true do
        Wait(500)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local dist = #(coords - Config.ZoneCenter)

        if dist <= Config.ZoneRadius then
            if not insideZone then
                insideZone = true
                print("→ Entrée zone")
                TriggerServerEvent('paintball:enteredZone')
            
                if not hasSeenTeamHelp then
                    hasSeenTeamHelp = true
                
                    -- On vérifie si le joueur est dans une team
                    TriggerServerEvent('paintball:checkTeamStatusForHelp')
                end
            end


        else
            if insideZone then
                insideZone = false
                --print("→ Sortie zone")
                TriggerServerEvent('paintball:onLeaveZone')
            end
        end
    end
end)

RegisterCommand('paintball_menu', function()
    if insideZone then
        TriggerServerEvent('paintball:requestMenuData')
    else
        lib.notify({
            title = "Zone Paintball",
            description = "Tu dois être dans la zone pour ouvrir le menu.",
            type = "error"})
    end
end, false)

RegisterKeyMapping('paintball_menu', 'Menu Paintball', 'keyboard', Config.OpenMenuKey)

RegisterNetEvent('paintball:client:openTeamMenu', function(teams)
    local options = {}

    for _, team in ipairs(teams) do
        local teamType = (team.public == 1 or team.public == true) and "🌍 Publique" or "🔐 Privée"
        local label = ('[%s] | %s - 🧍 %s | 🏆 %s'):format(team.name, teamType, team.members, team.score)

        table.insert(options, {
            label = label,
            value = 'join_' .. team.id
        })
    end


    table.insert(options, {
        label = '➕ Créer une équipe (1M $)',
        value = 'create'
    })

    table.insert(options, {
        label = '📊 Voir le classement',
        value = 'scoreboard'
    })

    local choice = lib.inputDialog('Paintball - Menu Équipe', {
        { type = 'select', label = 'Choisis une action', options = options, required = true }
    })

    if not choice then return end
    local selected = choice[1]

    if selected == 'create' then
        TriggerEvent('paintball:teamCreateForm')
        elseif selected == 'scoreboard' then
        lib.callback('paintball:getScoreboard', false, function(scoreboard)
                if not scoreboard then
                    lib.notify({title = 'Scoreboard', description = 'Aucune donnée disponible', type = 'error'})
                    return
                end
            
                local lines = {}
                table.insert(lines, '🏁 Classement des Équipes\n' .. ('-'):rep(32))
            
                for i, team in ipairs(scoreboard) do
                    local rankColor = '⬜'
                    if i == 1 then rankColor = '🥇'
                    elseif i == 2 then rankColor = '🥈'
                    elseif i == 3 then rankColor = '🥉' end
                
                    table.insert(lines, ('%s #%d %s | 🏆 %s points\n\n────────────'):format(rankColor, i, team.name, team.score))
                end
            
                lib.alertDialog({
                    header = '📊 Scoreboard Général',
                    content = table.concat(lines, '\n\n'),
                    centered = true
                })
            end)
    elseif selected:sub(1, 5) == 'join_' then
        local teamId = tonumber(selected:sub(6))
        for _, t in ipairs(teams) do
            if t.id == teamId then
                local isPublic = (t.public == true or t.public == 1)
                if isPublic then
                    TriggerServerEvent('paintball:verifyPassword', teamId, '')
                else
                    TriggerEvent('paintball:teamPasswordPrompt', teamId)
                end

                break
            end
        end
    end
end)




RegisterNetEvent('paintball:teamCreateForm', function()
    local input = lib.inputDialog('Créer une Équipe', {
        {type = 'input', label = 'Nom de l\'équipe', required = true},
        {type = 'input', label = 'Mot de passe', password = true}
    })

    if input then
        TriggerServerEvent('paintball:createTeam', input[1], input[2] or '')
    end
end)




RegisterNetEvent('paintball:teamPasswordPrompt', function(teamId)
    local input = lib.inputDialog('Mot de passe requis', {
        {type = 'input', label = 'Mot de passe', password = true, required = true}
    })

    if input then
        TriggerServerEvent('paintball:verifyPassword', teamId, input[1])
    end
end)


RegisterNetEvent('paintball:client:openTeamManagementMenu', function(data)
    local options = {}

    if data.isOwner then
        table.insert(options, {label = '👥 Voir les membres', value = 'members'})
        table.insert(options, {label = '🗝️ Modifier le mot de passe', value = 'change_password'})
        table.insert(options, {label = '📊 Voir le Scoreboard', value = 'scoreboard'})
        
        local public = (data.public == true or data.public == 1)
        table.insert(options, {
            label = public and '🔐 Rendre l\'équipe privée' or '🌍 Rendre l\'équipe publique',
            value = 'toggle_public'
        })

        table.insert(options, {label = '🧠 Gérer les compétences', value = 'skills'})
        table.insert(options, {label = '🔁 Transférer la team', value = 'transfer'})
        --table.insert(options, {label = '🗑️ Supprimer l\'équipe', value = 'delete'})
    end

    table.insert(options, {label = '📊 Classement des équipes', value = 'leaderboard'})
    table.insert(options, {label = '🚪 Quitter l\'équipe', value = 'leave'})

    local choice = lib.inputDialog("Gestion de l'équipe : " .. data.teamName, {
        {type = 'select', label = 'Actions disponibles', options = options, required = true}
    })

    if not choice then return end

    local action = choice[1]

    if action == 'members' then
        local membersList = {}
        for _, member in ipairs(data.members) do
            table.insert(membersList, {
                label = ('%s | 🏆 Score : %s'):format(member.firstname or member.identifier, member.score),
                value = member.identifier
            })
        end

        local selected = lib.inputDialog("Membres de l'équipe", {
            {type = 'select', label = 'Choisir un joueur à expulser', options = membersList}
        })

        if selected then
            TriggerServerEvent('paintball:kickMember', data.teamId, selected[1])
        end
        elseif action == 'scoreboard' then
            lib.callback('paintball:getScoreboard', false, function(scoreboard)
                if not scoreboard then
                    lib.notify({title = 'Scoreboard', description = 'Aucune donnée disponible', type = 'error'})
                    return
                end
            
                local lines = {}
                table.insert(lines, '🏁 Classement des Équipes\n' .. ('-'):rep(32))
            
                for i, team in ipairs(scoreboard) do
                    local rankColor = '⬜'
                    if i == 1 then rankColor = '🥇'
                    elseif i == 2 then rankColor = '🥈'
                    elseif i == 3 then rankColor = '🥉' end
                
                    table.insert(lines, ('%s #%d %s | 🏆 %s points\n\n────────────'):format(rankColor, i, team.name, team.score))
                end
            
                lib.alertDialog({
                    header = '📊 Scoreboard Général',
                    content = table.concat(lines, '\n\n'),
                    centered = true
                })
            end)

        
    elseif action == 'skills' then
        lib.callback('paintball:getAvailableSkills', false, function(skills)
            local skillOptions = {}
            for _, skill in ipairs(skills) do
                local label = ('%s - 💰 %s$'):format(skill.name, skill.cost)
                if skill.owned then label = '✅ ' .. label end
                table.insert(skillOptions, {
                    label = label,
                    description = skill.description,
                    value = skill.id,
                    disabled = skill.owned
                })
            end
        
            local choice = lib.inputDialog('Compétences disponibles', {
                {type = 'select', label = 'Acheter une compétence', options = skillOptions}
            })
        
            if choice then
                TriggerServerEvent('paintball:buySkill', data.teamId, choice[1])
            end
        end)

        
    elseif action == 'change_password' then
        local input = lib.inputDialog("Changer le mot de passe", {
            {type = 'input', label = 'Nouveau mot de passe', password = true, required = true}
        })
        if input then
            TriggerServerEvent('paintball:changePassword', data.teamId, input[1])
        end
        

    elseif action == 'toggle_public' then
        TriggerServerEvent('paintball:togglePublicStatus', data.teamId)

    elseif action == 'transfer' then
        local transferList = {}
        for _, member in ipairs(data.members) do
            --if member.identifier ~= ESX.GetPlayerData().identifier then
            if member.identifier ~= data.selfIdentifier then
                table.insert(transferList, {
                    --label = member.identifier,
                    label = ('%s'):format(member.firstname or 'Inconnu', member.identifier),
                    value = member.identifier
                })
            end
        end

        local selected = lib.inputDialog("Transférer la team", {
            {type = 'select', label = 'Sélectionner le nouveau propriétaire', options = transferList}
        })

        if selected then
            TriggerServerEvent('paintball:transferTeam', data.teamId, selected[1])
        end

    elseif action == 'delete' then
        local confirm = lib.inputDialog("CONFIRMATION", {
            {type = 'input', label = 'Tapez SUPPRIMER pour confirmer', required = true}
        })

        if confirm and confirm[1] == "SUPPRIMER" then
            TriggerServerEvent('paintball:deleteTeam', data.teamId)
        end

    elseif action == 'leave' then
        TriggerServerEvent('paintball:leaveTeam')
    elseif action == 'leaderboard' then
       lib.callback('paintball:getScoreboard', false, function(scoreboard)
                if not scoreboard then
                    lib.notify({title = 'Scoreboard', description = 'Aucune donnée disponible', type = 'error'})
                    return
                end
            
                local lines = {}
                table.insert(lines, '🏁 Classement des Équipes\n' .. ('-'):rep(32))
            
                for i, team in ipairs(scoreboard) do
                    local rankColor = '⬜'
                    if i == 1 then rankColor = '🥇'
                    elseif i == 2 then rankColor = '🥈'
                    elseif i == 3 then rankColor = '🥉' end
                
                    table.insert(lines, ('%s #%d %s | 🏆 %s points\n\n────────────'):format(rankColor, i, team.name, team.score))
                end
            
                lib.alertDialog({
                    header = '📊 Scoreboard Général',
                    content = table.concat(lines, '\n\n'),
                    centered = true
                })
            end)----->
    end
end)


----------------------------------
local displayHud = false
local wasDisplaying = false -- <== Ajouté ici
local hudData = {
    teamScore = 0,
    playerScore = 0,
    teamCount = 0,
    totalCount = 0
}

RegisterNetEvent('paintball:showHud', function(teamScore, playerScore, teamCount, totalCount)
    if teamScore == 0 and playerScore == 0 and teamCount == 0 and totalCount == 0 then
        displayHud = false
        return
    end

    hudData.teamScore = teamScore
    hudData.playerScore = playerScore
    hudData.teamCount = teamCount
    hudData.totalCount = totalCount
    displayHud = true
end)

RegisterNetEvent('paintball:leftZone', function()
    --print("[CLIENT] Event reçu : paintball:leftZone → HUD désactivé")
    displayHud = false

end)

CreateThread(function()
    while true do
        Wait(0)
        if displayHud then
            wasDisplaying = true -- <== On note qu'on affiche
            local lines = {
                "🎯 Paintball — Statistiques en temps réel",
                ("🏆 Score de l'équipe : %s    👤 Ton score : %s"):format(hudData.teamScore, hudData.playerScore),
                ("👥 Joueurs dans la zone : %s    👪 Membres de ta team : %s"):format(hudData.totalCount, hudData.teamCount)
            }


            for i, text in ipairs(lines) do
                drawTextTopCenter(text, 0.015 + (i - 1) * 0.035)
            end
        elseif wasDisplaying then
            -- ✅ On ne le fait qu'une fois au moment où on arrête d'afficher
            wasDisplaying = false
            --print("✅ HUD masqué après sortie de zone")
        end
    end
end)






function drawTextTopCenter(text, y)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.45, 0.45)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()
    SetTextCentre(true)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.5, y)
end


------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------

--=============SYSTEM DE KILL/DEGAT=============--

------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------

CreateThread(function()
    while true do
        Wait(500)

        local ped = PlayerPedId()

        if insideZone and not isInTeam then
            -- 🔫 Bloque armes et tirs
            DisablePlayerFiring(ped, true)
            DisableControlAction(0, 24, true) -- LMB
            DisableControlAction(0, 25, true) -- RMB
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 45, true) -- Reload
            DisableControlAction(0, 44, true) -- Q

            -- 🚗 Invincibilité véhicule
            local veh = GetVehiclePedIsIn(ped, false)
            if veh ~= 0 then
                SetEntityInvincible(veh, true)
                SetEntityProofs(veh, true, true, true, true, true, true, true, true)
            end
        elseif not insideZone then
            -- 🔄 On remet le véhicule normal si on sort
            local veh = GetVehiclePedIsIn(ped, false)
            if veh ~= 0 then
                SetEntityInvincible(veh, false)
                SetEntityProofs(veh, false, false, false, false, false, false, false, false)
            end
        end
    end
end)


RegisterNetEvent('paintball:respawnCountdown', function()
    local countdown = lib.callback.await('paintball:getRespawnDelay', false)
    local ped = PlayerPedId()

    -- Affichage du décompte
    CreateThread(function()
        while countdown > 0 do
            Wait(1000)
            countdown -= 1
        end
    end)

    -- Affichage du texte
    CreateThread(function()
        while countdown > 0 do
            Wait(0)
            drawTextTopCenter(("💀 Tu es K.O. - Réapparition dans %ss"):format(countdown), 0.3)
        end
    end)

    -- Après 10 sec : respawn 5m à côté de la zone
    Wait(10000)
    local offset = vec3(math.random(-5, 5), math.random(-5, 5), 0)
    local coords = Config.ZoneCenter + offset

    DoScreenFadeOut(500)
    Wait(800)

    -- ✅ Respawn propre
    TriggerEvent('esx_ambulancejob:revive')
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, 0.0, true, true)
    ClearPedTasksImmediately(ped)
    ClearPedBloodDamage(ped)
    SetEntityHealth(ped, 200)

    Wait(500)
    DoScreenFadeIn(500)

    -- ✅ Notification visible 8 secondes
    lib.notify({
        title = "Paintball",
        description = "Tu es de retour en jeu !",
        type = "success",
        duration = 8000
    })
end)




local lastHealth = nil
CreateThread(function()
    while true do
        Wait(500)

        local ped = PlayerPedId()

        if insideZone and IsEntityDead(ped) then
            local killer = GetPedKiller(ped)
            local killerId = NetworkGetPlayerIndexFromPed(killer)
            local serverKillerId = GetPlayerServerId(killerId)

            --print("[CLIENT] Mort détectée ! Killer ID:", serverKillerId)
            TriggerServerEvent('paintball:playerKilled', serverKillerId)

            while IsEntityDead(ped) do Wait(1000) end
        end

    end
end)




--Scorboard
RegisterCommand('scoreboard', function()
    TriggerServerEvent('paintball:getScoreboard')
end, false)

RegisterNetEvent('paintball:client:showScoreboard', function(results)
    local rows = {}

    for index, row in ipairs(results) do
        local medal = ""
        if index == 1 then
            medal = "🥇 "
        elseif index == 2 then
            medal = "🥈 "
        elseif index == 3 then
            medal = "🥉 "
        end

        table.insert(rows, {
            title = ('%s#%s - %s (%s pts)'):format(medal, index, row.team_name, row.total_score),
            icon = 'trophy'
        })
    end

    lib.registerContext({
        id = 'paintball_scoreboard',
        title = '🏆 Classement des Équipes',
        options = rows
    })

    lib.showContext('paintball_scoreboard')
end)


-------------------------------
--Compétence radar_bonus
RegisterNetEvent('paintball:radarBlips', function(enemyList)
    for _, id in ipairs(enemyList) do
        local ped = GetPlayerPed(GetPlayerFromServerId(id))
        if DoesEntityExist(ped) then
            local blip = AddBlipForEntity(ped)
            SetBlipSprite(blip, 1)
            SetBlipScale(blip, 0.75)
            SetBlipColour(blip, 1)
            SetBlipCategory(blip, 7)
            SetBlipAsShortRange(blip, false)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Ennemi détecté")
            EndTextCommandSetBlipName(blip)

            -- Supprime le blip après 10 secondes
            CreateThread(function()
                Wait(10000)
                RemoveBlip(blip)
            end)
        end
    end
end)

-------------------------------
--Compétence: zone_dominance
RegisterNetEvent('paintball:dominanceStatus', function(state)
    if state == 'start' then
        lib.notify({
            title = "🛡️ Zone Dominée",
            description = "Votre équipe tente de dominer la zone pendant 3 minutes. Restez en vie !",
            type = "inform",
            duration = 8000
        })
    elseif state == 'cancel' then
        lib.notify({
            title = "❌ Zone Dominée",
            description = "Votre équipe a perdu l’objectif. Un membre est mort ou a quitté la zone.",
            type = "error",
            duration = 8000
        })
    end
end)

RegisterNetEvent('paintball:dominanceSuccess', function()
    lib.notify({
        title = "🏆 Zone Dominée",
        description = "Votre équipe a tenu la zone sans perte. +5 points !",
        type = "success",
        duration = 10000
    })
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
