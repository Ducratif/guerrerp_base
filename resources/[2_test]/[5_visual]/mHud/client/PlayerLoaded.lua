--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local firstLoad = false

function LoadHUD()
    Wait(1000)
    WaitCore()
    WaitPlayer()
    nuiMessage("SET_GIFT_INFORMATIONS", {
        text = Config.Gift.text,
        time = Config.Gift.time,
        enable = Config.Gift.enable,
    })
    TriggerServerEvent('mHud:RequestPlaylists')
    TriggerServerEvent("mHud:StartGiftTimer")
    TriggerServerEvent("mHud:UpdatePlayersAmount")
    TriggerServerEvent("mHud:CheckPlayerStress")
    LoadPlayerInformations()
    nuiMessage("SET_HUD_LOADED")
    ShowHud()
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    LoadHUD()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    LoadHUD()
end)

CreateThread(function()
    Wait(2000)
    if not firstLoad then
        LoadHUD()
    end
end)

AddEventHandler("playerSpawned", function ()
    if not firstLoad then
        firstLoad = true
        DisplayRadar(false)
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
