--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}


Config.Version = "esxnew" -- if using 1.8.5 or lower then "esxold" else if using 1.8.5 or higher then "esxnew"
Config.TargetJoueur = true

Config.Mecano = {
	FactureIcon = "fas fa-hand-paper",
	FactureLabel = "Facture",
}

Config.MecanoStation = {

	MECANO = {

		Blip = {
			Coords  = vector3(-321.22262573242, -137.34016418457, 38.855270385742),
			Sprite  = 446,
			Display = 4,
			Scale   = 0.7,
			Colour  = 47,
            Name    = "~g~Entreprise~s~ | Mecano/Benny's"
		},
    }
}

--Config.Boss = {
	
	--Boss ={
	--	coords = vec3(-351.6831, -130.7745, 39.2105),
	--	groups = 'mechanic',
	--	minZ=32.09,
	--	maxZ=36.09,
	--},
	
--}

Config.Ano = {
	
	Ano ={
		coords = vec3(-351.6831, -130.7745, 39.2105),
		groups = 'mechanic',
		minZ=26.77,
		maxZ=30.77,
	},
}


Config.OfflineChiffon = 10
Config.OfflineKitrepair = 10

Config.billing_title              = "Facture"
Config.input                      = "Entrer une valeur"
Config.billing                    = "Faire une facture"
Config.billing_img                = "fa-solid fa-euro-sign"
Config.Unemployed                 = "Vous n'êtes pas dans une entreprise"

Config.Uniforms = {
	mechanic_wear = {
 		male = {
 			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
 			['torso_1'] = 369,   ['torso_2'] = 8,
 			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 40,
 			['pants_1'] = 8,   ['pants_2'] = 3,
 			['shoes_1'] = 7,   ['shoes_2'] = 9,
			['helmet_1'] = 155,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
        },

 		female = {
 			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
 			['torso_1'] = 27,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 23,   ['pants_2'] = 6,
			['shoes_1'] = 6,   ['shoes_2'] = 0,
 			['helmet_1'] = -1,  ['helmet_2'] = 0,
 			['chain_1'] = 0,    ['chain_2'] = 0,
 			['ears_1'] = -1,     ['ears_2'] = 0	
        }			
    }
}

Config.CarsList2 = {
	mechanic = {
		{ Name = "Depaneuse Poids Lourds",  Hash = "flatbed3", Coords = {x = -358.84, y = -88.54, z = 38.99, h = 157.00}, Plate = "Ls Customs"},
		{ Name = "Depaneuse",  Hash = "flatbed", Coords = {x = -367.61, y = -84.44, z = 38.99, h = 157.00}, Plate = "Ls Customs"},
	},
  }

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
