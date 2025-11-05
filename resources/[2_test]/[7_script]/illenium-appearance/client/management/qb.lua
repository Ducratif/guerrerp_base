--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if not Config.BossManagedOutfits then return end

if not Management.IsQB() then return end

function Management.AddItems()
    local menuItem = {
        header = _L("outfitManagement.title"),
        icon = "fa-solid fa-shirt",
        params = {
            event = "illenium-appearance:client:OutfitManagementMenu",
            args = {}
        }
    }
    menuItem.txt = _L("outfitManagement.jobText")
    menuItem.params.args.type = "Job"
    Management.ItemIDs.Boss = exports[Management.ResourceName]:AddBossMenuItem(menuItem)

    menuItem.txt = _L("outfitManagement.gangText")
    menuItem.params.args.type = "Gang"
    Management.ItemIDs.Gang = exports[Management.ResourceName]:AddGangMenuItem(menuItem)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
