--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "jg-mechanic:client:fix-vehicle-admin"
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "jg-mechanic:server:is-admin"
  L2_2 = false
  L0_2 = L0_2(L1_2, L2_2)
  if not L0_2 then
    return
  end
  L0_2 = cache
  L0_2 = L0_2.vehicle
  if not L0_2 then
    L0_2 = Framework
    L0_2 = L0_2.Client
    L0_2 = L0_2.Notify
    L1_2 = Locale
    L1_2 = L1_2.notInsideVehicle
    L2_2 = "error"
    L0_2(L1_2, L2_2)
    return
  end
  L0_2 = Framework
  L0_2 = L0_2.Client
  L0_2 = L0_2.RepairVehicle
  L1_2 = cache
  L1_2 = L1_2.vehicle
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-mechanic:client:clean-vehicle"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "jg-mechanic:server:has-item"
  L2_2 = 250
  L3_2 = "cleaning_kit"
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  if not L0_2 then
    return
  end
  L1_2 = cache
  L1_2 = L1_2.ped
  L2_2 = lib
  L2_2 = L2_2.getClosestVehicle
  L3_2 = GetEntityCoords
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L4_2 = 3.0
  L5_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if not L2_2 then
    L3_2 = Framework
    L3_2 = L3_2.Client
    L3_2 = L3_2.Notify
    L4_2 = Locale
    L4_2 = L4_2.noVehicleNearby
    L5_2 = "error"
    return L3_2(L4_2, L5_2)
  end
  L3_2 = IsPedInVehicle
  L4_2 = L1_2
  L5_2 = L2_2
  L6_2 = true
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 then
    L3_2 = TaskLeaveVehicle
    L4_2 = L1_2
    L5_2 = L2_2
    L6_2 = 16
    L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = {}
  L3_2.dict = "amb@world_human_maid_clean@"
  L3_2.name = "base"
  L4_2 = {}
  L4_2.model = "prop_sponge_01"
  L4_2.bone = 28422
  L5_2 = vector3
  L6_2 = 0.0
  L7_2 = 0.0
  L8_2 = -0.01
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L4_2.coords = L5_2
  L5_2 = vector3
  L6_2 = 90.0
  L7_2 = 0.0
  L8_2 = 0.0
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L4_2.rotation = L5_2
  L5_2 = Framework
  L5_2 = L5_2.Client
  L5_2 = L5_2.ProgressBar
  L6_2 = Locale
  L6_2 = L6_2.cleaningVehicle
  L7_2 = 3500
  L8_2 = L3_2
  L9_2 = L4_2
  function L10_2()
    local L0_3, L1_3, L2_3
    L0_3 = SetVehicleDirtLevel
    L1_3 = L2_2
    L2_3 = 0.0
    L0_3(L1_3, L2_3)
    L0_3 = WashDecalsFromVehicle
    L1_3 = L2_2
    L2_3 = 1.0
    L0_3(L1_3, L2_3)
    L0_3 = Framework
    L0_3 = L0_3.Client
    L0_3 = L0_3.Notify
    L1_3 = Locale
    L1_3 = L1_3.vehicleCleaned
    L2_3 = "success"
    L0_3(L1_3, L2_3)
    L0_3 = TriggerServerEvent
    L1_3 = "jg-mechanic:server:remove-item"
    L2_3 = "cleaning_kit"
    L0_3(L1_3, L2_3)
  end
  function L11_2()
    local L0_3, L1_3
  end
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-mechanic:client:repair-vehicle"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "jg-mechanic:server:has-item"
  L2_2 = 250
  L3_2 = "repair_kit"
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  if not L0_2 then
    return
  end
  L0_2 = cache
  L0_2 = L0_2.ped
  L1_2 = lib
  L1_2 = L1_2.getClosestVehicle
  L2_2 = GetEntityCoords
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  L3_2 = 3.0
  L4_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  if not L1_2 then
    L2_2 = Framework
    L2_2 = L2_2.Client
    L2_2 = L2_2.Notify
    L3_2 = Locale
    L3_2 = L3_2.noVehicleNearby
    L4_2 = "error"
    return L2_2(L3_2, L4_2)
  end
  L2_2 = cache
  L2_2 = L2_2.vehicle
  if L2_2 then
    L2_2 = Framework
    L2_2 = L2_2.Client
    L2_2 = L2_2.Notify
    L3_2 = Locale
    L3_2 = L3_2.leaveVehicleFirst
    L4_2 = "error"
    return L2_2(L3_2, L4_2)
  end
  L2_2 = playMinigame
  L3_2 = L1_2
  L4_2 = "prop"
  L5_2 = {}
  L5_2.prop = "spanner"
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    if not A0_3 then
      return
    end
    L1_3 = lib
    L1_3 = L1_3.callback
    L1_3 = L1_3.await
    L2_3 = "jg-mechanic:server:has-item"
    L3_3 = false
    L4_3 = "repair_kit"
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    if not L1_3 then
      return
    end
    L1_3 = Framework
    L1_3 = L1_3.Client
    L1_3 = L1_3.RepairVehicle
    L2_3 = L1_2
    L1_3(L2_3)
    L1_3 = Framework
    L1_3 = L1_3.Client
    L1_3 = L1_3.Notify
    L2_3 = Locale
    L2_3 = L2_3.vehicleRepaired
    L3_3 = "success"
    L1_3(L2_3, L3_3)
    L1_3 = TriggerServerEvent
    L2_3 = "jg-mechanic:server:remove-item"
    L3_3 = "repair_kit"
    L1_3(L2_3, L3_3)
  end
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-mechanic:client:use-duct-tape"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "jg-mechanic:server:has-item"
  L2_2 = 250
  L3_2 = "duct_tape"
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  if not L0_2 then
    return
  end
  L0_2 = cache
  L0_2 = L0_2.ped
  L1_2 = lib
  L1_2 = L1_2.getClosestVehicle
  L2_2 = GetEntityCoords
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  L3_2 = 3.0
  L4_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  if not L1_2 then
    L2_2 = Framework
    L2_2 = L2_2.Client
    L2_2 = L2_2.Notify
    L3_2 = Locale
    L3_2 = L3_2.noVehicleNearby
    L4_2 = "error"
    return L2_2(L3_2, L4_2)
  end
  L2_2 = GetVehicleEngineHealth
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = Config
  L3_2 = L3_2.DuctTapeMinimumEngineHealth
  if L2_2 > L3_2 then
    L3_2 = Framework
    L3_2 = L3_2.Client
    L3_2 = L3_2.Notify
    L4_2 = Locale
    L4_2 = L4_2.ductTapeEngineHealthTooHigh
    L5_2 = "error"
    return L3_2(L4_2, L5_2)
  end
  L3_2 = playMinigame
  L4_2 = L1_2
  L5_2 = "prop"
  L6_2 = {}
  L6_2.prop = "spanner"
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    if not A0_3 then
      return
    end
    L1_3 = lib
    L1_3 = L1_3.callback
    L1_3 = L1_3.await
    L2_3 = "jg-mechanic:server:has-item"
    L3_3 = false
    L4_3 = "duct_tape"
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    if not L1_3 then
      return
    end
    L1_3 = SetVehicleUndriveable
    L2_3 = L1_2
    L3_3 = false
    L1_3(L2_3, L3_3)
    L1_3 = SetVehicleEngineHealth
    L2_3 = L1_2
    L3_3 = L2_2
    L4_3 = Config
    L4_3 = L4_3.DuctTapeEngineHealthIncrease
    L3_3 = L3_3 + L4_3
    L1_3(L2_3, L3_3)
    L1_3 = Framework
    L1_3 = L1_3.Client
    L1_3 = L1_3.Notify
    L2_3 = Locale
    L2_3 = L2_3.ductTapeUsed
    L3_3 = "success"
    L1_3(L2_3, L3_3)
    L1_3 = TriggerServerEvent
    L2_3 = "jg-mechanic:server:remove-item"
    L3_3 = "duct_tape"
    L1_3(L2_3, L3_3)
  end
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L0_1(L1_1, L2_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
