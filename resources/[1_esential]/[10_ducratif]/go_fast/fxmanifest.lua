--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--

fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

dependency 'ox_lib'

author 'Ducratif' -- Remplace avec ton nom ou pseudonyme
description 'Go-Fast Mission Script pour ESX Legacy avec ox_lib et ox_inventory'
version '1.0.0'

shared_scripts {
    '@es_extended/imports.lua',  -- Importation d'ESX
    'config.lua',  -- Le fichier de configuration
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',  -- Si tu utilises oxmysql pour la base de données
    'server.lua',  -- Le script côté serveur
}

client_scripts {
    '@ox_lib/init.lua',  -- Initialisation d'ox_lib
    'client.lua',  -- Le script côté client
}

dependencies {
    'es_extended',  -- Dépendance à ESX
    'ox_lib',  -- Dépendance à ox_lib
    'ox_inventory',  -- Dépendance à ox_inventory
}

-- Script Go-Fast développer par Ducratif pour GuerreRP - 2025

--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
