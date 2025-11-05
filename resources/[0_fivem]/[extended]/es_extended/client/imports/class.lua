--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local class = {}
class.__index = class

function class:new(...)
	local instance = setmetatable({}, self)
	if instance.constructor then
		local ret = instance:constructor(...)
		if type(ret) == 'table' then
			return ret
		end
	end
	return instance
end

function Class(body, heritage)
	local prototype = body or {}
	prototype.__index = prototype
	return setmetatable(prototype, heritage or class)
end

return Class

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
