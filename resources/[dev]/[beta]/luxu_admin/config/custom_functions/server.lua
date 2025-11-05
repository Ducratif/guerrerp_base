--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
--[[

Use this file to create custom callbacks for the client defined logic in the custom_functions/client.lua file.

---@param source number
---@vararg any
RegisterAddonCallback("name",function(source, ...)
    -- Your code here
end)


]]

RegisterAddonCallback("custom_button_1", function(source, target, argument1)
    print("custom_button_1: source:", source)
    print("custom_button_1: target:", target)
    print("custom_button_1: argument1:", argument1)

    return true
end)

--- Custom Statistic Blocks

RegisterAddonStatisticBlocksCallback("test_block_1", function(source)
    return {
        title = "Test Title",
        value = 100,
        description = "Test Description",
        formatToCash = true -- if you want the value to be formatted to cash, set this to true, make the value a number
    }
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
