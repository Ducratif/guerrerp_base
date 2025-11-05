--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Server main initialization module
-- Handles server-side setup, configuration loading, and core functions

-- Load server custom functions with error handling
xpcall(
  function()
    require("config.custom_functions.server")
  end,
  function(error)
    Luxu.print.error("Error loading server custom functions")
    Luxu.print.error(error)
  end
)
-- Load moderation configuration with error handling
xpcall(
  function()
    require("config.moderation")
  end,
  function(error)
    Luxu.print.error("Error loading config/moderation.lua")
    Luxu.print.error(error)
  end
)
-- Permission checking function
local function checkPlayerPermission(playerId, permission, showNotification, returnBoolean)
  local resourceExport = exports[Luxu.resourceName]
  return resourceExport:checkPermission(playerId, permission, showNotification, returnBoolean)
end

-- Export HasPermission function globally
HasPermission = checkPlayerPermission
-- Staff checking function
local function checkPlayerIsStaff(playerId)
  local resourceExport = exports[Luxu.resourceName]
  return resourceExport:isStaff(playerId)
end

-- Export IsStaff function globally
IsStaff = checkPlayerIsStaff
-- Register server callback for permission checking
Luxu.registerServerCallback(
  "checkPermission",
  function(playerId, permission, showNotification, returnBoolean)
    return HasPermission(playerId, permission, showNotification, returnBoolean)
  end
)
-- Register server callback for getting player money accounts
Luxu.registerServerCallback(
  "player:getMoneyAccounts",
  function(requestingPlayerId, targetPlayerId)
    -- Check permission to view money accounts
    if not HasPermission(requestingPlayerId, "player.view_money_accounts") then
      return
    end
    
    -- Get target player object
    local playerObject = Luxu.player.getPlayerObject(targetPlayerId)
    if not playerObject then
      return
    end
    
    -- Return player's money accounts
    return Luxu.player.getMoneyAccounts(playerObject)
  end
)
-- Register server callback for getting ESX vehicle list
Luxu.registerServerCallback(
  "getESXVehicles",
  function()
    return ESXMODELLIST
  end,
  true,    -- Cache result
  25000.0  -- Cache timeout
)
-- Force shutdown of configured resources
for _, resourceName in ipairs(Config.force_resource_shutdowns) do
  if resourceName and type(resourceName) == "string" then
    -- Stop resource if it's currently running
    if GetResourceState(resourceName) == "started" then
      StopResource(resourceName)
    end
    
    -- Add event handler to prevent resource from starting
    AddEventHandler("onResourceStart", function(startedResourceName)
      if startedResourceName == resourceName then
        StopResource(startedResourceName)
      end
    end)
  end
end
-- Server identification function for Luxu API
--local function identifyServerWithAPI()
--  -- Get license key token from server configuration
--  local licenseToken = GetConvar("sv_licenseKeyToken", "FALSE")
--  
--  -- Validate license token exists
--  if licenseToken == "" or licenseToken == "FALSE" then
--    Luxu.print.error("ERROR IDENTIFYING SERVER")
--    return
--  end
--  
--  -- Prepare server identification data
--  local identificationData = {
--    token = licenseToken,
--    web_baseUrl = GetConvar("sv_webBaseUrl", "FALSE"),
--    server_name = GetConvar("sv_hostname", "FALSE"),
--    luxu_admin_version = GetResourceMetadata(GetCurrentResourceName(), "version", 0),
--    artifacts = GetConvar("buildNumber", "FALSE"),
--    game_build = GetConvar("sv_enforceGameBuild", "FALSE")
--  }
--  
--  -- Send identification request to Luxu API
--  PerformHttpRequest(
--    "https://api.luxu.gg/identify",
--    function(responseCode)
--      -- Handle response codes
--      if responseCode == 200 then
--        -- Success - server identified
--      elseif responseCode == 401 then
--        -- Unauthorized - invalid token
--      end
--    end,
--    "POST",
--    json.encode(identificationData)
--  )
--end
--
---- Export IdentifyServer function
--IdentifyServer = identifyServerWithAPI

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
