--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

local function ShowNotification(text)
	TriggerEvent('chat:addMessage', {
		template = '<div style = "text-stroke: 0.1vw solid #000;"><span style="color:#fff">(( {0} ))</span></div>', 
		args = { text }
	})
end

RegisterNetEvent('kurlie_chat:chat', function(playerId, title, message, color, needIntoVehicle)
    local can = false
    if IsPedInAnyVehicle(PlayerPedId()) or needIntoVehicle == nil then 
        can = true
    else
        ShowNotification('Vous n\'êtes ^1pas^7 dans un véhicule.')
    end

    if can then
        local source = PlayerId()
        local target = GetPlayerFromServerId(playerId)

        local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
        local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

        if (target == source) then
            TriggerEvent('chat:addMessage',{
                template = '<div style = "text-stroke: 0.1vw solid #000;color: rgb('.. color .. ')">{0} <span style="">{1}</span></div>', 
                args = { title, message }
            })
        elseif (GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20) then
            TriggerEvent('chat:addMessage',{
                template = '<div style = "text-stroke: 0.1vw solid #000;color: rgb('.. color .. ')">{0} <span style="">{1}</span></div>', 
                args = { title, message }
            })
        end
    end
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/me', "Donner un contexte à la scène", { { name = "action", help = "Qu'exprimerait votre personnage?" } })
    TriggerEvent('chat:addSuggestion', '/pme', "un /me qui apparaît sur ta personne", { { name = "action", help = "Qu'exprimerait votre personnage?" } })
    TriggerEvent('chat:addSuggestion', '/do', "Faire quelque chose de physique", { { name = "details", help = "Que verraient les autres?" } })
    TriggerEvent('chat:addSuggestion', '/ooc', "Envoyer un message hors caractère", { { name = "message", help = "Tapez votre message OOC ici." } })
    TriggerEvent('chat:addSuggestion', '/pm', "[ID] puis Message", { { name = "message", help = "Tapez votre message" } })
    TriggerEvent('chat:addSuggestion', '/policeonly', "Seule la police peut annoncer", { { name = "message", help = "Tapez votre message" } })
    TriggerEvent('chat:addSuggestion', '/emsonly', "Seule les EMS peut annoncer", { { name = "message", help = "Tapez votre message" } })
    TriggerEvent('chat:addSuggestion', '/report', "Joueur que vous signalez: Nom, ID, raison:", { { name = "message", help = "Tapez votre message" } })
end)

local LocalConfig = {
    commands = {
        'me',
        'do',
        'ooc'
    }
}

AddEventHandler('onResourceStop', function(resource)
    if (resource == GetCurrentResourceName()) then
        for k,v in pairs(LocalConfig.commands) do
            TriggerEvent('chat:removeSuggestion', '/' .. v)
        end
    end
end)

Commands = {
	'cls',
	'clsall',
	'clear',
	'clearall'
}

for k,v in pairs(Commands) do
	RegisterCommand(v, function(source, args)
        TriggerEvent('chat:clear')
	end)
end

local font = 0 
local time = 1350 
local msgQueue = {}

RegisterNetEvent('kurlie:3dbodytext')
AddEventHandler('kurlie:3dbodytext', function(text, color, source)
    BodyText(GetPlayerFromServerId(source), text, color)
end)

function BodyText(mePlayer, text, color)
	local timer = 0
	if msgQueue[mePlayer] == nil then
		msgQueue[mePlayer] = {}
    end
	table.insert(msgQueue[mePlayer], { txt = text , c= color, tim = 0 })
    while tablelength(msgQueue[mePlayer]) > 0 do
        Wait(0)
        timer = timer + 1
		local coords = GetEntityCoords(GetPlayerPed(mePlayer), false)
		local lineNumber = 1
		for k, v in pairs(msgQueue[mePlayer]) do
			DrawText3D({x = coords.x, y = coords.y, z = coords.z+lineNumber}, v.txt, v.c)
			lineNumber = lineNumber + 0.12
			if(v.tim > time)then
				msgQueue[mePlayer][k] = nil
			else
				v.tim= v.tim + 1
			end
		end
    end
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function DrawText3D(coords, text, color)
    if not coords or not coords.x or not coords.y or not coords.z then return end

    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    if not onScreen then return end

    local camCoords = GetGameplayCamCoord()
    local dist = #(camCoords - vector3(coords.x, coords.y, coords.z))
    
    local scale = (1 / dist) * (1 / GetGameplayCamFov()) * 100
    local font = 0 -- Default font

    SetTextScale(0.0, 0.55 * scale)
    SetTextFont(font)
    SetTextProportional(1)
    SetTextColour(color.r or 255, color.g or 255, color.b or 255, color.alpha or 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    EndTextCommandDisplayText(_x, _y)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
