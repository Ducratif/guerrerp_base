--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

Config.Locale = 'en' -- "de" or "en"

Config.Blip = true

Config.GiveBlack = false -- Enable BlackMoney? Else the Player becomes Regular Cash

Config.Item1 = 'apple' -- The Item that you Farm
Config.Item2 = 'applejuice' -- The Item that you become when you're Processing

Config.Prop = 'prop_plant_01a' -- The Prop That Spawn on the Farming Place (https://forge.plebmasters.de/objects/)

Config.Animation = 'world_human_gardener_plant' -- The Animation That Plays when you start Farming (https://alexguirre.github.io/animations-list/)

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.Delays = {
	FarmProcessing = 1000 * 7
}

Config.FarmDealerItems = {
	--apfel_verarbeitet = 250
	applejuice = 250
}

Config.LicensePrices = {
	farm_processing = {label = _U('license_farm'), price = 15000}
}

Config.CircleZones = {
	FarmField = {coords = vector3(-563.20, -1423.77, 15.82), name = _U('blip_FarmField'), color = 1, sprite = 514, radius = 10},
	FarmProcessing = {coords = vector3(-245.15, -354.24, 29.99), name = _U('blip_FarmProcessing'), color = 1, sprite = 479},
	FarmDealer = {coords = vector3(763.9321, -3207.8972, 6.0878), name = _U('blip_FarmDealer'), color = 1, sprite = 587},
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
