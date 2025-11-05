--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1
L0_1 = RegisterNUICallback
L1_1 = "get-mechanic-balance"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2.mechanicId
  L3_2 = A1_2
  L4_2 = lib
  L4_2 = L4_2.callback
  L4_2 = L4_2.await
  L5_2 = "jg-mechanic:server:get-mechanic-balance"
  L6_2 = false
  L7_2 = L2_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "update-mechanic-balance"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = A0_2.action
  L3_2 = A0_2.mechanicId
  L4_2 = A0_2.amount
  L5_2 = A0_2.source
  if "deposit" == L2_2 then
    L6_2 = A1_2
    L7_2 = lib
    L7_2 = L7_2.callback
    L7_2 = L7_2.await
    L8_2 = "jg-mechanic:server:mechanic-deposit"
    L9_2 = false
    L10_2 = L3_2
    L11_2 = L5_2
    L12_2 = L4_2
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
    return L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  elseif "withdraw" == L2_2 then
    L6_2 = A1_2
    L7_2 = lib
    L7_2 = L7_2.callback
    L7_2 = L7_2.await
    L8_2 = "jg-mechanic:server:mechanic-withdraw"
    L9_2 = false
    L10_2 = L3_2
    L11_2 = L4_2
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    return L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  L6_2 = A1_2
  L7_2 = {}
  L7_2.error = true
  return L6_2(L7_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "get-mechanic-employees"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2.mechanicId
  L3_2 = A1_2
  L4_2 = lib
  L4_2 = L4_2.callback
  L4_2 = L4_2.await
  L5_2 = "jg-mechanic:server:get-mechanic-employees"
  L6_2 = false
  L7_2 = L2_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "update-mechanic-settings"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.mechanicId
  L3_2 = A1_2
  L4_2 = lib
  L4_2 = L4_2.callback
  L4_2 = L4_2.await
  L5_2 = "jg-mechanic:server:update-mechanic-settings"
  L6_2 = false
  L7_2 = L2_2
  L8_2 = A0_2
  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
end
L0_1(L1_1, L2_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
