--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'cerulean'
game 'gta5'
version '1.9'
author 'aiakoscodem'

shared_scripts {
	'config/*.lua',
}

client_scripts {
	'client/*.lua',
}
server_scripts {
	-- '@mysql-async/lib/MySQL.lua', --:warning:PLEASE READ:warning:; Uncomment this line if you use 'mysql-async'.:warning:
	'@oxmysql/lib/MySQL.lua', --:warning:PLEASE READ:warning:; Uncomment this line if you use 'oxmysql'.:warning:
	'editable/server_editable.lua',
	'server/server.lua',
	'server/utility.lua',

}

ui_page "html/index.html"
files {
	'html/index.html',
	'html/css/*.css',
	'html/fonts/*.TTF',
	'html/fonts/*.*',
	'html/sound/*.*',
	'html/images/**/*.png',
	'html/images/**/**/*.png',
	'html/js/*.js',
	'html/js/**/*.js',
}

escrow_ignore {
	'editable/*.lua',
	'config/*.lua',
	'server/utility.lua',
	'client/utility.lua'

}

lua54 'yes'

dependency '/assetpacks'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
