--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local weather = {}

function weather.SetTime(hour, minute)
    if (GetResourceState("cd_easytime") == "started") then
        exports['cd_easytime']:forceUpdate({ hours = hour, minutes = minute })
    else
        -- TODO: Implement internal system
    end
end

function weather.SetWeather(currentWeather)
    if (GetResourceState("cd_easytime") == "started") then
        exports['cd_easytime']:forceUpdate({ weather = currentWeather, instantweather = true })
    else
        -- TODO: Implement internal system
    end
end

function weather.FreezeTime()
    if (GetResourceState("cd_easytime") == "started") then
        local data = exports['cd_easytime']:GetWeather()
        local status = not data.freeze
        exports['cd_easytime']:forceUpdate({ freeze = status })
    else
        -- TODO: Implement internal system
    end
end

function weather.SetBlackout(state)
    if (GetResourceState("cd_easytime") == "started") then
        exports['cd_easytime']:forceUpdate({ blackout = state })
    else
        -- TODO: Implement internal system
    end
end

return weather

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
