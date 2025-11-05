--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
print('Ducratif:[CLIENT] Debug PNJ Activé !')

local bucket = -1
RegisterNetEvent('ducratif_pop_diag:bucket', function(b) bucket = b end)

-- Densités + budgets (tick permanent)
CreateThread(function()
  while true do
    Wait(0)
    -- PNJ à pied
    SetPedDensityMultiplierThisFrame(1.0)
    SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
    SetPedPopulationBudget(3)
    -- Véhicules
    SetVehicleDensityMultiplierThisFrame(1.0)
    SetRandomVehicleDensityMultiplierThisFrame(1.0)
    SetParkedVehicleDensityMultiplierThisFrame(1.0) -- mets 0.0 si tu veux ZERO garées globalement
    SetVehiclePopulationBudget(3)
    -- Services (optionnel)
    SetGarbageTrucks(true)
    SetRandomBoats(true)
    SetRandomTrains(true)
  end
end)

-- Ping serveur régulier pour (ré)activer la pop sur MON bucket et le récupérer
CreateThread(function()
  while true do
    TriggerServerEvent('ducratif_pop_diag:ensureBucket')
    Wait(2000)
  end
end)

-- Overlay: compte les entités 2x/s, dessine chaque frame
local peds, vehs = 0, 0
CreateThread(function()
  while true do
    peds = #GetGamePool('CPed')
    vehs = #GetGamePool('CVehicle')
    Wait(500)
  end
end)

local function drawTxt(text, x, y, scale)
  SetTextFont(0); SetTextProportional(0); SetTextScale(scale, scale)
  SetTextColour(255,255,255,255); SetTextOutline()
  SetTextEntry("STRING"); AddTextComponentString(text)
  DrawText(x, y)
end

CreateThread(function()
  while true do
    Wait(0)
    drawTxt(('Bucket:%s | Peds:%d  Vehs:%d'):format(tostring(bucket), peds, vehs), 0.005, 0.005, 0.35)
  end
end)
-----------------
RegisterCommand('spawnped', function(_, args)
  local model = (args[1] or 'a_m_m_skater_01')
  local count = tonumber(args[2]) or 3
  local m = joaat(model)
  RequestModel(m); while not HasModelLoaded(m) do Wait(0) end
  local ped = PlayerPedId()
  local x,y,z = table.unpack(GetEntityCoords(ped))
  for i=1,count do
    local p = CreatePed(4, m, x+math.random(-3,3), y+math.random(-3,3), z, 0.0, true, true)
    SetEntityAsNoLongerNeeded(p)
  end
  print(('[spawnped] spawned %d x %s'):format(count, model))
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
