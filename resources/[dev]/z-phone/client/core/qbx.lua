--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if Config.Core == "QBX" then 
    xCore = {}
    local QBX = exports["qb-core"]:GetCoreObject()

    xCore.GetPlayerData = function()
        local ply = QBX.Functions.GetPlayerData()
        if not ply then return nil end
        return {
            citizenid = ply.citizenid
        }
    end

    xCore.Notify = function(msg, typ, time)
        TriggerEvent('chat:addMessage', {
            color = {0, 255, 0},
            multiline = false,
            args = {"PHONE", msg}
        })
    end

    xCore.HasItemByName = function(item)
        return QBX.Functions.HasItem(item)
    end

    xCore.GetClosestPlayer = function ()
        return QBX.Functions.GetClosestPlayer()
    end
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
