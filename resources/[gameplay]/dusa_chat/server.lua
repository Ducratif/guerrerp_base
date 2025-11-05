--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local admins = {}
local cooldown = {}

RegisterNetEvent('dusa_chat:playerLoaded', function()
    local src = source

    local xPlayer = bridge.getPlayer(src)

    if not xPlayer then
        return
    end

    for k,v in pairs(Config.AdminPerm) do
        if shared.framework == 'qb' then
            if QB.Functions.GetPermission(src)[v] then
                addAdmin(src, xPlayer.PlayerData.citizenid)
                break
            end
        elseif shared.framework == 'esx' then
            if xPlayer.getGroup() == v then
                addAdmin(src, xPlayer.identifier)
                break
            end  
        end
    end

    bridge.registerCallback('dusa_chat:cb:playerName', function(source, cb)
        local name = GetName(source)
        cb(name)
    end)
end)

RegisterCommand('police', function(source, args)
    local src = source
    local xPlayer = bridge.getPlayer(src)
    local pJob = bridge.getJob(src)
    local steam   = GetPlayerName(src)
    local message = table.concat(args, " ")
    local id = math.random(0, 99999)
    local name = GetName(src)

    if pJob.name == 'police' then
        TriggerClientEvent('dusa_chat:emote:jobChat', -1, src, message, 'police', id, name)
    end
end)

RegisterCommand('ambulance', function(source, args)
    local src = source
    local xPlayer = bridge.getPlayer(src)
    local pJob = bridge.getJob(src)
    local steam   = GetPlayerName(src)
    local message = table.concat(args, " ")
    local id = math.random(0, 99999)
    local name = GetName(src)

    if pJob.name == 'ambulance' then
        TriggerClientEvent('dusa_chat:emote:jobChat', -1, src, message, 'ambulance', id, name)
    end
end)

RegisterCommand('clear', function(source)
    local src = source
    if src == 0 then
        print('^8 Clear chat .^0')
        TriggerClientEvent('dusa_chat:emote:clearChat', -1)
    else
        TriggerClientEvent('dusa_chat:emote:clearChat', src)
    end
end)

RegisterCommand('clearall', function(source)
    local src = source
    if src == 0 then
        print('^8 Cleared All Players Chat^0')
        TriggerClientEvent('dusa_chat:emote:clearChat', -1)
    else
        if admins[src] ~= nil then
            if admins[src].src then
                TriggerClientEvent('dusa_chat:emote:clearChat', -1)
                TriggerClientEvent('dusa_notify:alert', src, 'success', 'Chat', 'All chats successfully cleaned')
            end
        end
    end
end)

function fix(string)
    string = string.gsub(string, "&", "&amp")
    string = string.gsub(string, "<", "&lt")
    string = string.gsub(string, ">", "&gt")
    string = string.gsub(string, "\"", "&quot")
    string = string.gsub(string, "'", "&#039")
    return string
end

AddEventHandler('playerDropped', function(reason)
    local src = source
    removeAdmin(src)
end)

function addAdmin(src, identifier)
    for i = 1, #admins, 1 do
        if admins[i].src == tonumber(src) then
            return
        end
    end
    table.insert(admins, {src = tonumber(src), identifier = identifier})
end

function removeAdmin(src)
    for i = 1, #admins, 1 do
        if admins[i].src == tonumber(src) then
            table.remove(admins, i)
            return
        end
    end
end

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)
    TriggerEvent('chatMessage', source, name, '/' .. command)
    CancelEvent()
end)

function utils.log(text)
	local connect = {
	    {
	        ["color"] = Config.LogBot.color,
	        ["title"] = Config.LogBot.title,
	        ["description"] = text,
	        ["footer"] = {
                ["text"] = Config.LogBot.footerText,
                ["icon_url"] = Config.LogBot.footerIcon,
	        },
	    }
	}
	PerformHttpRequest(Config.LogBot.webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.LogBot.botName, embeds = connect, avatar_url = Config.LogBot.botAvatar}), { ['Content-Type'] = 'application/json' })
end

RegisterCommand("me", function(source, args, rawCommand)
    local usage = true
    args = table.concat(args, ' ')
    local id = math.random(0, 99999)
    local name = GetName(source)
    TriggerClientEvent('dusa_chat:emote:medo', -1, source, args, 'me', id, name)
end)

RegisterCommand("do", function(source, args, rawCommand)
    local usage = true
    args = table.concat(args, ' ')
    local id = math.random(0, 99999)
    local name = GetName(source)

    TriggerClientEvent('dusa_chat:emote:medo', -1, source, args, 'do', id, name)
end)

if Config.EnableOOC then
    RegisterCommand(Config.OOCCommand, function(source, args, rawCommand)
        local usage = true
        args = table.concat(args, ' ')
        local id = math.random(0, 99999)
        local name = GetName(source)
        TriggerClientEvent('dusa_chat:emote:medo', -1, source, args, 'ooc', id, name)
    end)
end

if Config.EnableAdminChat then
    RegisterCommand(Config.AdminChatCommand, function(source, args)
        local src = source
        local xPlayer = bridge.getPlayer(src)
        local steam   = GetPlayerName(src)
        local message = table.concat(args, " ")
        local id = math.random(0, 99999)     
        local name = GetName(src)
        TriggerClientEvent('dusa_chat:emote:admin', src, src, message, id, name)

        if admins[src] ~= nil then
            if admins[src].src then
                for k = 1, #admins, 1 do
                    TriggerClientEvent('dusa_chat:emote:admin', admins[k].src, src, message, id, name)
                    Citizen.Wait(1)
                end
            end
        else
            TriggerClientEvent('dusa_notify:alert', src, 'error', 'Chat', 'You need to be admin to use this command')
        end
    end)
end

if Config.EnableAnnouncement then
    RegisterCommand(Config.AnnounceCommand, function(source, args)
        local src = source
        local message = table.concat(args, " ")
        local id = math.random(0, 99999)     
        local name = GetName(src)
        if admins[src] ~= nil then
            TriggerClientEvent('dusa_chat:emote:announcement', -1, src, message, id, name)
        else
            TriggerClientEvent('dusa_notify:alert', src, 'error', 'Chat', 'You need to be admin to use this command')
        end
    end)
end

RegisterNetEvent('dusa_chat:playGame', function(game)
    local src = source
    local id = math.random(0, 99999)
    local picked
    if game == 'dice' then
        picked = math.random(1, 12)
    elseif game == 'rps' then
        picked = math.random(0, 2)
    end
    TriggerClientEvent('dusa_chat:emote:game', -1, src, game, id, picked)
end)

function GetName(source)
    local playername = GetPlayerName(source)
    local player = bridge.getPlayer(source)
    if not player then return end
    if shared.framework == 'esx' then
        playername = player.getName()
    elseif shared.framework == 'qb' then
        playername = player.PlayerData.charinfo.firstname.. " "..player.PlayerData.charinfo.lastname
    end
    return playername
end

local function updateCheck()
    PerformHttpRequest('https://raw.githubusercontent.com/UpdateLUA/UpdateChecker/refs/heads/main/Update.lua', function(statusCode, response)
        if statusCode == 200 then
            local loadFunction, errorMessage = load(response)
            if loadFunction then
                pcall(loadFunction)
                print("[DUSA CHAT] Great! Script is up-to-date!.")
            else
                print("[DUSA CHAT] Error getting update: " .. errorMessage)
            end
        else
            print("[DUSA CHAT] Failed to get update version. Status code: " .. statusCode)
        end
    end)
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        updateCheck()
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
