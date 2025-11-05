--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'cerulean'
lua54 'yes'

game 'gta5'

version '1.3.0'

dependencies {
    'ox_lib',
    'ox_target'
}

client_scripts {
	'config.lua', 
	'@ox_lib/init.lua',
	'client/client.lua'
}

server_scripts {
	'config.lua', 
	'@ox_lib/init.lua',
	'server/server.lua'
}

escrow_ignore {
    'config.lua',
    'client/client.lua',
    'server/server.lua'
}

export 'SendPagerNotification'
dependency '/assetpacks'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
