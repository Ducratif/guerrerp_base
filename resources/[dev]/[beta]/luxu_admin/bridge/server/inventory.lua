--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
---@class InventoryUtils
local inventory = {}

local function isResourceRunning(resource)
    return GetResourceState(resource) == "started"
end

Luxu.registerServerCallback("esx:getItems", function()
    local rawItems = ESX.GetItems()

    local list = {}
    for name, v in pairs(rawItems) do
        list[#list + 1] = {
            name = v.name or name,
            label = v.label
        }
    end
    return list
end)


---@param source number
---@return table<number, table>
function inventory.getPlayerItems(source)
    local playerObj = Luxu.player.getPlayerObject(source)
    if not playerObj then return {} end

    local result = {}
    if Framework.name == 'ox' then
        result = exports.ox_inventory:GetInventoryItems(source) --[[ @as table ]]
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        result = playerObj.PlayerData.items
    elseif Framework.name == 'esx' then
        result = playerObj.getInventory()
    else
        result = {} --[[ CUSTOM FRAMEWORK ]]
    end

    local formated = {}

    print(table.type(result))
    if table.type(result) == 'array' then
        for i, item in ipairs(result) do
            if item and item?.name then
                item.amount = item.amount or item.count
                formated[i] = item
            end
        end
    else
        for k, item in pairs(result) do
            if item and item?.name then
                item.amount = item.amount or item.count
                formated[k] = item
            end
        end
    end

    return formated
end

---@param source number
function inventory.addItem(source, item, amount, metadata)
    local playerObj = Luxu.player.getPlayerObject(source)
    if not playerObj then return false end

    if isResourceRunning('ox_inventory') then
        exports.ox_inventory:AddItem(source, item, amount, metadata, nil, nil)
    elseif isResourceRunning("origen_inventory") then
        exports.origen_inventory:AddItem(source, item, amount, nil, metadata)
    elseif isResourceRunning('ak47_inventory') then
        exports['ak47_inventory']:AddItem(source, item, amount, nil, metadata)
    elseif isResourceRunning('ak47_qb_inventory') then
        exports['ak47_qb_inventory']:AddItem(source, item, amount, nil, metadata)
    elseif isResourceRunning('core_inventory') then
        local identifier = Luxu.player.getCharId(playerObj)
        local inventory = 'content-' .. identifier:gsub(':', '')
        exports['core_inventory']:addItem(inventory, item, amount, metadata, "content")
    elseif isResourceRunning('qs-inventory') then
        exports['qs-inventory']:AddItem(source, item, amount, nil, metadata)
    elseif isResourceRunning("tgiann-inventory") then
        exports["tgiann-inventory"]:AddItem(source, item, amount)
    elseif isResourceRunning("codem-inventory") then
        exports["codem-inventory"]:AddItem(source, item, amount, nil, metadata)
    else
        if Framework.name == "qb" or Framework.name == "qbx" then
            playerObj.Functions.AddItem(item, amount, nil, metadata)
        elseif Framework.name == "esx" then
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.addInventoryItem(item, amount)
        end
    end
    return true
end

function inventory.removeItem(source, item, amount, slot)
    local playerObj = Luxu.player.getPlayerObject(source)
    if not playerObj then return false end

    if isResourceRunning('ox_inventory') then
        exports.ox_inventory:RemoveItem(source, item, amount)
    elseif isResourceRunning('origen_inventory') then
        exports.origen_inventory:RemoveItem(source, item, amount)
    elseif isResourceRunning('ak47_inventory') then
        exports['ak47_inventory']:RemoveItem(source, item, amount)
    elseif isResourceRunning('ak47_qb_inventory') then
        exports['ak47_qb_inventory']:RemoveItem(source, item, amount)
    elseif isResourceRunning('core_inventory') then
        local identifier = Luxu.player.getCharId(playerObj)
        local inventory = 'content-' .. identifier:gsub(":", "")
        exports['core_inventory']:removeItem(inventory, item, tonumber(amount))
    elseif isResourceRunning('qs-inventory') then
        exports['qs-inventory']:RemoveItem(source, item, amount)
    elseif isResourceRunning("tgiann-inventory") then
        exports["tgiann-inventory"]:RemoveItem(source, item, amount)
    elseif isResourceRunning("codem-inventory") then
        exports["codem-inventory"]:RemoveItem(source, item, amount, slot)
    else
        if Framework.name == "qb" or Framework.name == "qbx" then
            playerObj.Functions.RemoveItem(item, amount)
        elseif Framework.name == "esx" then
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.removeInventoryItem(item, amount)
        end
    end
end

---@return boolean
function inventory.canCarryItem(source, item, amount)
    local playerObj = Luxu.player.getPlayerObject(source)
    if not playerObj then return false end

    if isResourceRunning('ox_inventory') then
        return exports.ox_inventory:CanCarryItem(source, item, amount) == true
    elseif isResourceRunning("origen_inventory") then
        return exports.origen_inventory:CanCarryItem(source, item, amount)
    elseif isResourceRunning("ak47_inventory") then
        return exports['ak47_inventory']:CanAddItem(source, item, amount)
    elseif isResourceRunning('ak47_qb_inventory') then
        return exports['ak47_qb_inventory']:CanAddItem(source, item, amount)
    elseif isResourceRunning('core_inventory') then
        local identifier = Luxu.player.getCharId(playerObj)
        local inventory = 'content-' .. identifier:gsub(":", "")
        return exports['core_inventory']:canCarry(inventory, item, amount)
    elseif isResourceRunning('qs-inventory') then
        return exports['qs-inventory']:CanCarryItem(source, item, amount)
    elseif isResourceRunning("tgiann-inventory") then
        return exports["tgiann-inventory"]:CanCarryItem(source, item, amount)
    elseif isResourceRunning("codem-inventory") then
        local itemList = exports["codem-inventory"]:GetItemList()
        local itemData = itemList[item]
        if not itemData then return false end
        return exports["codem-inventory"]:CanCarryItem(source, item, amount)
    else
        if Framework.name == "qb" or Framework.name == "qbx" then
            local totalWeight = QBCore.Player.GetTotalWeight(playerObj.PlayerData.items)
            local info = QBCore.Shared.Items[item:lower()]
            return (totalWeight + (info['weight'] * amount)) <= 120000
        elseif Framework.name == "esx" then
            local xPlayer = ESX.GetPlayerFromId(source)
            return xPlayer.canCarryItem(item, amount)
        end
    end
    return true
end

---@return boolean
function inventory.hasItem(source, item, amount)
    local playerObj = Luxu.player.getPlayerObject(source)
    if not playerObj then return false end

    if isResourceRunning('ox_inventory') then
        local count = exports.ox_inventory:GetItem(source, item, nil, true)
        return count >= amount
    elseif isResourceRunning('origen_inventory') then
        return exports.origen_inventory:HasItem(source, item, amount)
    elseif isResourceRunning('ak47_inventory') then
        return exports['ak47_inventory']:GetAmount(source, item) >= amount
    elseif isResourceRunning('ak47_qb_inventory') then
        return exports['ak47_qb_inventory']:GetAmount(source, item) >= amount
    elseif isResourceRunning('core_inventory') then
        local identifier = Luxu.player.getCharId(playerObj)
        local inventory = 'content-' .. identifier:gsub(":", "")
        local item = exports['core_inventory']:getItem(inventory, item)
        local count = item and item.amount or 0
        return count >= amount
    elseif isResourceRunning('qs-inventory') then
        local count = exports['qs-inventory']:GetItemTotalAmount(source, item)
        return count >= amount
    elseif isResourceRunning("codem-inventory") then
        return exports["codem-inventory"]:CheckItemValid(source, item, amount)
    elseif isResourceRunning("tgiann-inventory") then
        return exports["tgiann-inventory"]:HasItem(source, item, amount)
    else
        if Framework.name == "qb" or Framework.name == "qbx" then
            local items = playerObj.PlayerData.items
            local count = 0
            for _, v in pairs(items) do
                if item == v.name then
                    count = count + v.amount
                end
            end
            return count >= amount
        elseif Framework.name == "esx" then
            local xPlayer = ESX.GetPlayerFromId(source)
            return xPlayer.getInventoryItem(item).count >= amount
        end
    end
    return false
end

function inventory.getItemCount(source, item)
    local playerObj = Luxu.player.getPlayerObject(source)
    if not playerObj then return 0 end

    if isResourceRunning('ox_inventory') then
        return exports.ox_inventory:GetItem(source, item, nil, true)
    elseif isResourceRunning('origen_inventory') then
        return exports.origen_inventory:GetItemCount(source, item)
    elseif isResourceRunning('ak47_inventory') then
        return exports['ak47_inventory']:GetAmount(source, item)
    elseif isResourceRunning('ak47_qb_inventory') then
        return exports['ak47_qb_inventory']:GetAmount(source, item)
    elseif isResourceRunning('core_inventory') then
        local identifier = Luxu.player.getCharId(playerObj)
        local inventory = 'content-' .. identifier:gsub(":", "")
        local itemData = exports['core_inventory']:getItem(inventory, item)
        return itemData and itemData.amount or 0
    elseif isResourceRunning('qs-inventory') then
        return exports['qs-inventory']:GetItemTotalAmount(source, item)
    elseif isResourceRunning("codem-inventory") then
        return exports["codem-inventory"]:GetItemCount(source, item)
    elseif isResourceRunning("tgiann-inventory") then
        return exports["tgiann-inventory"]:GetItemCount(source, item)
    else
        if Framework.name == "qb" or Framework.name == "qbx" then
            local items = playerObj.PlayerData.items
            local count = 0
            for _, v in pairs(items) do
                if item == v.name then
                    count = count + v.amount
                end
            end
            return count
        elseif Framework.name == "esx" then
            local xPlayer = ESX.GetPlayerFromId(source)
            return xPlayer.getInventoryItem(item).count
        end
    end
    return 0
end

function inventory.getAllPlayersInventory()
    local result = {}
    if Framework.name == "qb" or Framework.name == "qbx" then
        for _, playerObj in pairs(Framework.object.Functions.GetQBPlayers()) do
            local items = playerObj.PlayerData.items

            -- Safety check
            for _, item in pairs(items) do
                item.amount = item.amount or item.count
                item.label = item.label or item.name
            end

            table.insert(result, {
                charId = playerObj.PlayerData.citizenid,
                name = playerObj.PlayerData.charinfo.firstname .. " " .. playerObj.PlayerData.charinfo.lastname,
                inventory = items
            })
        end
    elseif Framework.name == "esx" then
        if Framework.object.GetExtendedPlayers then
            for _, playerObj in pairs(Framework.object.GetExtendedPlayers()) do
                local items = playerObj.inventory

                for _, item in pairs(items) do
                    item.amount = item.amount or item.count
                    item.label = item.label or item.name
                end

                table.insert(result, {
                    charId = playerObj.identifier,
                    name = playerObj.getName(),
                    inventory = items
                })
            end
        else
            --- Fallback

            for _, src in ipairs(GetPlayers()) do
                local playerObj = Framework.object.getGetPlayerFromId(src)

                if playerObj then
                    local items = playerObj.inventory

                    for _, item in pairs(items) do
                        item.amount = item.amount or item.count
                        item.label = item.label or item.name
                    end

                    table.insert(result, {
                        charId = playerObj.identifier,
                        name = playerObj.getName(),
                        inventory = items
                    })
                end
            end
        end
    end
    return result
end

local cachedPlayers = {
    value = {},
    refreshed_at = 0
}
local cacheDuration = 3 * 60 * 1000

---@return table<string, {charId:string, name:string, amount:number}>
---@param itemName string
function inventory.getPlayersWithItem(itemName)
    ---@type table<string, {charId:string, name:string, amount:number}>
    local players = {}
    local shouldRefresh = cachedPlayers.refreshed_at == 0 or
        (GetGameTimer() - cachedPlayers.refreshed_at) > cacheDuration

    if Framework.name == "esx" then
        local result = cachedPlayers.value


        if shouldRefresh then
            result = MySQL.query.await("SELECT identifier, inventory, firstname, lastname FROM users")
            cachedPlayers.value = result
            cachedPlayers.refreshed_at = GetGameTimer()
        end



        for _, player in ipairs(result) do
            local inventory = player?.inventory and json.decode(player.inventory) or {}
            if type(inventory) == "table" then
                for i = 1, #inventory do
                    local item = inventory[i]
                    if item and item.name == itemName then
                        if players[player.identifier] then
                            players[player.identifier].amount = players[player.identifier].amount +
                                (item.count or item.amount)
                        else
                            players[player.identifier] = {
                                charId = player.identifier,
                                name = player.firstname .. " " .. player.lastname,
                                amount = item.count or item.amount
                            }
                        end
                    end
                end
            end
        end
    elseif Framework.name == "qb" or Framework.name == "qbx" then
        local result = cachedPlayers.value

        if shouldRefresh then
            result = MySQL.query.await("SELECT inventory, charinfo, citizenid FROM players")
            cachedPlayers.value = result
            cachedPlayers.refreshed_at = GetGameTimer()
        end


        for _, player in ipairs(result) do
            local inventory = player?.inventory and json.decode(player.inventory) or {}
            if type(inventory) == "table" then
                for i = 1, #inventory do
                    local item = inventory[i]
                    local charinfo = json.decode(player.charinfo)
                    if item.name == itemName then
                        if players[player.citizenid] then
                            players[player.citizenid].amount = players[player.citizenid].amount +
                                (item.count or item.amount)
                        else
                            players[player.citizenid] = {
                                charId = player.citizenid,
                                name = charinfo.firstname .. " " .. charinfo.lastname,
                                amount = item.count or item.amount
                            }
                        end
                    end
                end
            end
        end
    end

    return players
end

return inventory

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
