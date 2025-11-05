--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports["es_extended"]:getSharedObject()
moneytruck = false

local CopsConnected = 0

function CountCops()
    local xPlayers = ESX.GetPlayers()
    CopsConnected = 0

    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        

        if xPlayer and xPlayer.job then
            if xPlayer.job.name == 'police' then
                CopsConnected = CopsConnected + 1
            end
        end
    end
    
    
    -- Call CountCops again after 120 seconds
    SetTimeout(120 * 1000, CountCops)
end

-- Start the initial call
CountCops()

function sendToDiscord(webhookURL, title, description, color)
    local discordMessage = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] = description,
            ["footer"] = {
                ["text"] = os.date("%Y-%m-%d %H:%M:%S"),
            }
        }
    }

    PerformHttpRequest(webhookURL, function(err, text, headers)

    end, 'POST', json.encode({username = "Vole Camion", embeds = discordMessage}), { ['Content-Type'] = 'application/json' })
end


RegisterNetEvent('gruppe6heist:Itemcheck')
AddEventHandler('gruppe6heist:Itemcheck', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local isRobbing = true
    local item = xPlayer.getInventoryItem(Config.Item)
    local discordWebhook = Config.Webhook

    if not moneytruck then
        if isRobbing and item.count > 0 and amount > 0 then
            CountCops()
            if CopsConnected >= Config.Copsneeded then
                moneytruck = true

                if Config.Remove then
                    xPlayer.removeInventoryItem(Config.Item, 1)
                end

                local playerPed = GetPlayerPed(source)
                local playerCoords = GetEntityCoords(playerPed)

                local _source = source
                local Players = ESX.GetPlayers()
                local xPlayer = ESX.GetPlayerFromId(_source)

                -- Notify all police players with the robber's coordinates
                for _, playerId in ipairs(Players) do
                    local policePlayer = ESX.GetPlayerFromId(playerId)
                    if policePlayer.job.name == "police" then
                        -- Send the coordinates to the police clients
                        TriggerClientEvent("gruppe6heist:Blip", playerId, playerCoords.x, playerCoords.y, playerCoords.z)

                        local message = '10-68: Vol de camion du Groupe 6. Toutes les unités interviennent.'
                        exports['pv-pager']:SendPagerNotification('police', message)
                    end
                end

                TriggerClientEvent('gruppe6heist:crowbar', source)

                local identifier = GetPlayerIdentifiers(source)[1]
                local name = GetPlayerName(source)
                local charName = xPlayer.getName()
                local discordID = nil

                -- Loop through player identifiers to find Discord ID
                for _, id in pairs(GetPlayerIdentifiers(source)) do
                    if string.sub(id, 1, string.len("discord:")) == "discord:" then
                        discordID = string.sub(id, 9) -- Extract Discord ID without 'discord:'
                        break
                    end
                end

                -- Build the message for Discord
                local discordTitle = "Vol du groupe 6 en cours"
                local discordDescription = string.format(
                    "**Nom du joueur:** %s\n**Character Name:** %s\n**Server ID:** %d\n**Steam ID:** %s\n**Discord ID:** %s\n\nJ'ai commencé un vol du Gruppe6 !",
                    name,
                    charName,
                    source,
                    identifier,
                    discordID or "N/A"
                )
                local discordColor = 16711680  -- Red color for alert

                -- Send Discord webhook notification
                sendToDiscord(discordWebhook, discordTitle, discordDescription, discordColor)
            else
                isRobbing = false
                TriggerClientEvent('esx:notification', '~r~Pas assez de policiers', source, r)
            end
        else
            isRobbing = false
            TriggerClientEvent('esx:notification', 'Vous n\'avez pas les bons outils.', source, r)
        end
    else
        TriggerClientEvent('esx:notification', 'Quelqu\'un est déjà en train de voler un autre camion.', source, r)
    end
end)


RobbedPlates = {}

RegisterNetEvent('gruppe6heist:UpdatePlates')
AddEventHandler('gruppe6heist:UpdatePlates', function(UpdatedTable, Plate)
    local xPlayers = ESX.GetPlayers()
    RobbedPlates = UpdatedTable
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer ~= nil then
            UpdatedTable[Plate] = true
            TriggerClientEvent('gruppe6heist:newTable', xPlayers[i], UpdatedTable)
        end
    end
    print('Plaques mises à jour pour le serveur')
end)

function RandomItem()
	return Config.Items[math.random(#Config.Items)]
end

function RandomNumber()
	return math.random(1,3)
end

RegisterNetEvent('gruppe6heist:Payout')
AddEventHandler('gruppe6heist:Payout', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local Robbing = false
    local timer = 0
    local chance = math.random(1, 100)

    Robbing = true

    -- Determine payout based on chance
    local totalChance = 0
    for _, payout in ipairs(Config.Payouts) do
        totalChance = totalChance + payout.chance
        if chance <= totalChance then
            for i, item in ipairs(payout.items) do
                xPlayer.addInventoryItem(item, payout.amount[i])
            end
            break
        end
    end

    -- Begin the robbing process
    while Robbing do
        timer = timer + 4  -- Increment timer by 4 seconds (4000 ms wait time)
        Citizen.Wait(1000)  -- Delay between receiving items/money

        xPlayer.addAccountMoney('black_money', math.random(Config.MoneyPayout.min, Config.MoneyPayout.max))

        if timer >= Config.Timer then
            Robbing = false
            break
        end
    end
end)

RegisterNetEvent('gruppe6heist:moneytruck_false')
AddEventHandler('gruppe6heist:moneytruck_false', function()
    if moneytruck then
        moneytruck = false
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
