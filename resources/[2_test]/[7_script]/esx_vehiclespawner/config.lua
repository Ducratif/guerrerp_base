--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.DrawDistance = 20 -- Marker Draw Distance.
Config.MenuMarker = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Enter Location Marker Settings.
Config.DelMarker = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Delete Location Marker Settings.
Config.BlipVehicleSpawner = {Sprite = 479, Color = 2, Display = 2, Scale = 1.0} -- Blip Settings.

Config.UseBlips = false -- true = Use Vehicle Spawner Blips.

Config.Zones = {
	VehicleSpawner1 = { -- commico
		Pos = vector3(449.3120, -956.5135, 20.5085), -- Enter Marker
		Loc = vector3(455.3699, -952.1525, 21.5085), -- Spawn Location
		Del = vector3(446.4903, -951.5221, 20.5085), -- Delete Location
		Heading = 179.3
	},
    delete_fourriere = { -- delete_fourriere
        Pos = vector3(1, 1, 1), -- Enter Marker
		Loc = vector3(1, 1, 1), -- Spawn Location
		Del = vector3(396.0486, -1644.3667, 28.0919), -- Delete Location
		Heading = 326.2000
	}
}

Config.Vehicles = {
	{model = 'police', label = 'Pour les recrues', job = 'police'},
	{model = 'polbmwm7', label = 'Véhicule Rapide', job = 'police'},
    {model = 'ACTRPavant', label = 'Véhicule rapide (break)', job = 'police'},
    {model = 'polbmwm3', label = 'Véhicule sans giro', job = 'police'},
    {model = '22g63', label = 'Déplacement (sans sirene)', job = 'police'},

    {model = 'DL_a45', label = 'A45 BAC', job = 'police'},
    {model = 'DL_rs6', label = 'RS6 BAC', job = 'police'},
    {model = 'DL_RS7', label = 'RS7 BAC (sans girop)', job = 'police'},
    {model = 'dlr34um', label = 'R34 BAC', job = 'police'},
   
    
    {model = 'dlballer7', label = 'Baller7', job = 'police'},
    {model = 'dlballer8', label = 'Baller8', job = 'police'},
    {model = 'dlbuffalo4', label = 'Buffalo', job = 'police'},
    {model = 'dlcade3', label = 'Cade3', job = 'police'},
    {model = 'dlcara', label = 'Cara', job = 'police'},
    {model = 'dlcinq', label = '5TR', job = 'police'},
    {model = 'dlcomet6', label = 'Comet', job = 'police'},
    {model = 'dlcomni', label = 'Comi', job = 'police'},
    {model = 'dlcont', label = '6x6', job = 'police'},
    {model = 'dlgranger2', label = 'Granger', job = 'police'},
    {model = 'dljugular', label = 'Jugular', job = 'police'},
    {model = 'dlkomoda', label = 'Komodo', job = 'police'},
    {model = 'dlpanto', label = 'Panto', job = 'police'},
    {model = 'dlrhine', label = 'Rhine', job = 'police'},
    {model = 'dltenf2', label = 'Tenf2', job = 'police'},
    {model = 'dlturismo3', label = 'Turismo', job = 'police'},
    {model = 'dlvigero2', label = 'Vigero', job = 'police'},
    {model = 'dlvstr', label = 'VSTR', job = 'police'},


    {model = 'dlmanch', label = 'Moto', job = 'police'},
    {model = 'dlshin', label = 'Moto rapide', job = 'police'},
    {model = 'dloutlaw', label = 'Buggy', job = 'police'},



    {model = 'zm_s500', label = 'Véhicule PATRON', job = 'police'},


    -- sw_sprinter -> CAMION SWAT
    
    -- sw_subrb -> FIB braek
}


Config.ListedVehicles = {
	'police',
	'polbmwm7',
    'ACTRPavant',
    'polbmwm3',
    '22g63',
    'zm_s500',
    'DL_a45',
    'DL_rs6',
    'DL_RS7',
    'dlr34um',
    'dlballer7',
    'dlballer8',
    'dlbuffalo4',
    'dlcade3',
    'dlcara',
    'dlcinq',
    'dlcomet6',
    'dlcomni',
    'dlcont',
    'dlgranger2',
    'dljugular',
    'dljugular',
    'dlkomoda',
    'dlpanto',
    'dlrhine',
    'dltenf2',
    'dlturismo3',
    'dlvigero2',
    'dlvstr',
    'dlmanch',
    'dlshin',
    'dloutlaw'
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
