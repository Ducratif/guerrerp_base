--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'cerulean'
game 'gta5'

author 'jaksam1074'

version '3.21'

client_scripts {
    'sh_config.lua',
    'shared/shared.lua',
    'locales/*.lua',

    'cl_config.lua',
    'client/actions/*.lua',
    'client/markers/*.lua',
    --'client/functions.lua',
    --'client/events.lua',
    'client/main.lua',
    'client/nui_callbacks.lua'
}

server_scripts {
    'sh_config.lua',
    'shared/shared.lua',
    'locales/*.lua',

    'sv_config.lua',
    'server/functions.lua',
    'server/actions.lua',
    'server/markers/*.lua',
    'server/database.lua',
    'server/esx_callbacks.lua',
    'server/main.lua',
    '@mysql-async/lib/MySQL.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
}
shared_scripts {
'@es_extended/imports.lua'
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
