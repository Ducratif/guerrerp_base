--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}
Config.RenderDistance = 30.0
Config.Target = 'ox_target'

Config.Blip = {
	Text = 'France Chomeur',
	Sprite = 290,
	Size = 0.9,
	Color = 0,
	Display = 4
}

Config.Locations = {
	{
		Ped = `a_f_y_business_01`,
		Coords = vector4(-234.94,-922.24,32.31, 334.81),
	}
}

--Optional fontawesome icons for jobs.
Config.JobIcons = {
	['unemployed'] = 'fa-solid fa-user',
	['taxi'] = 'fa-solid fa-taxi',
	['trucker'] = 'fa-solid fa-truck',
}

Config.Licenses = {
	{
		Item = 'carteidentite',
		Label = 'Carte d\'identité',
		Icon = 'fa-solid fa-id-card',
		LicenseNeeded = false, --['license'/false] verify license ownership through esx_license
		Price = 5000
	},
	{
		Item = 'drive',
		Label = 'Code de la route + Permis de conduire',
		Icon = 'fa-solid fa-car',
		LicenseNeeded = 'drive', --['license'/false] verify license ownership through esx_license
		Price = 25000
	},
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
