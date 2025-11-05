--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Custom functions addon system for Luxu Admin
-- Manages custom buttons, quick actions, and toggles

-- Initialize CustomFunctions object with empty arrays
CustomFunctions = {
  buttons = {},
  quickActions = {},
  quickToggles = {}
}
-- Register NUI callback to get custom functions data
RegisterNuiCallback("custom_functions:get", function(data, callback)
  callback(CustomFunctions)
end)
-- Register custom addon button with callback handler
function RegisterAddonButton(buttonName, buttonLabel, buttonIcon, buttonColor, buttonHandler)
  -- Register NUI callback for this specific button
  RegisterNuiCallback("custom_functions:button:" .. buttonName, function(data, callback)
    -- Server callback function wrapper
    local function callServer(...)
      return Luxu.callbackSync("custom_functions:callback:" .. buttonName, false, data, ...)
    end
    
    -- Execute button handler with error handling
    local success, result = pcall(buttonHandler, data, callServer)
    if not success then
      Luxu.print.error("ERROR inside client custom function handler", buttonName)
      Luxu.print.error(result)
      callback(false)
      return
    end
    
    callback(result or true)
  end)
  
  -- Add button to CustomFunctions registry
  local buttonIndex = #CustomFunctions.buttons + 1
  CustomFunctions.buttons[buttonIndex] = {
    name = buttonName,
    label = buttonLabel,
    icon = buttonIcon,
    color = buttonColor
  }
end
-- Statistic blocks storage
local statisticBlocks = {}

-- Register addon statistic blocks
function RegisterAddonStatisticBlocks(blocks)
  for _, block in ipairs(blocks) do
    local blockIndex = #statisticBlocks + 1
    statisticBlocks[blockIndex] = block
  end
end
-- Register NUI callback to get statistic blocks
RegisterNuiCallback("custom_functions:statistic_blocks:get", function(data, callback)
  Luxu.callbackAsync(
    "custom_functions:statistic_blocks:get",
    false,
    function(result)
      callback(result)
    end,
    statisticBlocks
  )
end)
-- Register quick action with handler
function RegisterQuickAction(actionName, actionLabel, actionIcon, actionColor, actionHandler)
  -- Add quick action to registry
  local actionIndex = #CustomFunctions.quickActions + 1
  CustomFunctions.quickActions[actionIndex] = {
    name = actionName,
    label = actionLabel,
    icon = actionIcon,
    color = actionColor
  }
  
  -- Register NUI callback for this quick action
  RegisterNuiCallback("custom_functions:quick_action:" .. actionName, function(data, callback)
    callback(true)
    
    -- Execute action handler with error handling
    local success, result = pcall(actionHandler, data, callServer)
    if not success then
      Luxu.print.error("Error while executing custom quick action", actionName)
      Luxu.print.error(result)
    end
  end)
end
-- Register quick toggle with handler
function RegisterQuickToggle(toggleName, toggleLabel, toggleIcon, toggleColor, toggleHandler)
  -- Add quick toggle to registry
  local toggleIndex = #CustomFunctions.quickToggles + 1
  CustomFunctions.quickToggles[toggleIndex] = {
    name = toggleName,
    label = toggleLabel,
    icon = toggleIcon,
    color = toggleColor
  }
  
  -- Register NUI callback for this quick toggle
  RegisterNuiCallback("custom_functions:quick_toggle:" .. toggleName, function(data, callback)
    -- Execute toggle handler with error handling
    local success, result = pcall(toggleHandler, callServer)
    if not success then
      Luxu.print.error("Error while executing custom quick toggle", toggleName)
      Luxu.print.error(result)
      callback(false)
      return
    end
    
    callback(result)
  end)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
