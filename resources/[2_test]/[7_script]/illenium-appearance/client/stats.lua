--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local stats = nil

local function ResetRechargeMultipliers()
    SetPlayerHealthRechargeMultiplier(cache.playerId, 0.0)
    SetPlayerHealthRechargeLimit(cache.playerId, 0.0)
end

function BackupPlayerStats()
    stats = {
        health = GetEntityHealth(cache.ped),
        armour = GetPedArmour(cache.ped)
    }
end

function RestorePlayerStats()
    if stats then
        SetEntityMaxHealth(cache.ped, 200)
        Wait(1000) -- Safety Delay
        SetEntityHealth(cache.ped, stats.health)
        SetPedArmour(cache.ped, stats.armour)
        ResetRechargeMultipliers()
        stats = nil
        return
    end

    -- If no stats are backed up, restore from the framework
    Framework.RestorePlayerArmour()
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
