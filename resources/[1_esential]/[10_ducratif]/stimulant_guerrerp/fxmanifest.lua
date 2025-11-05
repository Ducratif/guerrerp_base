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

description 'Stimulants de guerre - GuerreRP'
author 'GuerreRP Dev | Ducratif'
version '1.0.0'

dependency 'ox_inventory'


shared_scripts {
    'config.lua' -- Charger ici, partagé aux deux côtés
}

shared_script '@ox_lib/init.lua'

client_scripts {
    'client.lua',
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
    'config.lua'
}
dependencies {
    'es_extended',  -- Dépendance sur ESX
    'ox_lib',       -- Dépendance sur ox_lib pour certaines fonctionnalités
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
