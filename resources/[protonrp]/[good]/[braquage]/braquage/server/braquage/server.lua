--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]

local ESX = exports['es_extended']:getSharedObject()


local housesStates = {}

Citizen.CreateThread(function()
    for _,house in pairs(robberiesConfiguration.houses) do
        table.insert(housesStates, {state = true, robbedByID = nil})
    end
end)

RegisterNetEvent("ducratif_braquage:houseRobbed")
AddEventHandler("ducratif_braquage:houseRobbed",function(houseID)
    local _src = source
    housesStates[houseID].state = false
    housesStates[houseID].robbedByID = _src
    sendToDiscordWithSpecialURL("Cambriolages","**"..GetPlayerName(_src).."** cambriole la maison n°"..houseID.." ("..robberiesConfiguration.houses[houseID].name..") !",16711680,"TON_WEBHOOK_DUCRATIF")
    Citizen.SetTimeout((1000*60)*robberiesConfiguration.houseRobRegen, function()
        housesStates[houseID].state = true
        housesStates[houseID].robbedByID = nil
    end)
end)

RegisterNetEvent("ducratif_bijouterie:houseRobbed")
AddEventHandler("ducratif_bijouterie:houseRobbed",function(houseID)
    local _src = source
    housesStates[houseID].state = false
    housesStates[houseID].robbedByID = _src
    sendToDiscordWithSpecialURL("Cambriolages","**"..GetPlayerName(_src).."** cambriole la maison n°"..houseID.." ("..bijouterie.houses[houseID].name..") !",16711680,"TON_WEBHOOK_DUCRATIF")
    Citizen.SetTimeout((1000*60)*bijouterie.houseRobRegen, function()
        housesStates[houseID].state = true
        housesStates[houseID].robbedByID = nil
    end)
end)

RegisterNetEvent("ducratif_braquage:callThePolice")
AddEventHandler("ducratif_braquage:callThePolice", function(houseIndex)
    local authority = robberiesConfiguration.houses[houseIndex].authority
    local xPlayers = ESX.GetPlayers()
    print(authority)
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

        if xPlayer.job.name == 'police' then
            TriggerClientEvent("ducratif_braquage:initializePoliceBlip",xPlayers[i], houseIndex, robberiesConfiguration.houses[houseIndex].policeBlipDuration)
        end
    end
end)

RegisterNetEvent("ducratif_bijouterie:callThePolice")
AddEventHandler("ducratif_bijouterie:callThePolice", function(houseIndex)
    local authority = bijouterie.houses[houseIndex].authority
    local xPlayers = ESX.GetPlayers()
    print(authority)
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

        if xPlayer.job.name == 'police' then
            TriggerClientEvent("ducratif_braquage:initializePoliceBlipx",xPlayers[i], houseIndex, bijouterie.houses[houseIndex].policeBlipDuration)
        end
    end
end)



RegisterNetEvent("ducratif_braquage:reward") -- TODO SECURISER
AddEventHandler("ducratif_braquage:reward", function(reward)
    local _src = source
    sendToDiscordWithSpecialURL("Cambriolages","**"..GetPlayerName(_src).."** à reçu __"..reward.."__$ pour son cambriolage.",16744192,"TON_WEBHOOK_DUCRATIF")
end)

RegisterNetEvent("ducratif_bijouterie:reward") -- TODO SECURISER
AddEventHandler("ducratif_bijouterie:reward", function(reward)
    local _src = source
    sendToDiscordWithSpecialURL("Bijouterie","**"..GetPlayerName(_src).."** à reçu __"..reward.."__$ pour son cambriolage de bijouterie.",16744192,"TON_WEBHOOK_DUCRATIF")
end)

RegisterNetEvent("ducratif_bijouterie:money") -- TODO SECURISER
AddEventHandler("ducratif_bijouterie:money", function(reward)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    
    xPlayer.addAccountMoney('dirtycash', reward*12)
    TriggerClientEvent('esx:showNotification', xPlayer.source, "Félicitation vous avez reçu : ~r~"..reward.."$" )
end)
RegisterNetEvent("ducratif_braquage:money") -- TODO SECURISER
AddEventHandler("ducratif_braquage:money", function(reward)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    
    xPlayer.addAccountMoney('dirtycash', reward)
    TriggerClientEvent('esx:showNotification', xPlayer.source, "Félicitation vous avez reçu : ~r~"..reward.."$" )
end)

RegisterNetEvent("ducratif_braquage:getHousesStates")
AddEventHandler("ducratif_braquage:getHousesStates", function()
    local _src = source
    TriggerClientEvent("ducratif_braquage:getHousesStates", _src, housesStates)
end)

RegisterNetEvent("ducratif_braquage:getHousesStatess")
AddEventHandler("ducratif_braquage:getHousesStatess", function()
    local _src = source
    TriggerClientEvent("ducratif_braquage:getHousesStatess", _src, housesStates)
end)


function sendToDiscordWithSpecialURL (name,message,color,url)
    local DiscordWebHook = "TON_WEBHOOK_DUCRATIF"
  
  local embeds = {
      {
          ["title"]=message,
          ["type"]="rich",
          ["color"] =color,
          ["footer"]=  {
          ["text"]= "GuerreRP Logs Braquage By Ducratif",
         },
      }
  }
  
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
