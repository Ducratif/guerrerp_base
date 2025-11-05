--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if not Config.BossManagedOutfits then return end

Management = {}

Management.ItemIDs = {
    Gang = nil,
    Boss = nil
}

function Management.IsQB()
    local resName = "qb-management"
    if GetResourceState(resName) ~= "missing" then
        Management.ResourceName = resName
        return true
    end
    return false
end

function Management.IsQBX()
    local resName = "qbx_management"
    if GetResourceState(resName) ~= "missing" then
        Management.ResourceName = resName
        return true
    end
    return false
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
