--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
--- Order is important, the first one that is found will be used
--- ox_inventory, esx_addoninventory and qb-inventory must be last to avoid conflicts
local images = {
    { name = "ak47_inventory",     path = "https://cfx-nui-ak47_inventory/web/build/images/%s.png" },
    { name = "ak47_qb_inventory",  path = "https://cfx-nui-ak47_qb_inventory/web/build/images/%s.png" },
    { name = "qs-inventory",       path = "https://cfx-nui-qs-inventory/html/images/%s.png" },
    { name = "core_inventory",     path = "https://cfx-nui-core_inventory/html/img/%s.png" },
    { name = "qb-inventory",       path = "https://cfx-nui-qb-inventory/html/images/%s.png" },
    { name = "ox_inventory",       path = "https://cfx-nui-ox_inventory/web/images/%s.png" },
    { name = "esx_addoninventory", path = "https://cfx-nui-esx_addoninventory/web/images/%s.png" },
}

if Config.inventory.auto_detect then
    CreateThread(function()
        for _, inv in ipairs(images) do
            if (GetResourceState(inv.name) == 'started') then
                Config.inventory.images_url = inv.path
                break
            end
        end
    end)
end


local inventory = {}

---@return {name:string, label:string}[]
function inventory.getItems()
    if GetResourceState('ox_inventory') == 'started' then
        local result = exports.ox_inventory:Items()
        local list = {}
        for _, v in pairs(result) do
            list[#list + 1] = {
                name = v.name,
                label = v.label
            }
        end
        return list
    end

    if GetResourceState("ak47_inventory") == 'started' then
        local result = exports.ak47_inventory:Items()
        local list = {}
        for _, v in pairs(result) do
            list[#list + 1] = {
                name = v.name,
                label = v.label or v.name
            }
        end
        return list
    end

    if GetResourceState("ak47_qb_inventory") == 'started' then
        local result = exports.ak47_qb_inventory:Items()
        local list = {}
        for _, v in pairs(result) do
            list[#list + 1] = {
                name = v.name,
                label = v.label
            }
        end
        return list
    end


    if Framework.name == 'qb' or Framework.name == 'qbx' then
        local items = Framework.object.Shared.Items
        local list = {}
        for _, v in pairs(items) do
            list[#list + 1] = {
                name = v.name,
                label = v.label
            }
        end
        return list
    end

    if Framework.name == 'esx' then
        return Luxu.callbackSync("esx:getItems")
    end

    return {}
end

return inventory

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
