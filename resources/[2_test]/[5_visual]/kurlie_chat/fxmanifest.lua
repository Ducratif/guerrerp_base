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

ui_page 'html/index.html'

shared_scripts {
	'config.lua',
}

client_scripts {
	'client/*.lua'
}

server_script 'server/*.lua'

files {
  'html/index.html',
  'html/css/style.css',
  'html/js/config.default.js',
  'html/js/App.js',
  'html/js/Message.js',
  'html/js/Suggestions.js',
  'html/vendor/vue.2.3.3.min.js',
  'html/vendor/flexboxgrid.6.3.1.min.css',
  'html/vendor/animate.3.5.2.min.css',
}

escrow_ignore {
  'config.lua',
  'server/*.lua',
	'client/*.lua'
}

shared_script '@es_extended/imports.lua'
-- shared_script '@qb-core/imports.lua' unhash and hash es_extended if using qbcore

dependency '/assetpacks'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
