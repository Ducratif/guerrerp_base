--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- ESX = nil
-- local findESX = false

-- for i = 0, GetNumResources() - 1 do
--     local resourceName = GetResourceByFindIndex(i)
--     if resourceName == 'es_extended' then
--         findESX = 'es_extended'
--     elseif string.find(string.lower(resourceName), 'framework') then
--         findESX = resourceName
--     end
-- end

-- function GetSharedObject()
--     local resolved = false

--     if not ESX then
--         local success, result = xpcall(function()
--             if not resolved then
--                 ESX = exports[findESX].getSharedObject0()

--                 if ESX then
--                     resolved = true
--                     print('^0[^2!^0] ^4esx-server.lua^0 => ESX a été chargé à l\'étape n°1^0')
--                     return ESX
--                 end
--             end
--         end, function() end) -- Le gestionnaire d'erreur peut être vide si vous ne souhaitez pas faire quelque chose en cas d'erreur

--         if success then
--             return result
--         end
--     end

--     if not ESX then
--         local success, result = xpcall(function()
--             if not resolved then
--                 TriggerEvent('esx:getSharedObject0', function(returnObj)
--                     if returnObj then
--                         resolved = true
--                         print('^0[^2!^0] ^4esx-server.lua^0 => ESX a été chargé à l\'étape n°2^0')
--                         return ESX
--                     end
--                 end)
--             end
--         end, function() end)

--         if success then
--             return result
--         end
--     end

--     if not ESX then
--         local success, result = xpcall(function()
--             if not resolved then
--                 TriggerEvent('::{korioz#0110}::esx:getSharedObject0', function(returnObj)
--                     if returnObj then
--                         resolved = true
--                         print('^0[^2!^0] ^4esx-server.lua^0 => ESX a été chargé à l\'étape n°3^0')
--                         return ESX
--                     end
--                 end)
--             end
--         end, function() end)

--         if success then
--             return result
--         end
--     end

--     if not ESX then
--         if not resolved then
--             ESX = getCustomESX()
--             if not ESX then
--                 print('^1============= ATTENTION =============^7')
--                 print('^7   Impossible de charger ^2ESX^7 !^7')
--                 print('^1============= ATTENTION =============^7')
--             else
--                 print('^0[^2!^0] ^2esx-server.lua^0 => ESX a été chargé à l\'étape n°4^0')
--             end
--         end
--     end
-- end

-- CreateThread(function()
--     Wait(1000)
--     GetSharedObject()
-- end)

ESX = nil
ESX = exports["es_extended"]:getSharedObject()

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
