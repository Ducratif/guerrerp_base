--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

-- Liste des stimulants
Config.Stimulants = {
    ["stimulant_combat"] = {
        label = "Stimulant de combat",
        effect = { speed = 1000000, godmode = true },
        duration = 15,
        cooldown = 180,--180
        restricted = true
    },
    ["stimulant_vitesse"] = {
        label = "Stimulant de vitesse",
        effect = { speed = 1000000 },
        duration = 10,
        cooldown = 120,--120
        restricted = true
    },
    ["stimulant_vie"] = {
        label = "Stimulant de vie",
        effect = { godmode = true },
        duration = 5,
        cooldown = 180,--180
        restricted = true
    },
    --["stimulant_debug"] = {
    --label = "Debug",
    --effect = { speed = 1.0 },
    --duration = 5,
    --cooldown = 10,
    --restricted = true
    --}

}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
