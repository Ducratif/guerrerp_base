--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- client/utils/nui_shim.lua
local _RegisterNUICallback = RegisterNUICallback

RegisterNUICallback = function(name, handler)
  _RegisterNUICallback(name, function(data, cb)
    local replied = false
    local function safeReply(payload)
      replied = true
      if payload == nil then payload = {} end
      cb(payload)
    end
    local ok, err = pcall(handler, data, safeReply)
    if not ok then
      print(('[jg-mechanic] NUI handler crashed for "%s": %s'):format(name, tostring(err)))
    end
    if not replied then
      -- Toujours répondre pour éviter "Failed to fetch"
      safeReply({ ok = false, error = 'no-reply:'..name })
    end
  end)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
