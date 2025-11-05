--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "jg-mechanic:client:open-admin"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "jg-mechanic:server:get-admin-data"
  L2_2 = false
  L0_2 = L0_2(L1_2, L2_2)
  if not L0_2 then
    return
  end
  L1_2 = SetNuiFocus
  L2_2 = true
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.type = "show-mechanic-admin"
  L2_2.mechanics = L0_2
  L3_2 = Config
  L2_2.config = L3_2
  L3_2 = Locale
  L2_2.locale = L3_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "delete-mechanic-data"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A0_2.mechanicId
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-mechanic:server:delete-mechanic-data"
  L5_2 = false
  L6_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if not L3_2 then
    L4_2 = A1_2
    L5_2 = {}
    L5_2.error = true
    return L4_2(L5_2)
  end
  L4_2 = TriggerEvent
  L5_2 = "jg-mechanic:client:open-admin"
  L4_2(L5_2)
  L4_2 = A1_2
  L5_2 = true
  L4_2(L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "set-mechanic-owner"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.mechanicId
  L3_2 = A0_2.player
  L4_2 = lib
  L4_2 = L4_2.callback
  L4_2 = L4_2.await
  L5_2 = "jg-mechanic:server:set-mechanic-owner"
  L6_2 = false
  L7_2 = L2_2
  L8_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L5_2 = A1_2
    L6_2 = {}
    L6_2.error = true
    return L5_2(L6_2)
  end
  L5_2 = TriggerEvent
  L6_2 = "jg-mechanic:client:open-admin"
  L5_2(L6_2)
  L5_2 = A1_2
  L6_2 = true
  L5_2(L6_2)
end
L0_1(L1_1, L2_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
