--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = {}

exports("getSharedObject", function()
    return ESX
end)

AddEventHandler("esx:getSharedObject", function(cb)
    if ESX.IsFunctionReference(cb) then
        cb(ESX)
    end
    local invokingResource = GetInvokingResource()
    print(("^3[WARNING]^0 Resource ^5%s^0 used the ^5getSharedObject^0 event. This is not the recommended way to import ESX. Visit https://docs.esx-legacy.com/tutorials/tutorials-esx/sharedevent to find out why."):format(invokingResource))
end)

-- backwards compatibility (DO NOT TOUCH !)
Config.OxInventory = Config.CustomInventory == "ox"

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
