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

author 'vames™️'
description 'vms_documents'
version '1.0.0'

shared_scripts {
	'config/*.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/*.lua',
}

ui_page 'html/index.html'

files {
	'html/*.*',
}

escrow_ignore {
	'server/*.lua',
	'client/*.lua',
	'config/*.lua',
}
dependency  {
	'ox_lib',
	'/assetpacks'
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
