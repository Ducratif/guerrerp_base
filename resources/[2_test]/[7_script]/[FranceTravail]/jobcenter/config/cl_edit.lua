--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
function ShowNotification(message, notifyType)
    lib.notify({
        description = message,
        type = notifyType,
        position = 'top-right'
    })
end

RegisterNetEvent('lunar_jobcentre:showNotification')
AddEventHandler('lunar_jobcentre:showNotification', ShowNotification)

function ShowUI(text, icon)
    if icon == 0 then
        lib.showTextUI(text)
    else
        lib.showTextUI(text, {
            icon = icon
        })
    end
end

function HideUI()
    lib.hideTextUI()
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
