--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'bodacious'
game 'gta5'
lua54 'yes'

author 'FiveZone'
description 'Vehicle Cleaning Sponge Script'
version '1.0.0'

shared_script '@ox_lib/init.lua'
shared_script '@es_extended/imports.lua'

client_script 'client/client.lua'
server_script 'server/server.lua'

escrow_ignore {
    'client/client.lua',
    'server/server.lua',

  }

dependencies {
    'es_extended',
    'ox_inventory',
    'ox_lib'
}
dependency '/assetpacks'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
