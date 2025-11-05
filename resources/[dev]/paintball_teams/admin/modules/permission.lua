--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local config = require 'admin.config'

local permission = {}

---@param src number
---@return boolean
function permission.IsPlayerAdmin(src)
    if not src then return false end -- protection ajoutée
    local identifiers = GetPlayerIdentifiers(src)
    for _, id in ipairs(identifiers) do
        if string.sub(id, 1, 8) == "license:" then
            for _, allowed in ipairs(config.AdminConfig.AllowedCFX) do
                if id == allowed then
                    return true
                end
            end
        end
    end
    return false
end


-- Export externe (si jamais utilisé par d'autres ressources via exports)
exports('IsPlayerAdmin', permission.IsPlayerAdmin)

return permission

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
