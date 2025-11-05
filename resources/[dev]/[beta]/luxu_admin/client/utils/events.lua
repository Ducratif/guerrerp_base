--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- client/utils/events.lua
-- Shim pour fournir onResourceStop(...) si absent
if type(onResourceStop) ~= 'function' then
  function onResourceStop(cb)
    AddEventHandler('onResourceStop', function(res)
      if res == GetCurrentResourceName() then
        local ok, err = pcall(cb)
        if not ok then
          print(('[luxu_admin] onResourceStop callback error: %s'):format(err))
        end
      end
    end)
  end
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
