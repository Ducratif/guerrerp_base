--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
CreateThread(function()
  -- Active la population pour un large éventail de buckets
  for i = 0, 512 do
    SetRoutingBucketPopulationEnabled(i, true)
  end
  print('^2[ducratif_bucket_pop]^7 Population ENABLED for buckets 0..512')

  -- Log des convars OneSync (peuvent être vides si gérées par txAdmin, c'est normal)
  Wait(1000)
  print(('[ducratif_bucket_pop] onesync=%s, infinity=%s, population=%s'):format(
    GetConvar('onesync', 'n/a'),
    GetConvar('onesync_enableInfinity', 'n/a'),
    GetConvar('onesync_population', 'n/a')
  ))
end)

-- À chaque arrivée, on s'assure que son bucket a la pop ON et on informe le client
AddEventHandler('playerJoining', function()
  local src = source
  local b = GetPlayerRoutingBucket(src)
  SetRoutingBucketPopulationEnabled(b, true)
  print(('[ducratif_bucket_pop] %s joined in bucket %d -> pop ON'):format(GetPlayerName(src) or src, b))
  TriggerClientEvent('ducratif_pop_diag:bucket', src, b)
end)

-- Ping périodique depuis le client
RegisterNetEvent('ducratif_pop_diag:ensureBucket', function()
  local src = source
  local b = GetPlayerRoutingBucket(src)
  SetRoutingBucketPopulationEnabled(b, true)
  TriggerClientEvent('ducratif_pop_diag:bucket', src, b)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
