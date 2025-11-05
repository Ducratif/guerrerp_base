--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

Config.Zone = {
    center = vector3(1691.2897, 2574.4712, 50.3542),
    radius = 200.0,
    infectionTime = 300, -- secondes
    bossCooldown = 3600, -- 1h 3600
    nombreZombie = 250,
    blip = {
        sprite = 161,
        color = 1,
        label = 'Zone Infectée'
    }
}



Config.Zombies = {
    [1] = { model = 'u_m_y_zombie_01', health = 100, key = 'key_zombie', killsRequired = 10 },
    [2] = { model = 'cs_orleans', health = 200, key = 'key_zombie2', killsRequired = 20 },
    [3] = { model = 's_m_m_movalien_01', health = 300, key = 'key_zombie3', killsRequired = 30 },
    boss = { model = 'a_f_m_fatcult_01', health = 800, key = 'key_zombie_boss', scale = 4.0 },
    animal = { model = 'u_m_y_zombie_01', health = 150 }
}

Config.AntiZombieItem = {
    name = 'anti_zombie',
    duration = 600, -- 10 min
    uses = 5
}

--exports('useAntiZombie', function(data, slot)
--    TriggerEvent('zombie:useAnti', Config.AntiZombieItem.duration, Config.AntiZombieItem.uses)
--end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
