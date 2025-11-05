--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
fx_version 'adamant'

game 'gta5'

description 'barbershop'

version '1.0.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
}

server_scripts{
    '@es_extended/locale.lua',
    'locales/en.lua',
    'config.lua',
    'server.lua'
}

client_scripts{
    '@es_extended/locale.lua',
    'locales/en.lua',
    'config.lua',
    'client.lua'
}


dependencies {
    'ox_lib',
    'ox_target',
    'ox_inventory',
    'es_extended',
    'esx_skin',
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
