--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
--[[ Main Panel ]]

--[[ DISCLAIMER

You are responsible for the SECURITY of the functions you created.
Remember that anybody can trigger these functions with a simple hack or exploit.
Important operations should ALWAYS be validated on the server side.s

You can make a simple protection by checking if the player is on duty.

e.g. `if not IsOnDuty() then return end`


]]



RegisterAddonButton("custom_button_1", "TEST BUTTON", "material-icon-theme:test-ts", "#f54266",
    function(target, callServer)
        local playerTarget = target -- This is the server id of the player that we want to execute an action on


        -- If you registered a specific callback on the server.lua, you can call it like this
        -- Check server.lua for example implementation~
        -- Source and Target arguments are already provided
        local result = callServer("foobar")

        if result then
            print("Custom callback success")
        end

        -- Perform any other logic here
    end)

RegisterAddonStatisticBlocks({
    "test_block_1",
    "test_block_2",
    "test_block_3",
})




--[[  Quick Menu ]]


RegisterQuickAction("custom_action_1", "Custom Action 1", "material-icon-theme:test-ts", "#f54266",
    function(target, callServer)
        print("Custom Action 1")
    end)


--- Must return a boolean
RegisterQuickToggle("custom_toggle_1", "Custom Toggle 1", "material-icon-theme:test-ts", "#f54266",
    function()
        local state = false

        state = true

        return state
    end)
--- Must return a boolean
RegisterQuickToggle("custom_toggle_2", "Custom Toggle 2", "material-icon-theme:test-ts", "#f54266",
    function()
        local state = false

        state = true

        return state
    end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
