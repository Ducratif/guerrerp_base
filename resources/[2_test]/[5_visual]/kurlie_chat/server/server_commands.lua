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

local players = {}

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    players[playerId] = xPlayer
end)

AddEventHandler('esx:playerDropped', function(playerId)
    players[playerId] = nil
end)

AddEventHandler('qbcore:playerLoaded', function(playerId, playerData)
    players[playerId] = playerData
end)

AddEventHandler('qbcore:playerDropped', function(playerId)
    players[playerId] = nil
end)

local function ShowNotification(source, text)
    if isESX then
        if players[source] then
            players[source].triggerEvent('chat:addMessage', {
                template = '<div style="text-stroke: 0.1vw solid #000;"><span style="color:#fff">( {0} )</span></div>', 
                args = { text }
            })
        else
            print('Player with source ' .. tostring(source) .. ' not found in players table.')
        end
    elseif isQBCore then
        local player = QBCore.Functions.GetPlayer(source)
        if player then
            player.Functions.Notify(text)
        else
            print('Player with source ' .. tostring(source) .. ' not found.')
        end
    end
end

AddEventHandler('onResourceStart', function()
    if isESX then
        local xPlayers = ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            players[xPlayers[i]] = ESX.GetPlayerFromId(xPlayers[i])
        end
    elseif isQBCore then
        local qbPlayers = QBCore.Functions.GetQBPlayers()
        for _, playerId in pairs(qbPlayers) do
            players[playerId] = QBCore.Functions.GetPlayer(playerId)
        end
    end
end)

AddEventHandler('chatMessage', function(source, args, message)
	if (string.sub(message, 1, string.len('/')) ~= '/') then
		TriggerClientEvent('kurlie_chat:chat', -1, source, players[source].name .. ' says: ', message, '255,255,255')

		CancelEvent()
	end
end)

local function hasPermission(source, jobName, configFlag)
    if not Config[configFlag] then
        ShowNotification(source, 'Cette commande est actuellement désactivée.')
        return false
    end

    if isESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.job.name == jobName then
            return true
        else
            ShowNotification(source, 'Vous n\'avez pas l\'autorisation d\'utiliser cette commande.')
            return false
        end
    elseif isQBCore then
        local player = QBCore.Functions.GetPlayer(source)
        if player and player.PlayerData.job.name == jobName then
            return true
        else
            ShowNotification(source, 'Vous n\'avez pas l\'autorisation d\'utiliser cette commande.')
            return false
        end
    end
end

local reproducing = false

local timer = 5000

function ExecuteCommand(type, source, args, color)
	local args = table.concat(args, ' ')

	if (type == 'me') then 
		if players[source] then
			TriggerClientEvent('kurlie_chat:chat', -1, source, '[me] ' .. players[source].name, args, color)
		end
	elseif (type == 'pme') then 
		if players[source] then
			if not reproducing then
				reproducing = true
				DrawOnHead(source, args, { r = 160, g = 158, b = 182, alpha = 200 })


				TriggerClientEvent('kurlie_chat:chat', -1, source, '> ' .. players[source].name, args, color)

				SetTimeout(timer + 5, function()
					reproducing = false

					players[source].triggerEvent('chat:addMessage', {
						template = '<div style = "border-radius: .3vw;background-color: rgba(255, 100, 100, 0.200);color:red;padding: .15vw .2vw;margin-left: 0vw;border: .020vw solid rgba(255,100,100,0.4)">{0}: <span style="color: white">{1}</span></div>',
						args = { 'System', 'Commands too close together.' }
					})
				end)
			else
				ShowNotification(source, 'Attendez que la commande se termine')
			end
		end
	elseif (type == 'do') then 
		if players[source] then
			TriggerClientEvent('kurlie_chat:chat', -1, source, '[do] ' .. players[source].name, args, color)
		end
	end
end

if Config.AllowMe then
    RegisterCommand('me', function(source, args, rawCommand)
        if isESX then
            ExecuteCommand('me', source, args, Config.ColorMe)
        elseif isQBCore then
            ExecuteCommand('me', source, args, Config.ColorMe)
        end
    end)
end

if Config.AllowPme then
    RegisterCommand('pme', function(source, args, rawCommand)
        if isESX then
            ExecuteCommand('pme', source, args, Config.ColorPme)
        elseif isQBCore then
            ExecuteCommand('pme', source, args, Config.ColorPme)
        end
    end)
end


if Config.AllowDo then
    RegisterCommand('do', function(source, args, rawCommand)
        if isESX then
            ExecuteCommand('do', source, args, Config.ColorDo)
        elseif isQBCore then
            ExecuteCommand('do', source, args, Config.ColorDo)
        end
    end)
end

if Config.AllowPM then
    RegisterCommand('pm', function(source, args)
        local secondPlayer = tonumber(args[1])

        if players[secondPlayer] then
            table.remove(args, 1)

            if isESX then
                players[secondPlayer].triggerEvent('chat:addMessage', {
                    template = '<div style="text-stroke: 0.1vw solid #000;"><span style="color:#900C3F">({0}) sent message to ({1} {2}) saying:</span> <span style="color:#900C3F0ff">{3}</span></div>', 
                    args = { 
                        players[source].getName(), 
                        players[secondPlayer].source, 
                        players[secondPlayer].getName(),
                        table.concat(args, ' ')
                    }
                })
                players[source].triggerEvent('chat:addMessage', {
                    template = '<div style="text-stroke: 0.1vw solid #000;"><span style="color:#d3d3d3">({0}) sent message to ({1} {2}) saying:</span> <span style="color:#ffffff">{3}</span></div>',
                    args = { 
                        players[source].getName(),
                        players[secondPlayer].source,
                        players[secondPlayer].getName(),
                        table.concat(args, ' ')
                    }
                })
            elseif isQBCore then
                local player = QBCore.Functions.GetPlayer(source)
                local secondPlayerObj = QBCore.Functions.GetPlayer(secondPlayer)

                if secondPlayerObj then
                    secondPlayerObj.Functions.SendMessage({
                        title = player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname,
                        message = table.concat(args, ' ')
                    })
                    player.Functions.SendMessage({
                        title = secondPlayerObj.PlayerData.charinfo.firstname .. " " .. secondPlayerObj.PlayerData.charinfo.lastname,
                        message = table.concat(args, ' ')
                    })
                end
            end
        else
            ShowNotification(source, 'ID inconnu')
        end
    end)
end

if Config.AllowAdvertise then
    RegisterCommand('ad', function(source, args)
        local message = table.concat(args, ' ')

        if message == '' then
            ShowNotification(source, 'Vous devez fournir un message pour faire de la publicité.')
            return
        end

        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="text-stroke: 0.1vw solid #000;"><span style="color:#ff7f50"><strong>[Advertisement]</strong> <span style="color: #fff">{0}</span></span></div>',
            args = { message }
        })
    end)
end

if Config.AllowOOC then
    RegisterCommand('ooc', function(source, args)
        local message = table.concat(args, ' ')
        
        if message == '' then
            ShowNotification(source, 'Vous devez fournir un message pour le chat OOC.')
            return
        end
        
        local playerName = GetPlayerName(source)
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="text-stroke: 0.1vw solid #000;"><span style="color:#FF4500"><strong>[OOC] {0} ({1})</strong>: <span style="color: #fff">{2}</span></span></div>',
            args = { playerName, source, message }
        })
    end)
end


if Config.AllowFlipCoin then
    RegisterCommand('flipcoin', function(source, args)
        local random = math.random(1, 2)

        players[source].triggerEvent('chat:addMessage', {
            template = '<div style="text-stroke: 0.1vw solid #000;"><span style="color:#fff"><span style="color: rgb(171,161,181)">{0}<span style = "color: orange">{1}</span></span></div>', 
            args = { players[source].name .. ' flips a coin and lands it on ', random == 1 and 'Tails' or 'Heads' }
        })
    end)
end


if Config.AllowRoll20 then
    RegisterCommand('roll20', function(source, args)
        local random = math.random(1, 20)

        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="text-stroke: 0.1vw solid #000;"><span style="color:#fff"><span style="color: rgb(171,161,181)">{0}<span style = "color: yellow">{1}</span></span></div>', 
            args = { players[source].name .. ' rolls a ', random }
        })
    end)
end

RegisterCommand('policeonly', function(source, args)
    if not Config.AllowPoliceOnlyCommand then
        ShowNotification(source, 'Cette commande est actuellement désactivée.')
        return
    end

    local player = source
    local xPlayer = ESX and ESX.GetPlayerFromId(player) or QBCore.Functions.GetPlayer(player)

    if (xPlayer and xPlayer.job.name == Config.PoliceJobName) then
        local message = table.concat(args, ' ')
        if message == '' then
            ShowNotification(player, 'Vous devez fournir un message pour le chat de la police.')
            return
        end

        for _, playerId in ipairs(ESX and ESX.GetPlayers() or QBCore.Functions.GetPlayers()) do
            local xPlayer = ESX and ESX.GetPlayerFromId(playerId) or QBCore.Functions.GetPlayer(playerId)
            if xPlayer.job.name == Config.PoliceJobName then
                TriggerClientEvent('chat:addMessage', playerId, {
                    template = '<div style="text-stroke: 0.1vw solid #000;"><span style="color:#1E90FF"><strong>[Police] {0} ({1})</strong>: <span style="color: #fff">{2}</span></span></div>',
                    args = { xPlayer.getName(), player, message }
                })
            end
        end
    else
        ShowNotification(source, 'Vous n\'avez pas l\'autorisation d\'utiliser cette commande.')
    end
end)

-- EMS Only Chat Command
RegisterCommand('emsonly', function(source, args)
    if not Config.AllowEMSOnlyCommand then
        ShowNotification(source, 'Cette commande est actuellement désactivée.')
        return
    end

    local player = source
    local xPlayer = ESX and ESX.GetPlayerFromId(player) or QBCore.Functions.GetPlayer(player)

    if (xPlayer and xPlayer.job.name == Config.EMSJobName) then
        local message = table.concat(args, ' ')
        if message == '' then
            ShowNotification(player, 'Vous devez fournir un message pour le chat EMS.')
            return
        end

        for _, playerId in ipairs(ESX and ESX.GetPlayers() or QBCore.Functions.GetPlayers()) do
            local xPlayer = ESX and ESX.GetPlayerFromId(playerId) or QBCore.Functions.GetPlayer(playerId)
            if xPlayer.job.name == Config.EMSJobName then
                TriggerClientEvent('chat:addMessage', playerId, {
                    template = '<div style="text-stroke: 0.1vw solid #000;"><span style="color:#32CD32"><strong>[EMS] {0} ({1})</strong>: <span style="color: #fff">{2}</span></span></div>',
                    args = { xPlayer.getName(), player, message }
                })
            end
        end
    else
        ShowNotification(source, 'Vous n\'avez pas l\'autorisation d\'utiliser cette commande.')
    end
end)

-- Custom Job Announcements
RegisterCommand(Config.CommandCustom1, function(source, args)
    if hasPermission(source, Config.CustomJob1Name, 'AllowCustomJob1Command') then
        local message = table.concat(args, ' ')
        if message == '' then
            ShowNotification(source, 'Vous devez fournir un message pour l\'annonce d\'emploi.')
            return
        end

        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="text-stroke: 0.1vw solid #000;"><span style="color:#941AE6"><strong>[Job Announcement] {0}</strong>: <span style="color: #fff">{1}</span></span></div>',
            args = { ESX.GetPlayerFromId(source).getName(), message }
        })
    end
end)

RegisterCommand(Config.CommandCustom2, function(source, args)
    if hasPermission(source, Config.CustomJob2Name, 'AllowCustomJob2Command') then
        local message = table.concat(args, ' ')
        if message == '' then
            ShowNotification(source, 'Vous devez fournir un message pour l\'annonce d\'emploi.')
            return
        end

        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="text-stroke: 0.1vw solid #000;"><span style="color:#008000"><strong>[Job Announcement] {0}</strong>: <span style="color: #fff">{1}</span></span></div>',
            args = { ESX.GetPlayerFromId(source).getName(), message }
        })
    end
end)

RegisterCommand(Config.CommandCustom3, function(source, args)
    if hasPermission(source, Config.CustomJob3Name, 'AllowCustomJob3Command') then
        local message = table.concat(args, ' ')
        if message == '' then
            ShowNotification(source, 'Vous devez fournir un message pour l\'annonce d\'emploi.')
            return
        end

        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="text-stroke: 0.1vw solid #000;"><span style="color:#0DDDFD"><strong>[Job Announcement] {0}</strong>: <span style="color: #fff">{1}</span></span></div>',
            args = { ESX.GetPlayerFromId(source).getName(), message }
        })
    end
end)


if Config.Announcement then
    RegisterCommand("announce", function(source, args, rawCommand)
        local player = source
        local isAdmin = IsPlayerAceAllowed(player, "admin")  

        local xPlayer = ESX and ESX.GetPlayerFromId(player) or QBCore.Functions.GetPlayer(player)
        local isAdmin = (xPlayer and xPlayer.getGroup() == "admin") 

        if not isAdmin then
            TriggerClientEvent('chat:addMessage', player, { args = { "SYSTEM", "Vous n\'avez pas l\'autorisation d\'utiliser cette commande." }, color = { 255, 0, 0 } })
            return
        end

        local announcementMessage = table.concat(args, " ")

        if announcementMessage == "" then
            TriggerClientEvent('chat:addMessage', player, { args = { "SYSTEM", "Please provide a message for your announcement!" }, color = { 255, 0, 0 } })
            return
        end

        TriggerClientEvent('chat:addMessage', -1, { args = { "ANNOUNCEMENT", announcementMessage }, color = { 0, 255, 255 } })
    end, false)
end

if Config.AdminChat then
    RegisterCommand("adminchat", function(source, args, rawCommand)
        local player = source
        local xPlayer = ESX and ESX.GetPlayerFromId(player) or QBCore.Functions.GetPlayer(player)

        local function hasAdminRole(xPlayer)
            if not xPlayer then return false end
            local playerGroup = xPlayer.getGroup()
            for _, role in ipairs(Config.AdminRoles) do
                if playerGroup == role then
                    return true
                end
            end
            return false
        end

        if not hasAdminRole(xPlayer) then
            TriggerClientEvent('chat:addMessage', player, { args = { "SYSTEM", "Vous n\'avez pas l\'autorisation d\'utiliser cette commande." }, color = { 255, 0, 0 } })
            return
        end

        local adminMessage = table.concat(args, " ")

        if adminMessage == "" then
            TriggerClientEvent('chat:addMessage', player, { args = { "SYSTEM", "Veuillez fournir un message pour le chat administrateur !" }, color = { 255, 0, 0 } })
            return
        end

        for _, id in ipairs(GetPlayers()) do
            local xTarget = ESX and ESX.GetPlayerFromId(id) or QBCore.Functions.GetPlayer(id)
            if hasAdminRole(xTarget) then
                TriggerClientEvent('chat:addMessage', id, { args = { "ADMIN CHAT", adminMessage }, color = { 255, 165, 0 } })
            end
        end
    end, false)
end

function DrawOnHead(playerid, text, color)
	TriggerClientEvent('kurlie:3dbodytext', -1, text, color, playerid)
end

-- Report System

local discordWebhookURL = Config.ReportWebhook
local webhookImageURL = Config.WebhookImageURL

function Report(reportUrl, reportImage)
    local self = {}

    self.reportUrl = reportUrl
    self.reportImage = reportImage

    if not self.reportUrl then 
        return
    end

    self.send = function(playerId, reportMessage)
        local user = self.getPlayerServerInfo(playerId)
        local messageObj = self.messageBuilder(user, reportMessage)
        
        PerformHttpRequest(self.reportUrl, function(err, text, header) 
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
                    title = user.steamName .. ' a soumis un rapport',
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
                        url = self.reportImage
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

        if ESX then
            local xPlayer = ESX.GetPlayerFromId(playerId)
            if xPlayer then
                user.characterName = xPlayer.getName()
            end
        elseif QBCore then
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

RegisterCommand("report_debug", function(source, args, rawCommand)
    local reportMessage = table.concat(args, " ")

    if Config.ReportLog then
        if reportMessage == "" then
            ShowNotification(source, 'Veuillez fournir un message pour votre rapport !')
            return
        end

        if isESX then
            local report = Report(Config.ReportWebhook, Config.WebhookImageURL)
            report.send(source, reportMessage)
        elseif isQBCore then
            local report = Report(Config.ReportWebhook, Config.WebhookImageURL)
            report.send(source, reportMessage)
        end

        ShowNotification(source, "Votre rapport a été soumis avec succès !")
    end
end, false)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
