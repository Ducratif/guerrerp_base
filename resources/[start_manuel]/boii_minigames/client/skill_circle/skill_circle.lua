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
        game = 'skill_circle',
        data = {
            style = game_data.style,
            area_size = game_data.area_size,
            speed = game_data.speed,
        }
    })
end
--[[
    NUI
]]

-- Nui callback to end game
RegisterNUICallback('skill_circle_end', function(data)
    SetNuiFocus(false, false)
    active = false
    callback(data.success)
end)

--[[
    EXPORT
]]

exports('skill_circle', start_game)

--[[
    TEST
]]

if config.use_test_commands then
    RegisterCommand('test_skill_circle', function()
        exports['boii_minigames']:skill_circle({
            style = 'default', -- Style template
            icon = 'fa-solid fa-paw', -- Any font-awesome icon; will use template icon if none is provided
            area_size = 4, -- Size of the target area in Math.PI / "value"
            speed = 0.02, -- Speed the target area moves
        }, function(success) -- Game callback
            if success == 'perfect' then
                -- If perfect do something

            elseif success == 'success' then
                -- If success do something

            elseif success == 'failed' then
                -- If failed do something

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
