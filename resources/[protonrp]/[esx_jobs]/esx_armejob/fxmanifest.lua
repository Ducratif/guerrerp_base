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
	'@mysql-async/lib/MySQL.lua',
	'@dwInit/locale/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@dwInit/locale/locale.lua',
	'@warmenu/warmenu.lua',
	'locales/fr.lua',
	'config.lua',
	'client/main.lua',
	'client/menu.lua'
}

dependencies({
	'es_extended',
	'esx_billing'
})

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
