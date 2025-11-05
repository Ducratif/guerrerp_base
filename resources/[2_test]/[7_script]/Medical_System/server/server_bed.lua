--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local Array, PlayerInUse = {}, {}

AddEventHandler('playerDropped', function()
    local xPlayer = source
    if PlayerInUse[xPlayer] then
        Array[PlayerInUse[xPlayer]], PlayerInUse[xPlayer] = nil, nil
    end
end)

RegisterServerEvent('UseBed')
AddEventHandler('UseBed', function(model, modelcoords)
    local xPlayer = source
    if not Array[modelcoords] then
        PlayerInUse[xPlayer], Array[modelcoords] = modelcoords, true
        TriggerClientEvent('BedAnimation', xPlayer, model, modelcoords)
    end
end)

RegisterServerEvent('ExitBed')
AddEventHandler('ExitBed', function(modelcoords)
    PlayerInUse[source], Array[modelcoords] = nil, nil
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
