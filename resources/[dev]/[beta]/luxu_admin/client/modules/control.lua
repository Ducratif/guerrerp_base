--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Player control system for admin actions
local isControlActive = false

-- Stop player control and exit spectator mode
local function stopPlayerControl()
    if not isControlActive then
        return
    end
    
    -- Exit spectator mode
    NetworkSetInSpectatorMode(false, Luxu.cache.ped)
    SetMinimapInSpectatorMode(false, Luxu.cache.ped)
    
    -- Reset control state
    isControlActive = false
    
    -- Fade screen back in
    DoScreenFadeIn(300)
end
-- Network event for setting up player control
Luxu.registerNetEventStrict("actions:controlSetup", function(targetServerId)
    -- Get target player from server ID
    local targetPlayer = GetPlayerFromServerId(targetServerId)
    local targetPed = GetPlayerPed(targetPlayer)
    
    -- Clone target ped to current player
    ClonePedToTarget(targetPed, Luxu.cache.ped)
end)
-- Resource stop handler to cleanup control state
onResourceStop(function()
    stopPlayerControl()
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
