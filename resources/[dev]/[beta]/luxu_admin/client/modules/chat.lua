--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Chat system NUI callbacks and event handlers

-- Register NUI server callbacks for chat functionality
Luxu.registerNuiServerCallback("chat:sendMessage")
Luxu.registerNuiServerCallback("chat:player:createReport")

-- Close report callback with NUI focus handling
local function handleCloseReport(success)
    if success then
        SetNuiFocus(false, false)
    end
end

Luxu.registerNuiServerCallback("chat:player:closeReport", nil, handleCloseReport)
-- Staff and player report management callbacks
Luxu.registerNuiServerCallback("chat:staff:closeReport")
Luxu.registerNuiServerCallback("chat:player:fetchReport")
Luxu.registerNuiServerCallback("chat:staff:deleteChat")
Luxu.registerNuiServerCallback("chat:staff:updateName")
-- Server NUI event listeners for chat updates
Luxu.listenForServerNuiEvent("chat:deleted")
Luxu.listenForServerNuiEvent("chat:updated")
Luxu.listenForServerNuiEvent("chat:new")
-- Staff chat management callbacks
Luxu.registerNuiServerCallback("chat:staff:fetchAll")
Luxu.registerNuiServerCallback("chat:staff:createChat")
Luxu.registerNuiServerCallback("chat:join")
-- Chat room and call management NUI server events
Luxu.registerNuiServer("chat:leave")
Luxu.registerNuiServer("chat:enter")
Luxu.registerNuiServer("chat:exit")
Luxu.registerNuiServer("chat:joinCall")
Luxu.registerNuiServer("chat:leaveCall")
-- Notification and message handling event listeners
Luxu.listenForServerNuiEvent("notify:toast")
Luxu.listenForServerNuiEvent("chat:notify")
Luxu.listenForServerNuiEvent("chat:receiveMessage")
Luxu.listenForServerNuiEvent("chat:closed")

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
