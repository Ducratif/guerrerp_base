--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
function MenuMain()
    RageUI.Checkbox("Activer le mode modération", nil, adminStaffmode, {}, {
        onSelected = function(Index)
            adminStaffmode = Index
        end,
        onChecked = function()
            functionBoolRefresh()
            YveltStaffMode = true
            TriggerServerEvent('YveltAdmin:ChangeStaffMode', 'on')
            YveltHelper:onStaffModeON()
        end,
        onUnChecked = function()
            YveltHelper:onStaffModeOFF()
            if noclipActive then
                ExecuteCommand('YveltNoclip')
            end
            YveltStaffMode = false
            isNameShown = false
            TriggerServerEvent('YveltAdmin:ChangeStaffMode', 'off')
            adminPseudo = false
            boolPseudo = false
            for i, v in pairs(YVELT.GamerTags) do
                RemoveMpGamerTag(v.tags)
            end
            YVELT.GamerTags = {};
            SetEntityVisible(PlayerPedId(), true)
            boolHud = false
            boolInvincible = false
            boolSuperjump = false
            boolCoords = false
            boolSupersprint = false
        end
    })
    if YVELT.Players ~= nil and YVELT.PlayersStaff ~= nil then
        RageUI.Separator('Joueur(s) en ligne : '..YveltConfig.ColorMenu..''..#YVELT.Players..' ~s~| Staff(s) en ligne : '..YveltConfig.ColorMenu..''..#YVELT.PlayersStaff)
    else
        RageUI.Separator('Joueur(s) en ligne : '..YveltConfig.ColorMenu..'/ ~s~| Staff(s) en ligne : '..YveltConfig.ColorMenu..'/')
    end
    if adminStaffmode then
        Separator('Gestion administratif')
        if YveltHelper:getAcces(player, 'subReports') then
            RageUI.Button('Liste des reports '..c..'('..ReportsInfos.Waiting..')', nil, {RightLabel = YveltConfig.RightLabel}, true, {
                onSelected = function()
                    Callback.triggerServerCallback('Yvelt:getReportList', function(table)
                        Reports = table
                        ReportsInfos.Waiting = 0
                        ReportsInfos.Taked = 0
                        for k, v in pairs(Reports) do
                            if v.state == 'waiting' then
                                ReportsInfos.Waiting = ReportsInfos.Waiting + 1
                            elseif v.state == 'taked' then
                                ReportsInfos.Taked = ReportsInfos.Taked + 1
                            end
                        end
                    end)
                end
            }, adminReports)
        else
            RageUI.Button('Liste des reports '..c..'('..ReportsInfos.Waiting..')', nil, {}, false, {})
        end
        if YveltHelper:getAcces(player, 'subPlayers') then
            RageUI.Button('Liste des joueurs', nil, {RightLabel = YveltConfig.RightLabel}, true, {
                onSelected = function()
                    Callback.triggerServerCallback('YveltAdmin:retrievePlayers', function(players)
                        PlayersList = players
                    end)
                end
            }, adminPlayers)
        else
            RageUI.Button('Liste des joueurs', nil, {}, false, {})
        end
        if YveltHelper:getAcces(player, 'subPersonnel') then
            RageUI.Button('Gestion personnel', nil, { RightLabel = YveltConfig.RightLabel }, true, {}, adminPerso)
        else
            RageUI.Button('Gestion personnel', nil, {}, false, {})
        end
        if YveltHelper:getAcces(player, 'subVehicle') then
            RageUI.Button('Gestion vehicule(s)', nil, { RightLabel = YveltConfig.RightLabel }, true, {}, adminVehicle)
        else
            RageUI.Button('Gestion vehicule(s)', nil, {}, false, {})
        end
        
        if player.rank == 'owner' then
            RageUI.Button('Gérer les ranks', nil, { RightLabel = YveltConfig.RightLabel }, true, {
                onSelected = function()
                    Callback.triggerServerCallback('YveltAdmin:getRanksList', function(ranks)
                        RanksList = ranks
                    end)
                end
            }, adminRanks)
        else
            RageUI.Button('Gérer les ranks', nil, {}, false, {})
        end
    end
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
