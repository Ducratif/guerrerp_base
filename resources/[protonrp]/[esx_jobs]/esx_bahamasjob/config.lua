--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}
Config.DrawDistance = 25.0

Config.EnablePlayerManagement = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement = true
Config.EnableHelicopters = false
Config.EnableMoneyWash = true
Config.MaxInService = -1
Config.Locale = 'fr'

Config.MissCraft = 10

Config.AuthorizedVehicles = {
    { name = 'Stretch', label = 'Limousine' },
    { name = 'Faggio3', label = 'Van Bahama' },
    { name = 'Trophytruck', label = 'Trophytruck' },
}

Config.Blips = {
    Blip = {
      Pos = { x = -1365.17, y = -623.52, z = 30.33 },
      Sprite = 674,
      Display = 4,
      Scale = 0.8,
      Colour = 182
    }
}

Config.Zones = {
    Cloakrooms = {
        Pos = { x = -1367.66, y = -613.63, z = 30.32 },
        Size = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 182, g = 4, b = 254 },
        Type = 20
    },
    Vaults = {
        Pos = { x = -1392.95, y = -612.59, z = 30.32 },
        Size = { x = 1.3, y = 1.3, z = 1.0 },
        Color = { r = 182, g = 4, b = 254 },
        Type = 20
    },
    Fridge = {
        Pos = { x = -1365.68, y = -616.78, z = 30.32 },
        Size = { x = 1.6, y = 1.6, z = 1.0 },
        Color = {  r = 182, g = 4, b = 254  },
        Type = 20
    },
    Vehicles = {
        Pos = { x = -1392.02, y = -638.43, z = 28.7 },
        SpawnPoint = { x = -1401.96, y = -640.51, z = 28.49 },
        Size = { x = 1.8, y = 1.8, z = 1.0 },
        Color = { r = 255, g = 255, b = 0 },
        Type = 23,
        Heading = 124.52
    },
    VehicleDeleters = {
        Pos = { x = -1391.26, y = -633.87, z = 28.69 },
        Size = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type = 1
    },
    BossActions = {
        Pos = { x = -1365.17, y = -623.52, z = 30.33 },
        Size = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 182, g = 4, b = 254 },
        Type = 20
    },
    Ice = {
        Pos = { x = -1388.67, y = -612.76, z = 30.32 },
        Size = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 255, g = 255, b = 255 },
        Type = 20,
        Items = {
            { name = 'ice', label = _U('ice'), price = 1 },
            { name = 'menthe', label = _U('menthe'), price = 1 },
            { name = 'jager', label = _U('jager'), price = 1 },
            { name = 'rhum', label = _U('rhum'), price = 1 },
            { name = 'whisky', label = _U('whisky'), price = 1 },
            { name = 'tequila', label = _U('tequila'), price = 1 },
            { name = 'martini', label = _U('martini'), price = 1 },
            { name = 'jusfruit', label = _U('jusfruit'), price = 1 },
            { name = 'limonade', label = _U('limonade'), price = 1 }
        }
    }
}

Config.TeleportZones = {
    EnterBuilding = {
        Pos = { x = -1396.77, y = -610.75, z = 30.32 },
        Size = { x = 1.2, y = 1.2, z = 0.1 },
        Color = { r = 250, g = 38, b = 0 }, 
        Marker = 21,
        Hint = _U('e_to_enter_1'),
        Teleport = { x = -1387.36, y = -608.0, z = 30.32 }
    },
    ExitBuilding = {
        Pos = { x = -1387.36, y = -608.0, z = 30.32 },
        Size = { x = 1.2, y = 1.2, z = 0.1 },
        Color = { r = 250, g = 38, b = 0 },
        Marker = 21,
        Hint = _U('e_to_exit_1'),
        Teleport = { x = -1396.77, y = -610.75, z = 30.32 }
    }
}

Config.Uniforms = {
    barman_outfit = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 40,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 40,
            ['pants_1'] = 28,   ['pants_2'] = 2,
            ['shoes_1'] = 38,   ['shoes_2'] = 4,
            ['chain_1'] = 118,  ['chain_2'] = 0
        },
        female = {
            ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
            ['torso_1'] = 8,    ['torso_2'] = 2,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 5,
            ['pants_1'] = 44,   ['pants_2'] = 4,
            ['shoes_1'] = 0,    ['shoes_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 2
        }
    },
    dancer_outfit_1 = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 15,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 40,
            ['pants_1'] = 61,   ['pants_2'] = 9,
            ['shoes_1'] = 16,   ['shoes_2'] = 9,
            ['chain_1'] = 118,  ['chain_2'] = 0
        },
        female = {
            ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
            ['torso_1'] = 22,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 4,
            ['pants_1'] = 22,   ['pants_2'] = 0,
            ['shoes_1'] = 18,   ['shoes_2'] = 0,
            ['chain_1'] = 61,   ['chain_2'] = 1
        }
    },
    dancer_outfit_2 = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 62,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 14,
            ['pants_1'] = 4,    ['pants_2'] = 0,
            ['shoes_1'] = 34,   ['shoes_2'] = 0,
            ['chain_1'] = 118,  ['chain_2'] = 0
        },
        female = {
            ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
            ['torso_1'] = 22,   ['torso_2'] = 2,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 4,
            ['pants_1'] = 20,   ['pants_2'] = 2,
            ['shoes_1'] = 18,   ['shoes_2'] = 2,
            ['chain_1'] = 0,    ['chain_2'] = 0
        }
    },
    dancer_outfit_3 = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 15,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 15,
            ['pants_1'] = 4,    ['pants_2'] = 0,
            ['shoes_1'] = 34,   ['shoes_2'] = 0,
            ['chain_1'] = 118,  ['chain_2'] = 0
        },
        female = {
            ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
            ['torso_1'] = 22,   ['torso_2'] = 1,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 15,
            ['pants_1'] = 19,   ['pants_2'] = 1,
            ['shoes_1'] = 19,   ['shoes_2'] = 3,
            ['chain_1'] = 0,    ['chain_2'] = 0
        }
    },
    dancer_outfit_4 = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 15,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 15,
            ['pants_1'] = 61,   ['pants_2'] = 5,
            ['shoes_1'] = 34,   ['shoes_2'] = 0,
            ['chain_1'] = 118,  ['chain_2'] = 0
        },
        female = {
            ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
            ['torso_1'] = 82,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 15,
            ['pants_1'] = 63,   ['pants_2'] = 11,
            ['shoes_1'] = 41,   ['shoes_2'] = 11,
            ['chain_1'] = 0,    ['chain_2'] = 0
        }
    },
    dancer_outfit_5 = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 15,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 15,
            ['pants_1'] = 21,   ['pants_2'] = 0,
            ['shoes_1'] = 34,   ['shoes_2'] = 0,
            ['chain_1'] = 118,  ['chain_2'] = 0
        },
        female = {
            ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
            ['torso_1'] = 15,   ['torso_2'] = 5,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 15,
            ['pants_1'] = 63,   ['pants_2'] = 2,
            ['shoes_1'] = 41,   ['shoes_2'] = 2,
            ['chain_1'] = 0,    ['chain_2'] = 0
        }
    },
    dancer_outfit_6 = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 15,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 15,
            ['pants_1'] = 81,   ['pants_2'] = 0,
            ['shoes_1'] = 34,   ['shoes_2'] = 0,
            ['chain_1'] = 118,  ['chain_2'] = 0
        },
        female = {
            ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
            ['torso_1'] = 18,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 15,
            ['pants_1'] = 63,   ['pants_2'] = 10,
            ['shoes_1'] = 41,   ['shoes_2'] = 10,
            ['chain_1'] = 0,    ['chain_2'] = 0
        }
    },
    dancer_outfit_7 = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 15,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 40,
            ['pants_1'] = 61,   ['pants_2'] = 9,
            ['shoes_1'] = 16,   ['shoes_2'] = 9,
            ['chain_1'] = 118,  ['chain_2'] = 0
        },
        female = {
            ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
            ['torso_1'] = 111,  ['torso_2'] = 6,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 15,
            ['pants_1'] = 63,   ['pants_2'] = 6,
            ['shoes_1'] = 41,   ['shoes_2'] = 6,
            ['chain_1'] = 0,    ['chain_2'] = 0
        }
    }
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
