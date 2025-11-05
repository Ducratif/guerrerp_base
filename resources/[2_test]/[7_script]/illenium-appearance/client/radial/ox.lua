--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if not Radial.IsOX() then return end

function Radial.Add(title, event)
    lib.addRadialItem({
        id = Radial.MenuID,
        icon = "shirt",
        label = title,
        event = event,
        onSelect = function()
            TriggerEvent(event)
        end
    })
end

function Radial.Remove()
    lib.removeRadialItem(Radial.MenuID)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
