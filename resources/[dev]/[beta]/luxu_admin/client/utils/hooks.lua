--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Hook system for Luxu Admin
-- Manages state bag change handlers and event hooks

-- Register staff duty toggle hook
function OnStaffDutyToggled(callback)
  AddStateBagChangeHandler("luxu_admin_staff_duty", nil, function(bagName, key, value)
    local playerId = GetPlayerFromStateBagName(bagName)
    
    -- Only trigger callback for current player
    if playerId == Luxu.cache.playerId then
      callback(value)
    end
  end)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
