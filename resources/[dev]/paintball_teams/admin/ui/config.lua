--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterNetEvent('paintball_admin:configMenu', function()
    lib.callback('paintball_admin:getAllSkillsRaw', false, function(skills)
        if not skills then
            return lib.notify({ title = "Erreur", description = "Chargement échoué", type = "error" })
        end

        local options = {}

        for _, skill in ipairs(skills) do
            table.insert(options, {
                title = skill.name,
                description = "Modifier cette compétence",
                icon = 'settings',
                onSelect = function()
                    TriggerEvent('paintball_admin:editSkillConfig', skill)
                end
            })
        end

        lib.registerContext({
            id = 'paintball_admin_config_skills',
            title = '⚙️ Modifier les compétences',
            options = options
        })

        lib.showContext('paintball_admin_config_skills')
    end)
end)

RegisterNetEvent('paintball_admin:editSkillConfig', function(skill)
    local input = lib.inputDialog('🛠️ Modifier : ' .. skill.name, {
        { type = 'input', label = 'Description', default = skill.description },
        { type = 'input', label = 'Effet JSON', default = skill.effect },
        { type = 'number', label = 'Coût', default = skill.cost }
    })

    if not input then return end

    TriggerServerEvent('paintball_admin:updateSkillConfig', skill.id, input[1], input[2], input[3])
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
