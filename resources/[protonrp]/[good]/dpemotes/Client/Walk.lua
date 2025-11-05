--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
function WalkMenuStart(name)
	RequestWalking(name)
	SetPedMovementClipset(PlayerPedId(), name, 0.2)
	RemoveAnimSet(name)
end

function RequestWalking(set)
	RequestAnimSet(set)

	while not HasAnimSetLoaded(set) do
		Citizen.Wait(1)
	end
end

function WalksOnCommand(source, args, raw)
	local WalksCommand = ""

	for a in pairsByKeys(DP.Walks) do
		WalksCommand = WalksCommand .. "" .. string.lower(a) .. ", "
	end

	EmoteChatMessage(WalksCommand)
	EmoteChatMessage("To reset do /walk reset")
end

function WalkCommandStart(source, args, raw)
	local name = firstToUpper(args[1])

	if name == "Reset" then
		ResetPedMovementClipset(PlayerPedId(), 0.0)
		return
	end

	local name2 = table.unpack(DP.Walks[name])

	if name2 ~= nil then
		WalkMenuStart(name2)
	else
		EmoteChatMessage("'" .. name .. "' is not a valid walk")
	end
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
