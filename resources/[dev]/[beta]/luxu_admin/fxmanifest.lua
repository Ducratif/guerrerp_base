--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
--shared_script '@Sbach_Prod/ai_module_fg-obfuscated.js'
--shared_script '@Sbach_Prod/ai_module_fg-obfuscated.lua'
--shared_script '@Sbach_Prod/shared_fg-obfuscated.lua'

fx_version 'cerulean'
lua54 'yes'
game 'gta5'
use_experimental_fxv2_oal 'yes'

author 'Ducratif'
description 'Menu qui sert a faire plain de chose'
version '1.10.3'

dependencies {
      'oxmysql',
      '/server:17000'
}

server_script "@oxmysql/lib/MySQL.lua"

shared_scripts {
      'shared/functions.lua',
      'shared/utils.lua',
      'shared/init.lua',
}

client_scripts { 'client/utils/events.lua', 'client/utils/*.lua', 'client/modules/*.lua', 'client/cl_main.lua' }

server_scripts { "server/utils/*.lua", "server/database_checker.lua", 'server/modules/*.lua', 'server/sv_main.lua', 'server/index.js' }

files { 'config/config.json', 'config/help.lua', 'config/ped_list.json', 'config/teleports.lua', 'config/custom_functions/client.lua', 'locales/*.json', "web/index.html", 'web/**/*', "bridge/framework.lua", "bridge/client/**/*.lua" }

ui_page 'web/index.html'


dependency '/assetpacks'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
