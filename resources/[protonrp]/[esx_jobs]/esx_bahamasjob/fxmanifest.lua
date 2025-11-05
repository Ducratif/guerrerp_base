--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version('bodacious')
game('gta5')

server_scripts {
	'@dwInit/locale/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'server/main.lua'
}

--client_script('@korioz/lib.lua')
client_scripts {
	'@dwInit/locale/locale.lua',
	'@warmenu/warmenu.lua',
	'locales/fr.lua',
	'config.lua',
	'client/main.lua'
}

dependency('es_extended')

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
