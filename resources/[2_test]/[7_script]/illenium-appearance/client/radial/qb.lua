--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if not Radial.IsQBX() and not Radial.IsQB() then return end

function Radial.Add(title, event)
    exports[Radial.ResourceName]:AddOption({
        id = Radial.MenuID,
        title = title,
        icon = "shirt",
        type = "client",
        event = event,
        shouldClose = true
    }, Radial.MenuID)
end

function Radial.Remove()
    exports[Radial.ResourceName]:RemoveOption(Radial.MenuID)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
