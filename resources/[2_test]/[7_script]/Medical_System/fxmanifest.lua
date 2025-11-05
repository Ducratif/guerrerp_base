--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
    "@ox_lib/init.lua",
    'config.lua'
}

client_scripts {
    'client/client_checkin.lua',
	'client/client_bed.lua'
}

server_scripts {
    'server/server_checkin.lua',
	'server/server_bed.lua'
}

dependencies {
    'ox_lib',
    'ox_target',
    'es_extended', -- Required if using ESX
    --'qb-core' -- Required if using QBCore
} -- Hash in/out whatever framework you're using

escrow_ignore {
    'config.lua',
    'client/client_checkin.lua',
	'client/client_bed.lua',
    'server/server_checkin.lua',
	'server/server_bed.lua'
}
dependency '/assetpacks'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
