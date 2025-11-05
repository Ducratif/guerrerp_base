--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'cerulean'
game 'gta5'

author 'DucraDev by Ducratif'
description 'Job Transport PL - ESX'
version '1.0.0'

lua54 'yes'

dependency 'ox_lib'

shared_script 'config.lua'

shared_script '@ox_lib/init.lua'


client_scripts {
    'client.lua',
    --'client/npc_spawn.lua',
    'client/npc_interaction.lua',
    'client/npc_delete_vehicle.lua',
    'client/npc_spawn_trailer.lua',
    'client/force_trailer_attach.lua',
    'client/livraison.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
    'server/livraison.lua',
    'server/npc_spawn_trailer.lua'
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
