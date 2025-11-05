--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).
Config.Debug                      = ESX.GetConfig().EnableDebug
Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 700  -- Revive reward, set to 0 if you don't want it enabled
Config.LoadIpl                    = true -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale = GetConvar('esx:locale', 'fr')

Config.DistressBlip = {
	Sprite = 310,
	Color = 48,
	Scale = 2.0
}

Config.zoom = {
	min = 1, 
	max = 6, 
	step = 0.5
}

Config.EarlyRespawnTimer          = 60000 * 1  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 10 -- time til the player bleeds out

Config.EnablePlayerManagement     = true -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = false

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 2000

Config.OxInventory                = ESX.GetConfig().OxInventory
Config.RespawnPoints = {
	{coords = vector3(341.0, -1397.3, 32.5), heading = 48.5}, -- Central Los Santos
	{coords = vector3(1836.03, 3670.99, 34.28), heading = 296.06} -- Sandy Shores
}

Config.PharmacyItems = {
	{
		title = "Medikit",
		item = "medikit"
	},
	{
		title = "Bandage",
		item = "bandage"
	},
}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(319.0928, -622.8666, 29.2934),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		AmbulanceActions = {
			vector3(310.8084, -592.1398, 43.2654)--changer la tenue
		},

		Pharmacies = {
			vector3(230.1, -1366.1, 38.5)--Prendre kit & bandage
		},

		Vehicles = {
			{
				Spawner = vector3(321.4756, -558.6491, 28.7438),
				InsideShop = vector4(320.7987, -540.7326, 28.7438, 198.1067),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(315.9671, -556.5087, 28.7438), heading = 276.2415, radius = 4.0},
					{coords = vector3(316.1163, -553.5218, 28.7438), heading = 269.7619, radius = 4.0},
					{coords = vector3(316.3586, -550.7692, 28.7438), heading = 286.5130, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(337.7348, -586.7706, 74.1645),
				InsideShop = vector4(351.7183, -588.2360, 74.1645, 263.9037),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(350.7523, -588.3165, 74.1645), heading = 249.0704, radius = 10.0},
					--{coords = vector3(299.5, -1453.2, 46.5), heading = 142.7, radius = 10.0}
				}
			}
		},

		FastTravels = {
			{
				From = vector3(294.7, -1448.1, 29.0),
				To = {coords = vector3(272.8, -1358.8, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(275.3, -1361, 23.5),
				To = {coords = vector3(295.8, -1446.5, 28.9), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(247.3, -1371.5, 23.5),
				To = {coords = vector3(333.1, -1434.9, 45.5), heading = 138.6},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = {coords = vector3(249.1, -1369.6, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = {coords = vector3(320.9, -1478.6, 28.8), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = {coords = vector3(238.6, -1368.4, 23.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = TranslateCap('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = TranslateCap('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{model = 'emsnspeedo', price = 100000}--Ambulance exper
		},

		doctor = {
			{model = 'emsnspeedo', price = 75000},--Ambulance exper
			{model = 'dlemsb', price = 200000}--Ranger Moto
		},

		chief_doctor = {
			{model = 'emsnspeedo', price = 25000},--Ambulance exper
			{model = 'dlemsb', price = 150000},--Moto
			{model = 'dlgranger', price = 200000}--Ranger
			
			
		},

		boss = {
			{model = 'emsnspeedo', price = 1},--Ambulance exper
			{model = 'dlemsb', price = 1},--Moto
			{model = 'dlgranger', price = 1},--Ranger
			{model = 'dlissiamb', price = 1}--Buffaluo
			
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{model = 'dlswift', price = 5000000},
		},

		chief_doctor = {
			{model = 'dlswift', price = 3000000},
		},

		boss = {
			{model = 'dlswift', price = 1500000},
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
