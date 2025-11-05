--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
CreateThread(function()
  -- Assure la population dans les buckets usuels (0..128, ajuste si besoin)
  for i = 0, 128 do
    SetRoutingBucketPopulationEnabled(i, true)
  end
  print('^2[ducratif_bucket_pop]^7 Population ENABLED for buckets 0..128')
end)

-- Ping périodique depuis les clients pour s'assurer que leur bucket est bien activé
RegisterNetEvent('ducratif_pop_diag:ensureBucket', function()
  local src = source
  local b = GetPlayerRoutingBucket(src)
  SetRoutingBucketPopulationEnabled(b, true)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
