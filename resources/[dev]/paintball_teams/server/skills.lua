--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- 📁 paintball/skills.lua

local ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('paintball:openSkillMenu', function(teamId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    -- Récupération des compétences disponibles
    local skills = MySQL.query.await('SELECT * FROM paintball_skills')
    local acquired = MySQL.query.await('SELECT skill_id FROM paintball_team_skills WHERE team_id = ?', { teamId })

    local ownedSkills = {}
    for _, s in ipairs(acquired) do
        ownedSkills[s.skill_id] = true
    end

    local options = {}
    for _, skill in ipairs(skills) do
        local owned = ownedSkills[skill.id]
        table.insert(options, {
            title = (owned and '✅ ' or '🧠 ') .. skill.name,
            description = skill.description .. (owned and '' or (' - Coût : $' .. skill.cost)),
            disabled = owned, -- désactive l'option si déjà achetée
            args = { skill_id = skill.id, team_id = teamId, cost = skill.cost, owned = owned }
        })
    end


    lib.registerContext({
        id = 'paintball_skills_menu',
        title = 'Gestion des Compétences',
        options = options,
        onSelect = function(data)
            if data.owned then
                lib.notify(src, {
                    title = 'Compétence',
                    description = 'Cette compétence est déjà acquise.',
                    type = 'error'
                })
                return
            end

            local confirm = lib.alertDialog({
                header = 'Confirmer l\'achat',
                content = 'Voulez-vous acheter cette compétence ? Coût : $' .. data.cost,
                centered = true,
                cancel = true
            })

            if confirm == 'confirm' then
                TriggerServerEvent('paintball:buySkill', data.team_id, data.skill_id)
            end
        end
    })

    TriggerClientEvent('ox_lib:openContext', src, { id = 'paintball_skills_menu' })
end)

RegisterNetEvent('paintball:buySkill', function(teamId, skillId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local skill = MySQL.single.await('SELECT * FROM paintball_skills WHERE id = ?', { skillId })
    if not skill then return end

    local existing = MySQL.scalar.await('SELECT COUNT(*) FROM paintball_team_skills WHERE team_id = ? AND skill_id = ?', { teamId, skillId })
    if existing > 0 then
        return TriggerClientEvent('ox_lib:notify', src, {
            title = 'Erreur',
            description = 'Cette compétence est déjà acquise.',
            type = 'error'
        })
    end

    if xPlayer.getAccount('bank').money < skill.cost then
        return TriggerClientEvent('ox_lib:notify', src, {
            title = 'Erreur',
            description = 'Fonds insuffisants.',
            type = 'error'
        })
    end

    xPlayer.removeAccountMoney('bank', skill.cost)
    MySQL.insert.await('INSERT INTO paintball_team_skills (team_id, skill_id) VALUES (?, ?)', {
        teamId, skillId
    })

    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Compétence',
        description = 'Compétence achetée avec succès !',
        type = 'success'
    })
end)


---------------------
-- skills.lua - Gestion des compétences paintball

local skills = {
    {
        name = "Zone Dominée",
        identifier = "zone_dominance",
        description = "Gagnez +5 points si votre équipe ne subit aucune mort pendant 3 minutes",
        type = "bonus",
        cost = 200000,
        effect = json.encode({bonus = 5, duration = 180})
    },
    {
        name = "Tueur en Série",
        identifier = "kill_streak",
        description = "+2 points tous les 3 kills consécutifs",
        type = "passive",
        cost = 300000,
        effect = json.encode({streak = 3, bonus = 2})--A CEHCK SI C'EST GOOD!
    },
    {
        name = "Maître Tireur",
        identifier = "extra_kill_point",
        description = "Chaque kill vaut 3 points au lieu de 2",
        type = "permanent",
        cost = 500000,
        effect = json.encode({killPoint = 3})--A CEHCK SI C'EST GOOD!
    },
    {
        name = "Renforts Instantanés",
        identifier = "fast_respawn",
        description = "Le temps de respawn est réduit de 5 secondes",
        type = "passive",
        cost = 250000,
        effect = json.encode({respawnDelayReduction = 5})--A CEHCK SI C'EST GOOD!
    },
    {
        name = "Vision Tactique",
        identifier = "radar_bonus",
        description = "Affiche temporairement tous les ennemis sur le radar toutes les 60s",
        type = "bonus",
        cost = 350000,
        effect = json.encode({revealCooldown = 60})--A CEHCK SI C'EST GOOD!
    },
    {
        name = "Recrue Brute",
        identifier = "start_boost",
        description = "Démarrez avec 10 points bonus",
        type = "permanent",
        cost = 100000,
        effect = json.encode({startBonus = 10})--A CEHCK SI C'EST GOOD!
    },
    {
        name = "Motivation",
        identifier = "team_kill_bonus",
        description = "Chaque kill de votre équipe ajoute 1 point à tous les membres",
        type = "passive",
        cost = 450000,
        effect = json.encode({teamBonusOnKill = 1})--A CEHCK SI C'EST GOOD!
    }
}

-- Création des compétences dans la base si inexistantes
CreateThread(function()
    for _, skill in ipairs(skills) do
        local exists = MySQL.scalar.await('SELECT 1 FROM paintball_skills WHERE identifier = ?', {skill.identifier})
        if not exists then
            MySQL.insert.await([[INSERT INTO paintball_skills (name, description, identifier, type, effect, cost)
                VALUES (?, ?, ?, ?, ?, ?)]], {
                skill.name, skill.description, skill.identifier, skill.type, skill.effect, skill.cost
            })
            print("[PAINTBALL SKILLS] Compétence ajoutée automatiquement:", skill.identifier)
        end
    end
end)

-- Récupérer les compétences d'une team
lib.callback.register('paintball:getAvailableSkills', function(source, teamId)
    local owned = MySQL.query.await('SELECT skill_id FROM paintball_team_skills WHERE team_id = ?', { teamId })
    local ownedSet = {}
    for _, row in ipairs(owned) do
        ownedSet[row.skill_id] = true
    end

    local rows = MySQL.query.await('SELECT * FROM paintball_skills')
    for _, skill in ipairs(rows) do
        skill.owned = ownedSet[skill.id] or false
    end
    return rows
end)



--checker les compétences
function HasTeamSkill(teamId, identifier)
    local result = MySQL.scalar.await([[
        SELECT COUNT(*) FROM paintball_team_skills pts
        JOIN paintball_skills ps ON ps.id = pts.skill_id
        WHERE pts.team_id = ? AND ps.identifier = ?
    ]], {teamId, identifier})

    return result and result > 0
end

exports('hasSkill', HasTeamSkill)
exports('getSkillList', function() return skills end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
