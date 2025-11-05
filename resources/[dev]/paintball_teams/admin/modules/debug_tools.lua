--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local IsPlayerAdmin = require 'admin.modules.permission'.IsPlayerAdmin

RegisterNetEvent('paintball_admin:addTeamPointsSelf', function()
    local src = source
    if not IsPlayerAdmin(source) then return nil end


    local identifier = GetIdentifier(src)
    local teamId = MySQL.scalar.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { identifier })
    if not teamId then return end

    MySQL.update.await('UPDATE paintball_teams SET score = score + 10 WHERE id = ?', { teamId })

    TriggerClientEvent('ox_lib:notify', src, {
        title = "✅ Test",
        description = "+10 points ajoutés à ta team.",
        type = "success"
    })
end)

---------------------------------
RegisterNetEvent('paintball_admin:forceZoneDominance', function()
    local src = source
    if not IsPlayerAdmin(source) then return nil end


    local identifier = GetIdentifier(src)
    local teamId = MySQL.scalar.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { identifier })
    if not teamId then return end

    -- Donne +5 à chaque membre de la team présent dans zonePlayers
    for id in pairs(zonePlayers) do
        local ident = GetIdentifier(id)
        local idTeam = MySQL.scalar.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { ident })
        if idTeam == teamId then
            MySQL.update.await('UPDATE paintball_players SET score = score + 5 WHERE identifier = ?', { ident })
            pendingScores[id] = (pendingScores[id] or 0) + 5
            TriggerClientEvent('ox_lib:notify', id, {
                title = "🏁 Test ZD",
                description = "+5 points (zone dominée simulée)",
                type = "inform"
            })
        end
    end

    MySQL.update.await('UPDATE paintball_teams SET score = score + 5 WHERE id = ?', { teamId })
end)
-----------------------------------------
RegisterNetEvent('paintball_admin:forceSkillToSelfTeam', function()
    local src = source
    if not IsPlayerAdmin(source) then return nil end


    local skillId = 1 -- ou random / configurable
    local identifier = GetIdentifier(src)
    local teamId = MySQL.scalar.await('SELECT team_id FROM paintball_players WHERE identifier = ?', { identifier })
    if not teamId then return end

    local already = MySQL.scalar.await('SELECT COUNT(*) FROM paintball_team_skills WHERE team_id = ? AND skill_id = ?', { teamId, skillId })
    if already > 0 then return end

    MySQL.insert.await('INSERT INTO paintball_team_skills (team_id, skill_id) VALUES (?, ?)', { teamId, skillId })

    TriggerClientEvent('ox_lib:notify', src, {
        title = "🧬 Compétence test",
        description = "Une compétence a été ajoutée à ta team.",
        type = "success"
    })
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
