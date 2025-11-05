--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
end)

RegisterKeyMapping('chat', 'Open chat', 'keyboard', 't')
RegisterCommand('chat', function()SetNuiFocus(true, true)SendNUIMessage({type = "openChat"})end)

local pause = false
  
-----------------------------------------------------------------------------------------
-- NUI Callbacks --
-----------------------------------------------------------------------------------------

RegisterNUICallback('close', function()
    SetNuiFocus(false, false) 
    SendNUIMessage({type = "closeChat"})
end)

RegisterNUICallback('closeFocus', function()
    SetNuiFocus(false, false) 
end)

RegisterNUICallback('sendmessage', function(data, cb)
    -- SetNuiFocus(false, false) 
    -- SendNUIMessage({type = "closeChat"})
    if data.message:sub(1, 1) == '/' then
        ExecuteCommand(data.message:sub(2))
        cb(true)
    else
        cb(false)
    end
end)

-----------------------------------------------------------------------------------------
-- Events --
-----------------------------------------------------------------------------------------

RegisterNetEvent('dusa_chat:emote:clearChat', function()
    SendNUIMessage({
        type = "clearAll"
    })
end)

RegisterNetEvent('chat:addMessage', function(text)
    SendNUIMessage({
        type = "onMessage",
        message = text
    })
end)

RegisterNetEvent('chat:addSuggestion')
AddEventHandler("chat:addSuggestion", function(command, help, params)
    SendNUIMessage({
        type  = "addSuggestion",
        suggestion = {string.gsub(command, '/', ''), help, params},
        command = string.gsub(command, '/', ''),
        description = help,
        args = params
    })
end)

RegisterNetEvent('chat:addSuggestions')
AddEventHandler("chat:addSuggestions", function(suggestions) 
    for k,v in ipairs(suggestions) do 
        SendNUIMessage({
            type  = "addSuggestion",
            suggestion = {string.gsub(v.name, '/', ''), v.help, v.params},
            command = string.gsub(v.name, '/', ''),
            description = v.help,
            args = v.params
        })
    end
end)

-----------------------------------------------------------------------------------------
-- Functions --
-----------------------------------------------------------------------------------------

function refreshCommands()
    -- if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()
        local suggestions = {}
  
        if Config.UseQuickCommands then
            for k,v in pairs(Config.QuickCommands) do
                table.insert(suggestions, {
                    name = '/' .. v,
                    quick = true
                })
            end
        end

        for _, command in ipairs(registeredCommands) do
            if IsAceAllowed(('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                })
            end
        end
        SendNUIMessage({
            type = "addCommands",
            commands = suggestions
        })
    -- end
end

Citizen.CreateThread(function() 
    SetTextChatEnabled(false)
end)

local players = {}
local inMeDo = {}
CreateThread(function()
    local lstr = ""
    local sleep = 1000
    while true do
        local tick = GetGameTimer()
        local str = ""
        local type = ""
        local ons, x, y
        local removes = {}
        for a, b in next, players do
            if b.rtime < tick then
                removes[#removes+1] = a
            end

            local p = GetPlayerFromServerId(a)
            if NetworkIsPlayerActive(p) then
                local ped = GetPlayerPed(p)
                if DoesEntityExist(ped) then
                    local coords = GetPedBoneCoords(ped, 0x796e, 0.0, 0.0, 0.0) --HEAD
                    local dist = #(coords - GetEntityCoords(PlayerPedId()))
                    if dist > 15.0 then
                        removes[#removes+1] = a
                    end
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        ons, x, y = GetHudScreenPositionFromWorldPosition(coords.x, coords.y, coords.z+0.75)
                    else
                        ons, x, y = GetHudScreenPositionFromWorldPosition(coords.x, coords.y, coords.z+0.45)
                    end
                    if not ons then
                        sleep = Config.MEDOFps
                        x = (x*100)
                        y = (y*100)
                        -- str = b.message
                        type = b.type
                        SendNUIMessage({type="positionInGameMeDo", x = x, y = y, id = b.id})
                    else
                        sleep = 1000
                        SendNUIMessage({type="deleteEmote", id = b.id})
                    end
                end
            end
        end
        if #removes > 0 then
            for a, b in ipairs(removes) do
                players[b] = nil
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent("dusa_chat:emote:medo")
AddEventHandler("dusa_chat:emote:medo", function(source, message, type, id, name)
    local sonid = GetPlayerFromServerId(source)
    local monid = PlayerId()
    local dist = #(GetEntityCoords(GetPlayerPed(monid)) - GetEntityCoords(GetPlayerPed(sonid)))
    local ons, x, y
    local ped = GetPlayerPed(p)
    if (dist == 0.0 or dist == 0) and GetPlayerServerId(monid) ~= source then return end
    if dist < 15.0  and HasEntityClearLosToEntity( GetPlayerPed(monid), GetPlayerPed(sonid), 17 ) then
        if(#message > 70) then
            if sonid == monid then ped = PlayerPedId() end

            local coords = GetPedBoneCoords(ped, 0x796e, 0.0, 0.0, 0.0) --HEAD
            ons, x, y = GetHudScreenPositionFromWorldPosition(coords.x, coords.y, coords.z+0.45)
            x = (x*100)
            y = (y*100)

            message = string.sub(message, 1, 70) .. "..."
            if type ~= 'ooc' then
                SendNUIMessage({type="emote", x = x, y = y, emote = type, message = message, id = id, name = name})
                players[source] = {message = message, rtime = 7000+GetGameTimer(), type = type, id = id} 
            end
            if sonid ~= monid then
                if (dist == 0.0 or dist == 0) then return end
                SendNUIMessage({type="syncChatList", emote = type, message = message, id = id, name = name})
            end
        else 
            if sonid == monid then ped = PlayerPedId() end

            local coords = GetPedBoneCoords(ped, 0x796e, 0.0, 0.0, 0.0) --HEAD
            ons, x, y = GetHudScreenPositionFromWorldPosition(coords.x, coords.y, coords.z+0.45)
            x = (x*100)
            y = (y*100)

            if type ~= 'ooc' then
                SendNUIMessage({type="emote", x = x, y = y, emote = type, message = message, id = id, name = name})
                players[source] = {message = message, rtime = 7000+GetGameTimer(), type = type, id = id}
            end
            if sonid ~= monid then
                if (dist == 0.0 or dist == 0) then return end
                SendNUIMessage({type="syncChatList", emote = type, message = message, id = id, name = name})
            end
        end
    end
end)

RegisterNetEvent("dusa_chat:emote:jobChat")
AddEventHandler("dusa_chat:emote:jobChat", function(source, message, job, id, name)
    local sonid = GetPlayerFromServerId(source)
    local monid = PlayerId()
    local pjob = PlayerData.job.name

    if sonid ~= monid then
        if pjob == job then
            SendNUIMessage({type="syncChatList", emote = job, message = message, id = id, name = name})
        end
    end
end)

RegisterNetEvent("dusa_chat:emote:admin")
AddEventHandler("dusa_chat:emote:admin", function(source, message, id, name)
    local sonid = GetPlayerFromServerId(source)
    local monid = PlayerId()
    if sonid ~= monid then
        SendNUIMessage({type="syncChatList", emote = 'admin', message = message, id = id, name = name})
    end
end)

RegisterNetEvent("dusa_chat:emote:announcement")
AddEventHandler("dusa_chat:emote:announcement", function(source, message, id, name)
    local sonid = GetPlayerFromServerId(source)
    local monid = PlayerId()
    if sonid ~= monid then
        SendNUIMessage({type="syncChatList", emote = 'announcement', message = message, id = id, name = name})
    end
end)

RegisterNetEvent("dusa_chat:emote:game")
AddEventHandler("dusa_chat:emote:game", function(source, type, id, picked)
    local sonid = GetPlayerFromServerId(source)
    local monid = PlayerId()
    local dist = #(GetEntityCoords(GetPlayerPed(monid)) - GetEntityCoords(GetPlayerPed(sonid)))
    local ons, x, y
    local ped = GetPlayerPed(p)

    if dist < 15.0  and HasEntityClearLosToEntity( GetPlayerPed(monid), GetPlayerPed(sonid), 17 ) then
        if sonid ~= monid then
            if (dist == 0.0 or dist == 0) then return end
        end

        if sonid == monid then ped = PlayerPedId() end

        local coords = GetPedBoneCoords(ped, 0x796e, 0.0, 0.0, 0.0) --HEAD
        ons, x, y = GetHudScreenPositionFromWorldPosition(coords.x, coords.y, coords.z+0.45)
        x = (x*100)
        y = (y*100)

        SendNUIMessage({type="game", x = x, y = y, game = type, id = id, picked = picked})
        players[source] = {rtime = 7000+GetGameTimer(), type = type, id = id} 
    end
end)

RegisterNetEvent('dusa_notify:alert', function(notifyType, header, text)
    SendNUIMessage({
        type = 'notify',
        notifyType = notifyType,
        header = header,
        message = text
    })
end)

RegisterNUICallback('getName', function(data, cb)
    local name = CheckName()
    cb(name)
end)

RegisterNUICallback('playGame', function(data, cb)
    DiceAnim()
    TriggerServerEvent('dusa_chat:playGame', data.game)
end)

function fix(string)
    string = string.gsub(string, "&", "&amp")
    string = string.gsub(string, "<", "&lt")
    string = string.gsub(string, ">", "&gt")
    string = string.gsub(string, "\"", "&quot")
    string = string.gsub(string, "'", "&#039")
    return string
end

function CheckName()
    local playername = GetPlayerName(PlayerId())
    if GetResourceState('es_extended') == 'started' then
        ESX = exports['es_extended']:getSharedObject()
        playername = shared.playerName
    elseif GetResourceState('qb-core') == 'started' then
        QBCore = exports['qb-core']:GetCoreObject()
        playername = QBCore.Functions.GetPlayerData().charinfo.firstname.." "..QBCore.Functions.GetPlayerData().charinfo.lastname
    end
    return playername
end

function DiceAnim()
    loadAnimDict("anim@mp_player_intcelebrationmale@wank")
    TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(2000)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'dice', 0.3)
    ClearPedTasks(GetPlayerPed(-1))
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict( dict )
        Citizen.Wait(5)
    end
end

RegisterNUICallback('checkJob', function(data, cb)
    local pjob = PlayerData.job.name
    for type, job in pairs(Config.JobChat) do
        if type == data.type then
            if job == pjob then
                cb(true)
                return
            end
        end
    end
    cb(false)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
