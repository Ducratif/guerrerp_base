--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

-- Locals
local callback

--[[
    FUNCTIONS
]]

-- Function to start game
local function start_game(game_data, game_callback)
    if active then return end
    active = true
    callback = game_callback
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'start_minigame',
        game = 'wire_cut',
        data = {
            style = game_data.style,
            timer = game_data.timer
        }
    })
end

--[[
    NUI
]]

-- Nui callback to end game
RegisterNUICallback('wire_cut_end', function(data)
    SetNuiFocus(false, false)
    active = false
    callback(data.success)
end)

--[[
    EXPORT
]]

exports('wire_cut', start_game)

--[[
    TEST
]]

if config.use_test_commands then
    RegisterCommand('test_wire_cut', function()
        exports['boii_minigames']:wire_cut({
            style = 'default', -- Style template
            timer = 60000 -- Time allowed to complete game in (ms)
        }, function(success)
            if success then

            else

            end
        end)
    end)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
