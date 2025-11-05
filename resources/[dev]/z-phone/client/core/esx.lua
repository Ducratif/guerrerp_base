--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if Config.Core == "ESX" then
    xCore = {}
    local ESX = exports["es_extended"]:getSharedObject()
    local ox_inventory = exports.ox_inventory

    xCore.GetPlayerData = function()
        local ply = ESX.GetPlayerData()
        if not ply then return nil end
        return {
            --citizenid = ply.identifier
            citizenid = string.gsub(ply.identifier, "char%d+:", "")
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
        return ox_inventory:GetItemCount(item, nil, false) >= 1
    end

    xCore.GetClosestPlayer = function ()
        return ESX.Game.GetClosestPlayer()
    end
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
