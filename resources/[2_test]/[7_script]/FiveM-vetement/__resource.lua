--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
---------------------------------------------------------------------------------------
--                     Author: Xavier CHOPIN <www.github.com/xchopin>                --
--                                 License: Apache 2.0                               --
---------------------------------------------------------------------------------------
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

dependency 'mysql-async'

--------------------------------------
------------ SERVER ------------------
--------------------------------------
server_scripts {
    'Server/server.lua',
    '@mysql-async/lib/MySQL.lua'
}
--server_script 'Server/settings.lua' --
--------------------------------------
--------------------------------------

--------------------------------------
------------ CLIENT ------------------
--------------------------------------
client_script 'Client/menu.lua'   ----
client_script 'Client/client.lua' ----
--------------------------------------
--------------------------------------

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
