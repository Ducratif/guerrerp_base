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
        game = 'safe_crack',
        data = {
            style = game_data.style,
            difficulty = game_data.difficulty
        }
    })
end

--[[
    NUI
]]

-- Nui callback to end game
RegisterNUICallback('safe_crack_end', function(data)
    SetNuiFocus(false, false)
    active = false
    callback(data.success)
end)

--[[
    EXPORT
]]

exports('safe_crack', start_game)

--[[
    TEST
]]

if config.use_test_commands then
    RegisterCommand('test_safe_crack', function()
        exports['boii_minigames']:safe_crack({
            style = 'default', -- Style template
            difficulty = 5 -- Difficuly; This increases the amount of lock a player needs to unlock this scuffs out a little above 6 locks I would suggest to use levels 1 - 5 only.
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
