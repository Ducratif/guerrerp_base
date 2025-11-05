--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local Config = require 'config'



---@return table
local function getUiLocales()
    local locales = lib.getLocales()
    local uiLocales = {}

    for k, v in pairs(locales) do
        if k:find('^ui.') then
            uiLocales[k] = v
        end
    end

    return uiLocales
end



RegisterNUICallback('getConfig', function(_, cb)
    cb({
        max = Config.maximumFrequencies,
        step = Config.frequencyStep,
        locales = getUiLocales(),
    })
end)

AddEventHandler('ox_lib:setLocale', function()
    SendNUIMessage({
        action = 'setLocale',
        data = getUiLocales(),
    })
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
