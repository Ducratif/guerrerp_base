--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version "cerulean"

description "A boombox script that play yt music by gachaa"
author "gachaa"

lua54 'yes'

games {
  "gta5"
}

ui_page 'web/build/index.html'

-- shared_script '@es_extended/imports.lua' --Import this if you are using es_extended

client_scripts {
  'Config.lua',
  "client/**/*"
}
server_script {
  "@oxmysql/lib/MySQL.lua",
  'Config.lua',
  "server/**/*"
}

files {
	'web/build/index.html',
	'web/build/**/*',
}

dependencies {
  'oxmysql'
}

escrow_ignore {
  'Config.lua',
  'server/server_edit.lua',
  'client/client_edit.lua'
}
dependency '/assetpacks'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
