--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]

lib.locale()

RegisterNetEvent('ato:societyboss:svopenBossMenu', function ()
    TriggerServerEvent('ato:societyboss:svopenBossMenu', ESX.PlayerData.job.name)
end)

Citizen.CreateThread(function()

    if Shared.resourceName ~= 'ato_bossmenu' then
        while true do
            print('[^3ato_bossmenu^7] [^1Error^7] ' .. locale('dont_change_name'))
            StopResource(Shared.resourceName)
            Wait(100)
        end
    elseif Shared.resourceName == 'ato_bossmenu' then
        print('[^3ato_bossmenu^7] [^2Success^7] ' .. locale('rsrc_started'))
    end

    if Shared.menuSystem ~= 'touch' then

            for i = 1, #Shared.society do
        
                    exports.ox_target:addBoxZone({
                        coords = Shared.society[i].coords,
                        size = vec3(3, 3, 3),
                        rotation = 45,
                        drawSprite = true,
                        options = {
                            {
                                event = 'ato:societyboss:svopenBossMenu',
                                icon = 'fa-solid fa-building', 
                                label = locale("management") .. Shared.society[i].label,
                                distance = 3,
                                groups = {[Shared.society[i].name] = Shared.society[i].bossGrade}
                            }
                        }
                    })
                
            end
        
    elseif Shared.menuSystem == 'touch' then

        for i = 1, #Shared.society do
        
            if ESX.PlayerData.job.grade == Shared.society[i].bossGrade and ESX.PlayerData.job.name == Shared.society[i].name then

                RegisterCommand("open_boss_menu", function()

                    TriggerServerEvent('ato:societyboss:svopenBossMenu', ESX.PlayerData.job.name)

                end, false)

                RegisterKeyMapping('open_boss_menu', 'Ouvrir le menu patron', 'keyboard', Shared.keyOpenBossMenu)

            end
            
        end

    end

end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
