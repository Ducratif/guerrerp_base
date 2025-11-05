--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- local resourceList = {}
-- local findESX = false

-- for i = 0, GetNumResources() - 1 do
--     resourceList[i + 1] = GetResourceByFindIndex(i)
--     local resourceName = GetResourceByFindIndex(i)
--     if resourceName == 'es_extended' then
--         findESX = 'es_extended'
--     elseif string.find(string.lower(resourceName), 'framework') then
--         findESX = resourceName
--     end
-- end

-- function GetSharedObject()
--     local object = promise:new()
--     local resolved = false

--     xpcall(function()
--         object:resolve(exports[findESX]['getSharedObject']())

--         resolved = true
--     end, function()
--         xpcall(function()
--             TriggerEvent('esx:getSharedObject', function(obj)
--                 ESX = obj

--                 resolved = true
--             end, debug.traceback)
--         end)
--     end)

--     SetTimeout(1000, function()
--         if resolved == false then
--             print('^1================ WARNING ================^7')
--             print('^7Could not ^2load^7 shared object!^7')
--             print('^1================ WARNING ================^7')
--         end
--     end)
-- end

-- GetSharedObject()  -- Invoking the function asynchronously

-- local ESX = Citizen.Await(promise)
-- print("ESX Loaded:", ESX)

ESX = nil

ESX = exports["es_extended"]:getSharedObject()

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
