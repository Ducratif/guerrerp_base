--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
---@alias NotifyType 'info' | 'success' | 'warning'  | 'error'
---@alias NotifyData { title: string, description: string, duration?: number, type?: NotifyType }

local defaultType = "info"
local playSound = true
local defaultDuration = 3000


---@param title string
---@param description string
---@param duration? number
---@param notifyType? NotifyType
local function notify(title, description, duration, notifyType)
      duration = duration or defaultDuration
      type = type or defaultType
      if GetResourceState('okokNotify') == 'started' then
            exports['okokNotify']:Alert(title, description, duration, type, playSound)
      elseif GetResourceState('mythic_notify') == 'started' then
            if notifyType ~= "error" and notifyType ~= "success" then
                  ---@diagnostic disable-next-line: cast-local-type
                  notifyType = "inform"
            end
            exports['mythic_notify']:DoHudText(notifyType, title)
      elseif GetResourceState('ox_lib') == 'started' then
            if notifyType == "info" then
                  ---@diagnostic disable-next-line: cast-local-type
                  notifyType = "inform"
            end
            exports.ox_lib:notify({
                  title = title,
                  description = description,
                  duration = duration,
                  type = type
            })
      end
end

return { notify = notify }

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
