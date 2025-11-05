--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- NUI Visibility management system
-- Handles panel and menu visibility states and focus control

-- Visibility state object
Visibility = {
  open = false,
  menu = nil
}
-- Hide panel and disable NUI focus
function Visibility.hidePanel()
  SetNuiFocus(false, false)
  SetNuiFocusKeepInput(false)
  Visibility.open = false
  FetchNui("closePanel")
end
-- Hide menu and disable NUI focus
function Visibility.hideMenu()
  SetNuiFocus(false, false)
  SetNuiFocusKeepInput(false)
  Visibility.menu = nil
  Visibility.open = false
  FetchNui("closeMenu")
end
-- NUI callback: Close UI with frontend disable
RegisterNuiCallback("closeUi", function(data, callback)
  -- Disable frontend for 1 second to prevent input conflicts
  local disableInterval = Luxu.setInterval(DisableFrontendThisFrame)
  SetTimeout(1000, function()
    Luxu.clearInterval(disableInterval)
  end)
  
  -- Disable NUI focus
  SetNuiFocus(false, false)
  SetNuiFocusKeepInput(false)
  
  -- Reset visibility state
  Visibility.open = false
  Visibility.menu = nil
  
  -- Send callback response
  callback(true)
end)
-- NUI callback: Toggle NUI input focus
RegisterNuiCallback("toggleNuiInput", function(data, callback)
  -- Return current state if IGNORE command
  if data == "IGNORE" then
    return callback(IsNuiFocusKeepingInput())
  end
  
  -- Determine new input state
  local newInputState
  if type(data) == "boolean" and data then
    newInputState = data
  else
    newInputState = IsNuiFocusKeepingInput()
  end
  
  -- Toggle NUI focus settings
  SetNuiFocusKeepInput(not newInputState)
  SetNuiFocus(true, newInputState)
  
  -- Send callback response
  callback(newInputState)
end)
-- Toggle admin panel visibility
local function openPanel()
  -- Don't open panel if menu is already open
  if Visibility.menu == "menu" then
    return
  end
  
  if Visibility.open then
    -- Close panel
    Visibility.open = false
    Visibility.menu = nil
    FetchNui("closePanel")
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
  else
    -- Open panel
    Visibility.open = true
    Visibility.menu = "panel"
    FetchNui("openPanel")
    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(false)
  end
end

-- Export panel function
OpenPanel = openPanel
-- Toggle admin menu visibility
local function openMenu()
  -- Don't open menu if panel is already open
  if Visibility.menu == "panel" then
    return
  end
  
  if Visibility.open then
    -- Close menu
    Visibility.open = false
    Visibility.menu = nil
    FetchNui("closeMenu")
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
  else
    -- Open menu
    Visibility.open = true
    Visibility.menu = "menu"
    FetchNui("openMenu")
    SetNuiFocus(true, false)
    SetNuiFocusKeepInput(true)
  end
end

-- Export menu function
OpenMenu = openMenu
-- Server event: Open admin panel (local source only)
Luxu.registerNetEvent("commands:open_panel", function()
  -- Only allow local source (65535)
  if source ~= 65535 then
    return
  end
  
  OpenPanel()
end)
-- Server event: Open admin menu (local source only)
Luxu.registerNetEvent("commands:open_menu", function()
  -- Only allow local source (65535)
  if source ~= 65535 then
    return
  end
  
  OpenMenu()
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
