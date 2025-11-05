--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
function GetPrivs(source)
	return {
		canServer = IsPlayerAceAllowed(source, 'command.run'),
		canClient = IsPlayerAceAllowed(source, 'command.crun'),
		canSelf = IsPlayerAceAllowed(source, 'runcode.self'),
	}
end

RegisterCommand('run', function(source, args, rawCommand)
	local res, err = RunCode('lua', rawCommand:sub(4))
end, true)

RegisterCommand('crun', function(source, args, rawCommand)
	if not source then
		return
	end

	TriggerClientEvent('runcode:gotSnippet', source, -1, 'lua', rawCommand:sub(5))
end, true)

RegisterCommand('runcode', function(source, args, rawCommand)
	if not source then
		return
	end

	local df = LoadResourceFile(GetCurrentResourceName(), 'data.json')
	local saveData = {}

	if df then
		saveData = json.decode(df)
	end

	local p = GetPrivs(source)

	if not p.canServer and not p.canClient and not p.canSelf then
		return
	end

	p.saveData = saveData

	TriggerClientEvent('runcode:openUi', source, p)
end, true)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
