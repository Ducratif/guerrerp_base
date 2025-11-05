--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if not Framework.QBCore() then return end

local client = client

-- Backwards Compatible Events

RegisterNetEvent("qb-clothing:client:openMenu", function()
    local config = GetDefaultConfig()
    config.ped = true
    config.headBlend = true
    config.faceFeatures = true
    config.headOverlays = true
    config.components = true
    config.props = true
    config.tattoos = true
    OpenShop(config, true, "all")
end)

RegisterNetEvent("qb-clothing:client:openOutfitMenu", function()
    OpenMenu(nil, "outfit")
end)

RegisterNetEvent("qb-clothing:client:loadOutfit", LoadJobOutfit)

RegisterNetEvent("qb-multicharacter:client:chooseChar", function()
    client.setPedTattoos(cache.ped, {})
    ClearPedDecorations(cache.ped)

    TriggerServerEvent("illenium-appearance:server:resetOutfitCache")
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
