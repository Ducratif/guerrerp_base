--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local resourceName = 'qb-core'
if not GetResourceState(resourceName):find('start') then return end

SetTimeout(0, function()
    QB = exports[resourceName]:GetCoreObject()
    core = QB

    PlayerData = core.Functions.GetPlayerData()

    if PlayerData?.citizenid and LocalPlayer.state.isLoggedIn then end

    -- Handles state right when the player selects their character and location.
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        PlayerData = core.Functions.GetPlayerData()

        TriggerServerEvent("dusa_chat:playerLoaded")
    end)

    AddEventHandler('onClientResourceStart', function(resName)
        if (GetCurrentResourceName() ~= resName) then
            return
        end
        Wait(500)
        PlayerData = core.Functions.GetPlayerData()
        refreshCommands()
        TriggerServerEvent('dusa_chat:playerLoaded')
    end)

    shared.framework = 'qb'
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
