--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Spectate system variables and configuration
local GetEntityCoords = GetEntityCoords
local GetPlayerPed = GetPlayerPed
local DoesEntityExist = DoesEntityExist
local SetEntityCoords = SetEntityCoords
local Wait = Wait
local PlayerPedId = PlayerPedId
local GetPlayerFromServerId = GetPlayerFromServerId
local GetPlayerServerId = GetPlayerServerId

-- Get current player server ID
local currentPlayerServerId = GetPlayerServerId(PlayerId())

-- Spectate system state
local spectateSystem = {
  target = {
    ped = nil,
    id = nil
  },
  lastCoords = nil
}
-- Keybind for closing spectate mode
Luxu.addKeybind({
  name = "luxu_admin:spectate_close",
  description = "Close the spectate menu",
  defaultKey = "Escape",
  onPressed = function()
    if spectateSystem.target.ped then
      spectateSystem:stop()
    else
      if LocalPlayer.state.luxu_admin_is_controlling then
        Luxu.callbackSync("actions:control", false, { stop = true })
      end
    end
  end
})
-- Start spectating a player
function spectateSystem:start(playerId, targetCoords)
  local playerPed = PlayerPedId()
  
  -- Store last position if not already stored
  if not self.lastCoords then
    self.lastCoords = GetEntityCoords(playerPed)
  end
  
  -- Fade out screen
  self:fadeOut()
  
  -- Calculate spectator position
  local spectatorCoords = self:calculateSpectatorCoords(targetCoords)
  
  -- Move player to spectator position
  SetEntityCoords(playerPed, spectatorCoords.x, spectatorCoords.y, spectatorCoords.z, false, false, false, false)
  
  -- Wait for fade
  Wait(500)
  
  -- Resolve target ped
  local targetPed = self:resolvePed(playerId)
  if not targetPed then
    -- Failed to find target, return to original position
    SetEntityCoords(playerPed, self.lastCoords.x, self.lastCoords.y, self.lastCoords.z, false, false, false, false)
    self.lastCoords = nil
    return self:fadeIn()
  end
  
  -- Set target data
  self.target.ped = targetPed
  self.target.id = playerId
  
  -- Start teleport tracking
  self:teleport()
  
  -- Hide player entity during spectate
  CreateThread(function()
    SetEntityVisible(cache.ped, false, false)
    
    while spectateSystem.target.ped do
      Wait(300)
      if spectateSystem.target.ped then
        SetEntityVisible(cache.ped, false, false)
      end
    end
  end)
  
  -- Enable spectator mode
  NetworkSetInSpectatorMode(true, targetPed)
  SetMinimapInSpectatorMode(true, targetPed)
  
  -- Set player state
  LocalPlayer.state:set("luxu_admin_is_spectating", true, true)
  
  -- Fade in
  self:fadeIn()
end
-- Stop spectating and return to original position
function spectateSystem:stop()
  -- Fade out screen
  self:fadeOut()
  
  -- Disable spectator mode
  NetworkSetInSpectatorMode(false, nil)
  SetMinimapInSpectatorMode(false, nil)
  
  -- Clear target data
  self.target = {
    ped = nil,
    id = nil
  }
  
  -- Return to original position if stored
  if self.lastCoords then
    SetEntityCoords(PlayerPedId(), self.lastCoords.x, self.lastCoords.y, self.lastCoords.z, false, false, false, false)
  end
  
  -- Notify server of spectate stop
  TriggerServerEvent("LuxuAdmin:server:spectateStop")
  
  -- Clear stored coordinates
  self.lastCoords = nil
  
  -- Make player visible again
  SetEntityVisible(PlayerPedId(), true, false)
  ResetEntityAlpha(PlayerPedId())
  
  -- Fade in
  self:fadeIn()
  
  -- Update player state
  LocalPlayer.state:set("luxu_admin_is_spectating", false, true)
end
-- Continuously update spectator position to follow target
function spectateSystem:teleport()
  if not self.target.ped then
    return
  end
  
  CreateThread(function()
    while self.target.ped do
      -- Check if target entity still exists
      if not DoesEntityExist(self.target.ped) then
        -- Try to get updated ped from server ID
        local updatedPed = GetPlayerPed(self.target.id)
        if updatedPed > 0 then
          -- Update target ped if it changed
          if updatedPed ~= self.target.ped then
            self.target.ped = updatedPed
          end
        else
          -- Target no longer exists, stop spectating
          self:stop()
          break
        end
      end
      
      -- Calculate new spectator position based on target
      local targetCoords = GetEntityCoords(self.target.ped)
      local spectatorCoords = self:calculateSpectatorCoords(targetCoords)
      
      -- Update spectator position
      SetEntityCoords(PlayerPedId(), spectatorCoords.x, spectatorCoords.y, spectatorCoords.z, false, false, false, false)
      
      -- Wait before next update
      Wait(500)
    end
  end)
end
-- Resolve player ped from server ID with timeout
function spectateSystem:resolvePed(serverId)
  local attempts = 0
  local maxAttempts = 3000
  
  -- Try to get player from server ID
  local playerId = GetPlayerFromServerId(serverId)
  local playerPed = 0
  
  if playerId then
    playerPed = GetPlayerPed(playerId)
    if playerPed then
      return playerPed
    end
  end
  
  -- If not found immediately, wait and retry
  while playerPed == 0 and attempts < maxAttempts do
    Wait(100)
    
    playerId = GetPlayerFromServerId(serverId)
    if playerId then
      playerPed = GetPlayerPed(playerId)
      if playerPed and playerPed ~= 0 then
        return playerPed
      end
    end
    
    attempts = attempts + 1
  end
  
  return false
end
-- Calculate spectator coordinates (15 units below target)
function spectateSystem:calculateSpectatorCoords(targetCoords)
  return vec3(targetCoords.x, targetCoords.y, targetCoords.z - 15.0)
end
-- Fade screen out with wait
function spectateSystem:fadeOut()
  DoScreenFadeOut(500)
  while not IsScreenFadedOut() do
    Wait(5)
  end
end
-- Fade screen in with wait
function spectateSystem:fadeIn()
  DoScreenFadeIn(500)
  while IsScreenFadingIn() do
    Wait(5)
  end
end
-- Global function to start spectating (called from other modules)
function StartSpectating(playerId, targetCoords)
  if not playerId or not targetCoords then
    return
  end
  spectateSystem:start(playerId, targetCoords)
end
-- Server event: Stop spectating
Luxu.registerNetEvent("spectate:stop", function()
  spectateSystem:stop()
end)
-- NUI Callback: Start spectating a player
RegisterNUICallback("specateStart", function(data, callback)
  -- Check if trying to spectate self
  if data == currentPlayerServerId then
    return callback(false)
  end
  
  -- If already spectating, stop first
  if spectateSystem.target.ped then
    spectateSystem:stop()
  else
    -- Request server to start spectating
    TriggerServerEvent("LuxuAdmin:server:spectateStart", data)
  end
  
  callback(true)
end)
-- NUI Callback: Stop spectating
RegisterNUICallback("spectateStop", function(data, callback)
  spectateSystem:stop()
  callback(true)
end)
-- Resource stop handler: Clean up spectating state
onResourceStop(function()
  if LocalPlayer.state.luxu_admin_is_spectating then
    spectateSystem:stop()
  end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
