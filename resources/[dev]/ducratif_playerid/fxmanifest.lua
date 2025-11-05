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

name 'ducratif_playerid'
author 'Ducratif + ChatGPT'
description 'Third-eye player identification with copy/webhook/DB options for ESX Legacy + ox_lib + ox_target'
version '1.0.0'

-- Hard requirements
dependencies {
    'es_extended',
    'ox_lib',
    'ox_target',
    'oxmysql'
}

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
