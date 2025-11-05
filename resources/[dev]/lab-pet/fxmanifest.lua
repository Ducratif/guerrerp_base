--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'cerulean'

version '1.0.0'
description 'Script animal FiveM'
author 'Ducratif'

game 'gta5'


dependency 'ox_inventory'

client_scripts {
    'client/functions.lua',
}

server_scripts {
	'sql.lua',
	'server/main.lua',
}

shared_scripts {
	'locales.lua',
	'config.lua',
}


ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/*.ttf',
    'nui/*.png',
    'nui/*.jpg',
    'nui/*.css',
	'stream/*.ytd',
    'nui/*.js',
    'nui/*.mp3',
    'nui/img/*.png',
    'nui/img/*.jpg',
    'nui/sounds/*.ogg',
    'nui/sounds/*.mp3',
}

lua54 'yes'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
