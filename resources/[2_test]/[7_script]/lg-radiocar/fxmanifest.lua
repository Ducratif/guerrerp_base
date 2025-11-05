--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'cerulean'
games { 'gta5' }

client_scripts {
    "config.lua",
    "utils/client.lua",
    "client/*.lua",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",

    "config.lua",
    "utils/server.lua",
    "server/*.lua",
}
ui_page "html/index.html"
files {
	"html/*.html",
	"html/scripts/*.js",
	"html/css/*.css",
	"html/css/img/*.png",
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
