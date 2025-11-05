--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX, QBCore

if Config.Framework == 'esx' then
    if exports['es_extended'] then
        ESX = exports['es_extended']:getSharedObject()
    end
elseif Config.Framework == 'qbcore' then
    if exports['qb-core'] then
        QBCore = exports['qb-core']:GetCoreObject()
    end
end

local isESX = ESX ~= nil
local isQBCore = QBCore ~= nil

if not (isESX or isQBCore) then
    print("Neither ESX nor QBCore is initialized!")
end

RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

local discordWebhookURL = Config.Webhook
local webhookImageURL = Config.WebhookImageURL

function Webhook(webHookUrl, webHookImage)
    local self = {}

    self.webHookUrl = webHookUrl
    self.webHookImage = webHookImage

    if not self.webHookUrl then 
        return
    end

    self.send = function(playerId, reportMessage)
        local user = self.getPlayerServerInfo(playerId)
        local messageObj = self.messageBuilder(user, reportMessage)

        PerformHttpRequest(self.webHookUrl, function(err, text, header) 
            if err then
               -- print("Error sending report:", err)
            else
               -- print("Report sent successfully:", text)
            end
        end, 'POST', json.encode(messageObj), {
            ['Content-Type'] = 'application/json'
        })
    end

    self.messageBuilder = function(user, rawMessage)
        return {
            embeds = {
                {
                    title = user.steamName .. ' a envoyer un message',
                    description = '```' .. rawMessage .. '```',  
                    url = Config.WebhookImageURL,
                    color = 3666853, 

                    fields = {
                        {
                            name = 'Steam Name:',
                            value = user.steamName or 'None',
                            inline = true
                        },
                        {
                            name = 'Character Name:',
                            value = user.characterName or 'None',
                            inline = true
                        },
                        {
                            name = 'Server ID:',
                            value = user.serverId or 'None',
                            inline = true
                        },
                        {
                            name = 'Discord ID:',
                            value = user.discordId or 'None',
                            inline = true
                        }
                    },

                    thumbnail = {
                        url = self.webHookImage
                    },

                    author = {
                        name = user.steamName,
                    },

                    footer = {
                        text = 'Report System',
                    },

                    timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")  
                },
            }
        }
    end

    self.getPlayerServerInfo = function (playerId)
        local user = {
            steamName = "Unknown",
            characterName = "Unknown",
            serverId = tostring(playerId),  
            discordId = "Unknown"
        }
        user.steamName = GetPlayerName(playerId) or "Unknown"

        if isESX then
            local xPlayer = ESX.GetPlayerFromId(playerId)
            if xPlayer then
                user.characterName = xPlayer.getName()
            end
        elseif isQBCore then
            local xPlayer = QBCore.Functions.GetPlayer(playerId)
            if xPlayer then
                user.characterName = xPlayer.PlayerData.charinfo.firstname .. ' ' .. xPlayer.PlayerData.charinfo.lastname
            end
        else
            print("Neither ESX nor QBcore is initialized!")
        end

        for _, id in ipairs(GetPlayerIdentifiers(playerId)) do
            if string.sub(id, 1, 8) == 'discord:' then
                user.discordId = string.sub(id, 9) 
                break
            end
        end
    
        return user
    end    

    return self
end

local chatWebhook = Webhook(discordWebhookURL, webhookImageURL)

RegisterNetEvent('_chat:messageEntered')
AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    local playerId = source

    if Config.EnableChatWebhook then
        chatWebhook.send(playerId, message)
    else
        print('Chat Webhook désactiver')
    end
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)
    local cleanedCommand = command:sub(1, 1) == '/' and command:sub(2) or command

    CancelEvent()
end)

local function refreshCommands(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                })

                table.insert(suggestions, {
                    name = command.name,
                    help = ''
                })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end

AddEventHandler('chat:init', function()
    refreshCommands(source)
end)

AddEventHandler('onServerResourceStart', function(resName)
    Wait(500)

    for _, player in ipairs(GetPlayers()) do
        refreshCommands(player)
    end
end)

RegisterCommand('clear', function(source, args)
    TriggerEvent('chat:clear')
end, false)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
