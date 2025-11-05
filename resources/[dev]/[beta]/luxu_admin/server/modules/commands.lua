--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Configuration and pattern references
local commandsConfig = Config.commands
local vector3Pattern = "vector3%s*%(%s*(-?%d+%.?%d*)%s*,%s*(-?%d+%.?%d*)%s*,%s*(-?%d+%.?%d*)%s*%)"
local vector4Pattern = "vector4%s*%(%s*(-?%d+%.?%d*)%s*,%s*(-?%d+%.?%d*)%s*,%s*(-?%d+%.?%d*)%s*,%s*(-?%d+%.?%d*)%s*%)"

-- Save player's last coordinates for teleport back functionality
local function saveLastCoords(playerId, coords)
  Player(playerId).state:set("luxu_admin_last_coords", {
    x = coords.x,
    y = coords.y,
    z = coords.z
  }, true)
end
-- Teleport go back command
if commandsConfig.teleport_go_back.enabled then
  Luxu.addCommand(
    commandsConfig.teleport_go_back.name,
    {
      help = commandsConfig.teleport_go_back.description,
      restricted = false,
      params = commandsConfig.teleport_go_back.params
    },
    function(playerId, args)
      -- Check teleport permission
      if not HasPermission(playerId, "self.teleport", true, true) then
        return
      end
      
      -- Determine target player (self or specified player)
      local targetPlayerId = playerId
      if args[1] and GetPlayerName(args[1]) then
        targetPlayerId = args[1]
      end
      
      -- Get saved coordinates
      local lastCoords = Player(targetPlayerId).state.luxu_admin_last_coords
      if not lastCoords then
        return
      end
      
      -- Get player ped and current position
      local playerPed = GetPlayerPed(targetPlayerId)
      local currentCoords = GetEntityCoords(playerPed)
      
      -- Teleport to last saved coordinates
      SetEntityCoords(playerPed, lastCoords.x, lastCoords.y, lastCoords.z, true, false, false, false)
      
      -- Save current position as new "last coords"
      saveLastCoords(targetPlayerId, currentCoords)
    end
  )
end
-- Teleport player command
if commandsConfig.teleport_player.enabled then
  Luxu.addCommand(
    commandsConfig.teleport_player.name,
    {
      help = commandsConfig.teleport_player.description,
      restricted = false
    },
    function(playerId, args)
      -- Check teleport permission
      if not HasPermission(playerId, "self.teleport", true, true) then
        return
      end
      
      local playerPed = GetPlayerPed(playerId)
      local vehicle = GetVehiclePedIsIn(playerPed, false)
      local entityToTeleport = vehicle ~= 0 and vehicle or playerPed
      local currentCoords = GetEntityCoords(playerPed)
      
      local targetPlayerId = args[1]
      
      -- Teleport to another player
      if GetPlayerName(targetPlayerId) then
        if not args[2] then
          local targetPed = GetPlayerPed(targetPlayerId)
          local targetCoords = GetEntityCoords(targetPed)
          
          saveLastCoords(playerId, currentCoords)
          SetEntityCoords(entityToTeleport, targetCoords.x, targetCoords.y, targetCoords.z, true, false, false, false)
          return
        end
      end
      
      -- Teleport to coordinates (x y z format)
      if args[2] and args[3] then
        local coords = {
          x = tonumber(args[1]),
          y = tonumber(args[2]),
          z = tonumber(args[3])
        }
        
        if coords.x and coords.y and coords.z then
          saveLastCoords(playerId, currentCoords)
          SetEntityCoords(entityToTeleport, coords.x, coords.y, coords.z, true, false, false, false)
          return
        else
          return
        end
      end
      
      -- Parse coordinate string (vector3/vector4 format)
      local coordsString = table.concat(args, " ")
      local parsedCoords = ParseCoordsString(coordsString)
      
      if parsedCoords then
        saveLastCoords(playerId, currentCoords)
        SetEntityCoords(entityToTeleport, parsedCoords.x, parsedCoords.y, parsedCoords.z, true, false, false, false)
        
        -- Set heading if provided (vector4)
        if parsedCoords.w then
          SetEntityHeading(entityToTeleport, parsedCoords.w)
        end
      else
        print(string.format("Player %s provided invalid coordinates for tp: %s", playerId, coordsString))
      end
    end
  )
end
-- Spectate command
if commandsConfig.spectate.enabled then
  Luxu.addCommand(
    commandsConfig.spectate.name,
    {
      help = commandsConfig.spectate.description,
      restricted = false
    },
    function(playerId, args)
      -- Check spectate permission
      if not HasPermission(playerId, "player.spectate", true, true) then
        return
      end
      
      local targetPlayerId = args[1]
      
      -- Stop spectating or no target specified
      if not targetPlayerId or targetPlayerId == "stop" then
        if Player(playerId).state.luxu_admin_is_spectating then
          Luxu.triggerClientEvent("spectate:stop", playerId)
        end
        return
      end
      
      -- Validate target player
      if tonumber(targetPlayerId) == 0 or not GetPlayerName(targetPlayerId) then
        Luxu.notifyPlayer(playerId, {
          description = Locales.player_not_found,
          type = "error",
          title = Locales.player_not_found,
          duration = 4000
        })
        return
      end
      
      -- Check if target is already spectating
      if Player(targetPlayerId).state.luxu_admin_is_spectating then
        Luxu.notifyPlayer(playerId, {
          description = Locales.this_staff_member_is_currently_spectating_another_player,
          type = "error",
          title = Locales.spectating_unavailable,
          duration = 4000
        })
        return
      end
      
      -- Get target player ped and coordinates
      local targetPed = GetPlayerPed(targetPlayerId)
      if not targetPed then
        return
      end
      
      local targetCoords = GetEntityCoords(targetPed)
      
      -- Trigger spectate on client
      Luxu.triggerClientEvent("actions:spectate", playerId, {
        target = tonumber(targetPlayerId),
        coords = {
          x = targetCoords.x,
          y = targetCoords.y,
          z = targetCoords.z
        }
      })
    end
  )
end
-- Open panel command
if commandsConfig.open_panel.enabled then
  Luxu.addCommand(
    commandsConfig.open_panel.name,
    {
      help = commandsConfig.open_panel.description,
      restricted = false
    },
    function(playerId, args)
      -- Check if player is staff
      if not IsStaff(playerId) then
        return
      end
      
      -- Trigger client event to open panel
      Luxu.triggerClientEvent("commands:open_panel", playerId)
    end
  )
end
-- Open menu command
if commandsConfig.open_menu.enabled then
  Luxu.addCommand(
    commandsConfig.open_menu.name,
    {
      help = commandsConfig.open_menu.description,
      restricted = false
    },
    function(playerId, args)
      -- Check quick menu permission
      if not HasPermission(playerId, "self.quickmenu", true, true) then
        return
      end
      
      -- Trigger client event to open menu
      Luxu.triggerClientEvent("commands:open_menu", playerId)
    end
  )
end
-- Teleport to marker command
if commandsConfig.teleport_marker.enabled then
  Luxu.addCommand(
    commandsConfig.teleport_marker.name,
    {
      help = commandsConfig.teleport_marker.description,
      restricted = false
    },
    function(playerId, args)
      -- Check teleport permission
      if not HasPermission(playerId, "self.teleport", true, true) then
        return
      end
      
      -- Save current coordinates before teleporting
      local playerPed = GetPlayerPed(playerId)
      local currentCoords = GetEntityCoords(playerPed)
      saveLastCoords(playerId, currentCoords)
      
      -- Trigger client event to teleport to marker
      Luxu.triggerClientEvent("commands:tpm", playerId)
    end
  )
end
-- Player report command
if Config.reports.enabled then
  if commandsConfig.player_report.enabled then
    Luxu.addCommand(
      commandsConfig.player_report.name,
      {
        help = commandsConfig.player_report.description,
        restricted = false
      },
      function(playerId, args)
        -- Trigger client event to open report interface
        Luxu.triggerClientEvent("commands:report", playerId)
      end
    )
  end
end
-- Noclip command
if commandsConfig.noclip.enabled then
  Luxu.addCommand(
    commandsConfig.noclip.name,
    {
      help = commandsConfig.noclip.description,
      restricted = false
    },
    function(playerId, args)
      -- Check noclip permission
      if not HasPermission(playerId, "self.noclip", true, true) then
        return
      end
      
      -- Trigger client event to toggle noclip
      Luxu.triggerClientEvent("actions:noclip", playerId)
    end
  )
end
-- My identifiers command (debug utility)
Luxu.addCommand(
  "myidentifiers",
  {},
  function(playerId)
    local identifiers = GetPlayerIdentifiers(playerId)
    
    -- Print all identifiers except IP (for privacy)
    for _, identifier in ipairs(identifiers) do
      if not identifier:find("ip:") then
        print(identifier)
      end
    end
  end
)
-- Staff list command
Luxu.addCommand(
  "staff",
  {},
  function(playerId)
    -- Get online staff members
    local onlineStaff = exports.luxu_admin:getOnlineStaff(true)
    
    -- Print formatted staff list to console
    print(json.encode(onlineStaff, { indent = true }))
    
    -- Send staff list to client for UI display
    Luxu.triggerClientEvent("commands:staff", playerId, onlineStaff)
  end
)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
