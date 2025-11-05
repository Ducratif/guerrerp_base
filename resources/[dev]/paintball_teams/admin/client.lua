--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local menu = require 'admin.ui.menu'

print("💡 Client admin.lua chargé")

RegisterCommand('adminskills', function()
    print("📤 Envoi de l'event serveur")
    TriggerServerEvent('paintball_admin:openMenuRequest', GetGameTimer())
end, false)



RegisterNetEvent('paintball_admin:openMenu', function()
    print("💬 [Admin Menu] Ouverture menu reçue.")
    menu.open()
end)

RegisterNetEvent('paintball_admin:kickFromTeam', function(identifier)
    print("[CLIENT] Reçu demande kick joueur :", identifier)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
