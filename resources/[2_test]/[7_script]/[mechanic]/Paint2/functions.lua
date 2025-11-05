--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports['es_extended']:getSharedObject()

_ShowNotification = function(msg)
    lib.notify({
        title = msg,
    })
end

_ShowHelpNotification = function(msg)
    lib.showTextUI(msg)
end

_GetClosestVehicle = function(location)
    return ESX.Game.GetClosestVehicle(location)
end

_GetPlayerJobName = function()
    return ESX.GetPlayerData().job.name
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
