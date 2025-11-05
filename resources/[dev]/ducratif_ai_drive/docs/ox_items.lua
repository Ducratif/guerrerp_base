--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Place this snippet in ox_inventory/data/items.lua
-- (Restart the server after editing)

['module_ia'] = {
    label = 'Module IA',
    weight = 200,
    stack = true,
    close = true,
    description = 'Restaure à 100% une option IA au choix.',
    image = 'module_ia.png',
    client = { event = 'ducratif_ai:item:use', args = 'single' }
},
['module_ia_premium'] = {
    label = 'Module IA Premium',
    weight = 200,
    stack = true,
    close = true,
    description = 'Restaure à 50% toutes les options IA.',
    image = 'module_ia_premium.png',
    client = { event = 'ducratif_ai:item:use', args = 'premium' }
},
['module_ia_platinum'] = {
    label = 'Module IA Platine',
    weight = 200,
    stack = true,
    close = true,
    description = 'Restaure à 100% toutes les options IA.',
    image = 'module_ia_platinum.png',
    client = { event = 'ducratif_ai:item:use', args = 'platinum' }
},

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
