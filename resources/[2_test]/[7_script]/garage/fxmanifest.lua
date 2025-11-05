--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'cerulean'
game 'gta5' 
name 'LeDjo_Garage Rework By LeDjo_Garage'
lua54 'yes'
version '1.10.1'
author 'Rework By LeDjo_Garage_Developpement'

shared_scripts{
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config_garage.lua',
    'config_keys.lua',
    'functions.lua'
} 

client_scripts{
    'client/*.lua',
} 

server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
} 

files {
    'locales/*.json'
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
