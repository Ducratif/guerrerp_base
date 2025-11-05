--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1, L3_1
L0_1 = nil
L1_1 = RegisterNUICallback
L2_1 = "get-unpaid-invoices"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A1_2
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-mechanic:server:get-unpaid-invoices"
  L5_2 = false
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
  L2_2(L3_2, L4_2, L5_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "save-invoice"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A0_2.invoiceItems
  L3_2 = A0_2.invoiceTotal
  if not L2_2 or not L3_2 then
    L4_2 = A1_2
    L5_2 = false
    return L4_2(L5_2)
  end
  L4_2 = A1_2
  L5_2 = lib
  L5_2 = L5_2.callback
  L5_2 = L5_2.await
  L6_2 = "jg-mechanic:server:save-invoice"
  L7_2 = false
  L8_2 = L2_2
  L9_2 = L3_2
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "send-invoice"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = A0_2.player
  L3_2 = A0_2.invoiceItems
  L4_2 = A0_2.invoiceTotal
  if not L2_2 or not L3_2 then
    L5_2 = A1_2
    L6_2 = false
    return L5_2(L6_2)
  end
  L5_2 = A1_2
  L6_2 = lib
  L6_2 = L6_2.callback
  L6_2 = L6_2.await
  L7_2 = "jg-mechanic:server:send-invoice"
  L8_2 = false
  L9_2 = L2_2
  L10_2 = L3_2
  L11_2 = L4_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "resend-invoice"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A0_2.player
  L3_2 = A0_2.invoiceId
  if not L2_2 or not L3_2 then
    L4_2 = A1_2
    L5_2 = false
    return L4_2(L5_2)
  end
  L4_2 = A1_2
  L5_2 = lib
  L5_2 = L5_2.callback
  L5_2 = L5_2.await
  L6_2 = "jg-mechanic:server:resend-invoice"
  L7_2 = false
  L8_2 = L2_2
  L9_2 = L3_2
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "delete-invoice"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2.invoiceId
  L3_2 = A1_2
  L4_2 = lib
  L4_2 = L4_2.callback
  L4_2 = L4_2.await
  L5_2 = "jg-mechanic:server:delete-invoice"
  L6_2 = false
  L7_2 = L2_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "pay-invoice"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.paymentMethod
  L3_2 = L0_1
  if not L3_2 then
    L3_2 = A1_2
    L4_2 = {}
    L4_2.error = true
    return L3_2(L4_2)
  end
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-mechanic:server:pay-invoice"
  L5_2 = false
  L6_2 = L0_1.invoiceId
  L7_2 = L0_1.senderPlayerId
  L8_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  if not L3_2 then
    L4_2 = A1_2
    L5_2 = {}
    L5_2.error = true
    return L4_2(L5_2)
  end
  L4_2 = nil
  L0_1 = L4_2
  L4_2 = A1_2
  L5_2 = true
  L4_2(L5_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "jg-mechanic:client:show-invoice-to-player"
function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = {}
  L4_2.invoiceId = A1_2
  L4_2.senderPlayerId = A0_2
  L0_1 = L4_2
  L4_2 = cache
  L4_2 = L4_2.serverId
  if L4_2 == A0_2 then
    L4_2 = DisconnectVehicle
    L4_2()
    L4_2 = LocalPlayer
    L4_2 = L4_2.state
    L5_2 = L4_2
    L4_2 = L4_2.set
    L6_2 = "mechanicId"
    L7_2 = nil
    L8_2 = true
    L4_2(L5_2, L6_2, L7_2, L8_2)
  end
  L4_2 = SetNuiFocus
  L5_2 = true
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.type = "show-invoice"
  L5_2.invoiceItems = A2_2
  L5_2.invoiceTotal = A3_2
  L6_2 = Framework
  L6_2 = L6_2.Client
  L6_2 = L6_2.GetBalance
  L7_2 = "bank"
  L6_2 = L6_2(L7_2)
  L5_2.bankBalance = L6_2
  L6_2 = Framework
  L6_2 = L6_2.Client
  L6_2 = L6_2.GetBalance
  L7_2 = "cash"
  L6_2 = L6_2(L7_2)
  L5_2.cashBalance = L6_2
  L6_2 = Locale
  L5_2.locale = L6_2
  L6_2 = Config
  L5_2.config = L6_2
  L4_2(L5_2)
end
L1_1(L2_1, L3_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
