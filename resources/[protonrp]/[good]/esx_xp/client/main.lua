--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
CurrentXP = 0
CurrentRank = 0
Leaderboard = nil
Players = {}
Player = nil
UIActive = true
Ready = false

local ESX = exports['es_extended']:getSharedObject()

Citizen.CreateThread(function()
    -- Attendre que le joueur soit bien chargé
    while not ESX.IsPlayerLoaded() do
        Citizen.Wait(10)
    end

    if not Ready then
        TriggerServerEvent("esx_xp:load")
    end
end)


------------------------------------------------------------
--                        CONTROLS                        --
------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        if IsControlJustReleased(0, Config.UIKey) then
            UIActive = not UIActive
            
            if UIActive then
                TriggerServerEvent("esx_xp:getPlayerData")
                SendNUIMessage({
                    xpm_show = true,
                    xbm_lb = Config.Leaderboard
                })                 
            else
                SendNUIMessage({
                    xpm_hide = true
                })                
            end
        elseif IsControlJustPressed(0, 174) then
            if UIActive then
                SendNUIMessage({
                    xpm_lb_prev = true
                })
            end
        elseif IsControlJustPressed(0, 175) then
            if UIActive then
                SendNUIMessage({
                    xpm_lb_next = true
                })
            end
        end

        Citizen.Wait(1)
    end
end)


------------------------------------------------------------
--                        COMMANDS                        --
------------------------------------------------------------
TriggerEvent('chat:addSuggestion', '/ESXP', 'Display your XP stats')

RegisterCommand('ESXP', function(source, args)
    Citizen.CreateThread(function()
        local xpToNext = ESXP_GetXPToNextRank()

        -- SHOW THE XP BAR
        SendNUIMessage({ xpm_display = true })        

        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"SYSTEM", _('cmd_current_xp', CurrentXP)}
        })
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"SYSTEM", _('cmd_current_lvl', CurrentRank)}
        })
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"SYSTEM", _('cmd_next_lvl', xpToNext, CurrentRank + 1)}
        })                
    end)
end)


------------------------------------------------------------
--                        GIFT                            --
------------------------------------------------------------

RegisterNUICallback('xpm_rankchange', function(data, cb)
    if data.rankUp then
        -- Préviens le serveur pour donner la récompense
        TriggerServerEvent("esx_xp:rankUpReward", data.current)
    end

    cb(data)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
