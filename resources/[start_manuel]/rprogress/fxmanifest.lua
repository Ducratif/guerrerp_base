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

description 'Radial Progress'

author 'Karl Saunders'

version '0.6.0'

client_scripts {
    'config.lua',
    'utils.lua',
    'client.lua',
    'demo.lua' -- remove if not needed
}

ui_page 'ui/ui.html'

files {
    'ui/ui.html',
    'ui/fonts/ChaletComprimeCologneSixty.ttf',
    'ui/fonts/ChaletLondonNineteenSixty.ttf',
    'ui/css/app.css',
    'ui/js/easings.js',
    'ui/js/class.RadialProgress.js',
    'ui/js/app.js',
}

exports "Start"
exports "Custom"
exports "Stop"
exports "Static"

escrow_ignore {
    "utils.lua",
    "demo.lua",
    "client.lua",
    "condig.lua"
}

dependency '/assetpacks'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
