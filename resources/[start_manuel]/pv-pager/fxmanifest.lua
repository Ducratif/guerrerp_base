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

name 'PV Pager'
version '1.0.0'
description 'Project Vinewood Pager allows to send messages to certain jobs based on permissions'
author 'tugamars'

shared_script "config.lua"

server_scripts {
    "server.lua",
}

client_script "client.lua"

ui_page 'nui/index.html'

files({
    'nui/*'
})

exports {
    'SendPagerNotification'
}

escrow_ignore {
    "nui/*.lua",
    "server.lua",
    "client.lua",
    "condig.lua"
}

shared_script '@es_extended/imports.lua'
dependency '/assetpacks'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
