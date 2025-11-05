--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports['es_extended']:getSharedObject()

local allowedJobs = {
    ['police'] = true,
    ['mechanic'] = true
}

ESX.RegisterServerCallback('custom_impound:canImpound', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and allowedJobs[xPlayer.job.name] then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('custom_impound:impoundVehicle', function(plate)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer and allowedJobs[xPlayer.job.name] then
        print(('Véhicule %s mis en fourrière par %s [%s]'):format(plate, xPlayer.getName(), xPlayer.job.name))
        -- Tu peux ici ajouter un logging ou sauvegarder en BDD si tu veux
    else
        print(('Tentative de mise en fourrière non autorisée par %s [%s]'):format(xPlayer.getName(), xPlayer.job.name))
        DropPlayer(src, "Tentative de triche détectée.")
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
