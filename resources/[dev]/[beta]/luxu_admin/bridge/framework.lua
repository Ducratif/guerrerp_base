--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
---@class Framework
---@field name "qb" | "qbx" | "esx" | "ox" | "vrp" |  "custom"
---@field object table<string, any>

local prom = promise.new()

if GetResourceState('qbx_core') == 'started' then -- QBOX
    local obj = exports["qb-core"]:GetCoreObject()
    TABLE_USERS = "players"
    COLUMN_CHAR_ID = "citizenid"
    prom:resolve({
        name = 'qbx',
        object = obj,
    })
elseif GetResourceState('qb-core') == 'started' then -- QBCore
    local obj = exports['qb-core']:GetCoreObject()
    TABLE_USERS = "players"
    COLUMN_CHAR_ID = "citizenid"
    prom:resolve({
        name = 'qb',
        object = obj,
    })
elseif GetResourceState('es_extended') == 'started' then -- ESX
    TABLE_USERS = "users"
    COLUMN_CHAR_ID = "identifier"
        if HasExports('es_extended', 'getSharedObject') then
        prom:resolve({
            name = 'esx',
            object = exports['es_extended']:getSharedObject(),
        })
    else
        TriggerEvent('esx:getSharedObject', function(obj)
            prom:resolve({
                name = 'esx',
                object = obj,
            })
        end)
    end
elseif GetResourceState('ox_core') == 'started' then -- OX
    TABLE_USERS = "players"
    COLUMN_CHAR_ID = "charId"
    require '@ox_core.lib.init'
    prom:resolve({
        name = 'ox',
        object = Ox,
    })
elseif GetResourceState('vRP') == 'started' then -- VRP
    require "vrp.lib.utils"
---TODO: Add vRP support, check db structure


    ---@diagnostic disable-next-line
    local Proxy = module("vrp", "lib/Proxy")
    ---@diagnostic disable-next-line
    local vRP = Proxy.getInterface("vRP")
    prom:resolve({
        name = 'vrp',
        object = vRP,
    })
else
    Luxu.print.error("Framework not detected")
    Luxu.print.warning("Make sure luxu_admin is the last resource to load")
    Luxu.print.error("If your framework is custom, please edit bridge/framework.lua")
    prom:reject()
end

return Citizen.Await(prom) --[[ @as Framework ]]

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
