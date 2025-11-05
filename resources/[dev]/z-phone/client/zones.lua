--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
function onEnterZoneNoSignal(self)
    PhoneData.SignalZone = self.name
end

function onExitZoneNoSignal(self)
    PhoneData.SignalZone = Config.Signal.DefaultSignalZones
end

CreateThread(function()
    for k, v in pairs(Config.Signal.Zones) do
        lib.zones.sphere({
            coords = v.CenterCoords,
            name = k,
            radius = v.Radius,
            debug = Config.Debug,
            onEnter = onEnterZoneNoSignal,
            onExit = onExitZoneNoSignal,
        })
    end
end)

function IsAllowToSendOrCall()
    if Config.Signal.IsUse then
        local rand = math.random()
        return rand < Config.Signal.Zones[PhoneData.SignalZone].ChanceSignal
    end

    return true
end

-- CreateThread(function() 
--     while true do
--         print(IsAllowToSendOrCall())
--         Wait(1000)
--     end
-- end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
