--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
lua54 'yes'
escrow_ignore {
	'config.lua',
    'client.lua',
	'server.lua'
}

game 'gta5'
version '1.0'
fx_version 'adamant'
description 'discord.gg/rebell-leaks'
author 'Rebell Leaks'

client_scripts {
    'config.lua',
	'client.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

ui_page('html/index.html')

files({
    'html/*.png',
    'html/*.css',
    'html/*.html',
    'html/*.js',
})

dependency '/assetpacks'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
