--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'adamant'
game 'gta5'
Author 'dusadev.tebex.io'
version '1.1'

shared_scripts {
    'config.lua',
}

client_scripts {
    'bridge/esx/client.lua',
	'bridge/qb/client.lua',
    'client.lua',
}

server_scripts {
    'bridge/esx/server.lua',
	'bridge/qb/server.lua',
    'server.lua'
}

ui_page "web/index.html"

files {
    "web/index.html",
    "web/assets/**.**",
    "web/main.js",
    "web/vue.min.js",
    "web/jscolor.js",
}

lua54 'yes'

escrow_ignore {
	'bridge/esx/client.lua',
	'bridge/qb/client.lua',
	'bridge/esx/server.lua',
	'bridge/qb/server.lua',
    'config.lua',
    'client.lua',
    'server.lua',
} 
dependency '/assetpacks'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
