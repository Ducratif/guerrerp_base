--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Developer code execution module
-- Manages server-side code execution for admin developers

-- Storage for active coroutines per player
local activeCoroutines = {}

-- Server-side code execution handler
local function handleCodeExecution(data)
  local playerId = source
  
  -- Check developer execute permission
  if not HasPermission(playerId, "developer.execute", true, true) then
    return
  end
  
  -- Check if player has an existing coroutine running
  local existingCoroutine = activeCoroutines[playerId]
  if existingCoroutine then
    local coroutineStatus = coroutine.status(existingCoroutine)
    
    -- Close existing coroutine if it's still running
    if coroutineStatus ~= "dead" then
      coroutine.close(existingCoroutine)
    end
  end
  
  -- Load the provided code
  local loadedFunction, loadError = load(data.code)
  
  -- If code loaded successfully, execute it in a coroutine
  if loadedFunction then
    -- Create new coroutine for the loaded function
    local newCoroutine = coroutine.create(loadedFunction)
    activeCoroutines[playerId] = newCoroutine
    
    -- Resume the coroutine to execute the code
    coroutine.resume(activeCoroutines[playerId])
    
    -- Notify player of successful execution
    Luxu.notifyPlayer(playerId, {
      title = Locales.code_is_running,
      description = Locales.code_executed_successfully,
      type = "success"
    })
    return
  end
  
  -- Handle code loading errors
  if loadError then
    Luxu.print.error(loadError)
  end
end

-- Register the server net event for code execution
Luxu.registerNetEvent("developer:runCode:server", handleCodeExecution)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
