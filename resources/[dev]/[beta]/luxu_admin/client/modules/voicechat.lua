--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Voice chat management system
-- Handles voice channel joining, leaving, and state management

-- Import voice bridge module
local voiceBridge = Luxu.require("bridge.client.voice")

-- Voice chat state object
local voiceChat = {
  isActive = false,
  channel = 0,
  chatId = 0
}
-- Set voice chat channel and join call
function voiceChat.set(self, channel, chatId)
  -- Update state
  self.isActive = true
  self.channel = channel
  
  -- Set player state for call channel
  LocalPlayer.state:set("luxu_admin:callChannel", channel, true)
  
  -- Leave current call and join new channel
  voiceBridge.leaveCall()
  voiceBridge.joinCall(channel)
  
  -- Store chat ID
  self.chatId = chatId
end
-- Remove from voice chat and leave call
function voiceChat.remove(self)
  -- Reset state
  self.isActive = false
  self.channel = 0
  
  -- Clear player state for call channel
  LocalPlayer.state:set("luxu_admin:callChannel", 0, true)
  
  -- Leave current call
  voiceBridge.leaveCall()
end
-- Register NUI server callbacks for voice chat
Luxu.registerNuiServerCallback("chat:joinVoice")
Luxu.registerNuiServer("chat:leaveVoice")
-- Server event: Join voice chat channel
Luxu.registerNetEventStrict("voicechat:join", function(channel, chatId)
  voiceChat:set(channel, chatId)
end)
-- Server event: Leave voice chat
Luxu.registerNetEventStrict("voicechat:leave", function()
  voiceChat:remove()
end)
-- NUI callback: Check if player is in specific voice call
RegisterNUICallback("voicechat:isInCall", function(data, callback)
  -- Return chatId if it matches the requested one, otherwise false
  local result = voiceChat.chatId == data and voiceChat.chatId or false
  callback(result)
end)
-- Resource stop handler: Clean up voice chat on resource stop
onResourceStop(function()
  if voiceChat.isActive then
    voiceBridge.leaveCall()
  end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
