--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterCommand("alarm_on", function(source, args, rawCommand)
    local alarmIpl = GetInteriorAtCoordsWithType(1787.004,2593.1984,45.7978,"int_prison_main")

    RefreshInterior(alarmIpl)
    EnableInteriorProp(alarmIpl, "prison_alarm")

    Citizen.CreateThread(function()
        while not PrepareAlarm("PRISON_ALARMS") do
            Citizen.Wait(100)
        end
        StartAlarm("PRISON_ALARMS", true)
    end)
end, false)

RegisterCommand("alarm_off", function(source, args, rawCommand)
    local alarmIpl = GetInteriorAtCoordsWithType(1787.004,2593.1984,45.7978,"int_prison_main")

    RefreshInterior(alarmIpl)
    DisableInteriorProp(alarmIpl, "prison_alarm")

    Citizen.CreateThread(function()
        while not PrepareAlarm("PRISON_ALARMS") do
            Citizen.Wait(100)
        end
        StopAllAlarms(true)
    end)
end, false)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
