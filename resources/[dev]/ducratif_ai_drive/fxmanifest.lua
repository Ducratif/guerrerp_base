--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'cerulean'
game 'gta5'

name 'ducratif_ai_drive'
author 'Ducratif x ChatGPT'
description 'Conduite autonome IA pour ESX Legacy + ox_*'
version '1.0.0'

lua54 'yes'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/styles.css',
    'html/app.js',
    'html/crash.css',
    'html/crash.js',
    'html/assets/*.png',
    'html/assets/*.svg'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

dependencies {
    'es_extended',
    'ox_lib',
    'ox_target',
    'ox_inventory'
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
