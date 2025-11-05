--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = TriggerClientEvent
L1_1 = pcall
L2_1 = SetConvarReplicated
L3_1 = "luxu_admin:dev"
L4_1 = IsDev
if L4_1 then
  L4_1 = "true"
  if L4_1 then
    goto lbl_13
  end
end
L4_1 = "false"
::lbl_13::
L2_1(L3_1, L4_1)
L2_1 = exports
L3_1 = "getFramework"
function L4_1()
  local L0_2, L1_2
  L0_2 = Framework
  return L0_2
end
L2_1(L3_1, L4_1)
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = exports
  L3_2 = A0_2
  function L4_2(...)
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = xpcall
    L1_3 = A1_2
    function L2_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4
      L1_4 = print
      L2_4 = "ERROR DURING INTERNAL EXPORT CALLBACK %s"
      L3_4 = L2_4
      L2_4 = L2_4.format
      L4_4 = A0_2
      L2_4, L3_4, L4_4 = L2_4(L3_4, L4_4)
      L1_4(L2_4, L3_4, L4_4)
      L1_4 = Luxu
      L1_4 = L1_4.print
      L1_4 = L1_4.error
      L2_4 = A0_4
      L1_4(L2_4)
    end
    L3_3 = ...
    L0_3, L1_3 = L0_3(L1_3, L2_3, L3_3)
    if L0_3 then
      return L1_3
    end
    L2_3 = false
    return L2_3
  end
  L2_2(L3_2, L4_2)
end
L3_1 = Luxu
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = Luxu
  L2_2 = L2_2.triggerClientEvent
  L3_2 = "notify"
  L4_2 = tonumber
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
end
L3_1.notifyPlayer = L4_1
L3_1 = {}
L4_1 = Luxu
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = tostring
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L3_1
  L1_2 = L2_2[L1_2]
  if L1_2 then
    L1_2 = tostring
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    L2_2 = L3_1
    L1_2 = L2_2[L1_2]
    return L1_2
  end
  L1_2 = GetPlayerIdentifierByType
  L2_2 = A0_2
  L3_2 = "license2"
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L1_2 = GetPlayerIdentifierByType
    L2_2 = A0_2
    L3_2 = "license"
    L1_2 = L1_2(L2_2, L3_2)
  end
  L2_2 = string
  L2_2 = L2_2.strsplit
  L3_2 = ":"
  L4_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = L2_2[1]
  L3_2 = tostring
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = L3_1
  L4_2[L3_2] = L2_2
  return L2_2
end
L4_1.getPlayerUniqueId = L5_1
L4_1 = Luxu
function L5_1(A0_2, A1_2, ...)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L0_1
  L3_2 = "luxu_admin:client:"
  L4_2 = A0_2
  L3_2 = L3_2 .. L4_2
  L4_2 = A1_2
  L5_2 = ...
  L2_2(L3_2, L4_2, L5_2)
end
L4_1.triggerClientEvent = L5_1
L4_1 = Luxu
function L5_1(A0_2, A1_2, A2_2, ...)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = TriggerLatentClientEvent
  L4_2 = "luxu_admin:client:"
  L5_2 = A0_2
  L4_2 = L4_2 .. L5_2
  L5_2 = A1_2
  L6_2 = A2_2 or L6_2
  if not A2_2 then
    L6_2 = 25000.0
  end
  L7_2 = ...
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L4_1.triggerClientEventLatent = L5_1
L4_1 = Luxu
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = RegisterNetEvent
  L3_2 = "luxu_admin:server:"
  L4_2 = A0_2
  L3_2 = L3_2 .. L4_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
end
L4_1.registerNetEvent = L5_1
L4_1 = Luxu
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = AddEventHandler
  L3_2 = "luxu_admin:server:"
  L4_2 = A0_2
  L3_2 = L3_2 .. L4_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
end
L4_1.addEventHandler = L5_1
function L4_1(A0_2, A1_2, ...)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A0_2 then
    if A1_2 then
      L2_2 = print
      L3_2 = [[
^1SCRIPT ERROR: %s^0
%s]]
      L4_2 = L3_2
      L3_2 = L3_2.format
      L5_2 = A1_2
      L6_2 = Citizen
      L6_2 = L6_2.InvokeNative
      L7_2 = 3607903178
      L8_2 = nil
      L9_2 = 0
      L10_2 = Citizen
      L10_2 = L10_2.ResultAsString
      L10_2 = L10_2()
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
      if not L6_2 then
        L6_2 = ""
      end
      L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L3_2(L4_2, L5_2, L6_2)
      return L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    end
    L2_2 = false
    return L2_2
  end
  L2_2 = A1_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = ...
  return L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
end
L5_1 = Luxu
function L6_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L4_2 = RegisterNetEvent
  L5_2 = "luxu_admin_cb:server:"
  L6_2 = A0_2
  L5_2 = L5_2 .. L6_2
  function L6_2(A0_3, ...)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L1_3 = source
    L2_3 = A2_2
    if L2_3 then
      L2_3 = TriggerLatentClientEvent
      L3_3 = "luxu_admin_callback_result"
      L4_3 = L1_3
      L5_3 = A3_2
      if not L5_3 then
        L5_3 = 50000
      end
      L6_3 = A0_3
      L7_3 = L4_1
      L8_3 = L1_1
      L9_3 = A1_2
      L10_3 = L1_3
      L11_3 = ...
      L8_3, L9_3, L10_3, L11_3 = L8_3(L9_3, L10_3, L11_3)
      L7_3, L8_3, L9_3, L10_3, L11_3 = L7_3(L8_3, L9_3, L10_3, L11_3)
      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
    else
      L2_3 = L0_1
      L3_3 = "luxu_admin_callback_result"
      L4_3 = L1_3
      L5_3 = A0_3
      L6_3 = L4_1
      L7_3 = L1_1
      L8_3 = A1_2
      L9_3 = L1_3
      L10_3, L11_3 = ...
      L7_3, L8_3, L9_3, L10_3, L11_3 = L7_3(L8_3, L9_3, L10_3, L11_3)
      L6_3, L7_3, L8_3, L9_3, L10_3, L11_3 = L6_3(L7_3, L8_3, L9_3, L10_3, L11_3)
      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
    end
  end
  L4_2(L5_2, L6_2)
end
L5_1.registerServerCallback = L6_1
L5_1 = {}
L6_1 = {}
L7_1 = true
L8_1 = Luxu
function L9_1(A0_2, A1_2, A2_2, ...)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L3_2 = nil
  L4_2 = nil
  if A1_2 then
    L3_2 = A1_2.restricted
    L4_2 = A1_2.params
  end
  L5_2 = type
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if "table" == L5_2 then
    L5_2 = ipairs
    L6_2 = L3_2
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      L11_2 = IsPrincipalAceAllowed
      L12_2 = L10_2
      L13_2 = "command."
      L14_2 = A0_2
      L13_2 = L13_2 .. L14_2
      L11_2 = L11_2(L12_2, L13_2)
      if not L11_2 then
        L11_2 = ExecuteCommand
        L12_2 = "add_ace "
        L13_2 = L10_2
        L14_2 = " command."
        L15_2 = A0_2
        L16_2 = " allow"
        L12_2 = L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2
        L11_2(L12_2)
      end
    end
  end
  if L4_2 then
    L5_2 = 1
    L6_2 = #L4_2
    L7_2 = 1
    for L8_2 = L5_2, L6_2, L7_2 do
      L9_2 = L4_2[L8_2]
      L10_2 = L9_2.type
      if L10_2 then
        L10_2 = L9_2.help
        if L10_2 then
          L10_2 = "%s (type: %s)"
          L11_2 = L10_2
          L10_2 = L10_2.format
          L12_2 = L9_2.help
          L13_2 = L9_2.type
          L10_2 = L10_2(L11_2, L12_2, L13_2)
          if L10_2 then
            goto lbl_59
          end
        end
        L10_2 = "(type: %s)"
        L11_2 = L10_2
        L10_2 = L10_2.format
        L12_2 = L9_2.type
        L10_2 = L10_2(L11_2, L12_2)
        ::lbl_59::
        L9_2.help = L10_2
      end
    end
  end
  L5_2 = type
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if "table" ~= L5_2 then
    L5_2 = {}
    L6_2 = A0_2
    L5_2[1] = L6_2
    if L5_2 then
      goto lbl_73
    end
  end
  L5_2 = A0_2
  ::lbl_73::
  L6_2 = #L5_2
  L7_2 = L6_1
  L7_2 = #L7_2
  function L8_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L3_3 = L1_1
    L4_3 = A2_2
    L5_3 = A0_3
    L6_3 = A1_3
    L7_3 = A2_3
    L3_3, L4_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
    if not L3_3 then
      L5_3 = Citizen
      L5_3 = L5_3.Trace
      L6_3 = [[
^1command '%s' failed!
%s]]
      L7_3 = L6_3
      L6_3 = L6_3.format
      L8_3 = string
      L8_3 = L8_3.strsplit
      L9_3 = " "
      L10_3 = A2_3
      L8_3 = L8_3(L9_3, L10_3)
      if not L8_3 then
        L8_3 = A2_3
      end
      L9_3 = L4_3
      L6_3, L7_3, L8_3, L9_3, L10_3 = L6_3(L7_3, L8_3, L9_3)
      L5_3(L6_3, L7_3, L8_3, L9_3, L10_3)
    end
  end
  L9_2 = 1
  L10_2 = L6_2
  L11_2 = 1
  for L12_2 = L9_2, L10_2, L11_2 do
    L7_2 = L7_2 + 1
    A0_2 = L5_2[L12_2]
    L13_2 = RegisterCommand
    L14_2 = A0_2
    L15_2 = L8_2
    if L3_2 then
      L16_2 = true
      if L16_2 then
        goto lbl_93
      end
    end
    L16_2 = false
    ::lbl_93::
    L13_2(L14_2, L15_2, L16_2)
    if A1_2 then
      L13_2 = "/%s"
      L14_2 = L13_2
      L13_2 = L13_2.format
      L15_2 = A0_2
      L13_2 = L13_2(L14_2, L15_2)
      A1_2.name = L13_2
      A1_2.restricted = nil
      L13_2 = L6_1
      L13_2[L7_2] = A1_2
      if L12_2 ~= L6_2 and 1 ~= L6_2 then
        L13_2 = table
        L13_2 = L13_2.clone
        L14_2 = A1_2
        L13_2 = L13_2(L14_2)
        A1_2 = L13_2
      end
      L13_2 = L7_1
      if L13_2 then
        L13_2 = L0_1
        L14_2 = "chat:addSuggestions"
        L15_2 = -1
        L16_2 = A1_2
        L13_2(L14_2, L15_2, L16_2)
      end
    end
  end
end
L8_1.addCommand = L9_1
L8_1 = exports
L9_1 = "addCommand"
L10_1 = Luxu
L10_1 = L10_1.addCommand
L8_1(L9_1, L10_1)
L8_1 = AddEventHandler
L9_1 = "playerJoining"
function L10_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = source
  L1_2 = pairs
  L2_2 = L6_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L0_1
    L8_2 = "chat:addSuggestions"
    L9_2 = L0_2
    L10_2 = L5_2
    L11_2 = L6_2.help
    L7_2(L8_2, L9_2, L10_2, L11_2)
  end
end
L8_1(L9_1, L10_1)
L8_1 = AddEventHandler
L9_1 = "playerDropped"
function L10_1()
  local L0_2, L1_2, L2_2
  L0_2 = source
  L1_2 = tostring
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L3_1
  L2_2[L1_2] = nil
end
L8_1(L9_1, L10_1)
L8_1 = require
L9_1 = "bridge.server.voice"
L8_1(L9_1)
L8_1 = require
L9_1 = "bridge.server.events"
L8_1(L9_1)
L8_1 = Luxu
L9_1 = require
L10_1 = "bridge.server.job"
L9_1 = L9_1(L10_1)
L8_1.job = L9_1
L8_1 = Luxu
L9_1 = require
L10_1 = "bridge.server.player"
L9_1 = L9_1(L10_1)
L8_1.player = L9_1
L8_1 = Luxu
L9_1 = require
L10_1 = "bridge.server.inventory"
L9_1 = L9_1(L10_1)
L8_1.inventory = L9_1
L8_1 = Luxu
L9_1 = require
L10_1 = "bridge.server.weather"
L9_1 = L9_1(L10_1)
L8_1.weather = L9_1
L8_1 = Luxu
L9_1 = require
L10_1 = "bridge.server.garage"
L9_1 = L9_1(L10_1)
L8_1.garage = L9_1
L8_1 = exports
L9_1 = "getLuxu"
function L10_1()
  local L0_2, L1_2
  L0_2 = Luxu
  return L0_2
end
L8_1(L9_1, L10_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
