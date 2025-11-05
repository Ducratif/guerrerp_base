--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterNetEvent('runcode:gotSnippet')

AddEventHandler('runcode:gotSnippet', function(id, lang, code)
	local res, err = RunCode(lang, code)

	if not err then
		if type(res) == 'vector3' then
			res = json.encode({ table.unpack(res) })
		elseif type(res) == 'table' then
			res = json.encode(res)
		end
	end

	TriggerServerEvent('runcode:gotResult', id, res, err)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
