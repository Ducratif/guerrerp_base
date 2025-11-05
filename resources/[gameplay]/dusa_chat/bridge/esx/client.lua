--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local resourceName = 'es_extended'

if not GetResourceState(resourceName):find('start') then return end

SetTimeout(0, function()
    ESX = exports[resourceName]:getSharedObject()
    core = ESX

    PlayerData = core.GetPlayerData()
    -- Handles state right when the player selects their character and location.
    RegisterNetEvent('esx:playerLoaded', function(xPlayer)
        PlayerData = ESX.GetPlayerData()

        refreshCommands()
        TriggerServerEvent("dusa_chat:playerLoaded")
        core.TriggerServerCallback('dusa_chat:cb:playerName', function(name)
            shared.playerName = name
        end)
    end)

    shared.framework = 'esx'
end)

AddEventHandler('onResourceStart', function(resName)
    if (GetCurrentResourceName() ~= resName) then
        return
    end
    Wait(500)

    PlayerData = ESX.GetPlayerData()
    refreshCommands()
    TriggerServerEvent('dusa_chat:playerLoaded')
    ESX.TriggerServerCallback('dusa_chat:cb:playerName', function(name)
        shared.playerName = name
    end)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
