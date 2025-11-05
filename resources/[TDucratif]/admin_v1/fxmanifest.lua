--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'adamant'
game 'gta5'
lua54 'yes'

escrow_ignore {
    'config.lua',
	"lib/RMenu.lua",
	"lib/menu/RageUI.lua",
	"lib/menu/Menu.lua",
	"lib/menu/MenuController.lua",
	"lib/components/*.lua",
	"lib/menu/elements/*.lua",
	"lib/menu/items/*.lua",
	"lib/menu/panels/*.lua",
	"lib/menu/panels/*.lua",
	"lib/menu/windows/*.lua",
	"server/*.lua",
	"client/*.lua"
}

shared_script 'config.lua'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	"server/*.lua",
	"config.lua"
}

client_scripts {
	'@es_extended/locale.lua',
	"lib/RMenu.lua",
	"lib/menu/RageUI.lua",
	"lib/menu/Menu.lua",
	"lib/menu/MenuController.lua",
	"lib/components/*.lua",
	"lib/menu/elements/*.lua",
	"lib/menu/items/*.lua",
	"lib/menu/panels/*.lua",
	"lib/menu/panels/*.lua",
	"lib/menu/windows/*.lua",
	"client/*.lua",
	"config.lua"
}

files {
    'stream/*.ytd'
}

dependencies {'es_extended'}
dependency '/assetpacks'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
