--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version "cerulean"
game "gta5"
lua54 "yes"

description "For support or other queries: discord.gg/jgscripts"
version 'v1.6.5'
author "JG Scripts"

dependencies {
  "ducratif_gate",
  "oxmysql",
  "ox_lib",
  "jg-vehiclemileage",
  "/server:7290",
  "/onesync",
}

shared_scripts {
  "@ducratif_gate/contract.lua",
  "@ox_lib/init.lua",
  "config/*.lua", 
  "locales/*.lua",
  "shared/*.lua",
  "framework/main.lua"
}

client_scripts {
  'client/cl-managet.lua',
  "client/utils/nui_shim.lua",
  "framework/**/cl-*.lua",
  "client/cl-*.lua"
}

server_scripts {
  "server/sv-caps.lua",
  'server/sv-nitrac.lua',
  "@oxmysql/lib/MySQL.lua",
  "framework/**/sv-*.lua",
  "server/sv-*.lua"
}

ui_page "web/dist/index.html"

files {
  "web/dist/index.html",
  "web/dist/**/*",
  "logos/*",
  "data/carcols_gen9.meta",
  "data/carmodcols_gen9.meta",
  "audiodirectory/jg_mechanic.awc",
  "data/jg_mechanic_sounds.dat54.rel"
}

data_file "CARCOLS_GEN9_FILE" "data/carcols_gen9.meta"
data_file "CARMODCOLS_GEN9_FILE" "data/carmodcols_gen9.meta"
data_file "AUDIO_WAVEPACK" "audiodirectory"
data_file "AUDIO_SOUNDDATA" "data/jg_mechanic_sounds.dat"

escrow_ignore {
  "config/*.lua",
  "framework/**/*",
  "install/**/*",
  "locales/*.lua",
  "logos/**/*",
  "logos/**/*",
  "client/cl-vehicleprops.lua",
  "client/cl-locations.lua",
  "client/cl-shops-stashes.lua",
  "client/cl-handling.lua",
  "server/sv-usable-items.lua",
  "server/sv-webhooks.lua",
  "server/sv-shops-stashes.lua"
}
dependency '/assetpacks'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
