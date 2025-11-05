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
	'config/config.lua'
  }

client_scripts {
	'config/config.lua',
	'client/cl_mecano.lua',
	'client/cl_lock.lua',
	'client/version.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config/config.lua',
	'server/sv_mecano.lua'
}

shared_script '@ox_lib/init.lua'

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
