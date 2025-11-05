--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'cerulean'
game 'gta5'

author 'Ducra'
description 'Paintball Zone Team System with ox_lib'
version '1.0.0'


shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_script {
    --'@ox_lib/init.lua',
    'client.lua',
    'admin/client.lua',
    'admin/ui/*.lua'
}
server_script {
    '@es_extended/imports.lua',
    '@oxmysql/lib/MySQL.lua',
    'server/skills.lua',
    'server/server.lua',
    'admin/server.lua',
    'admin/modules/*.lua'
}

lua54 'yes'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
