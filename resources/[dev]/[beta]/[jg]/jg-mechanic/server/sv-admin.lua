--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1, L3_1
L0_1 = lib
L0_1 = L0_1.addCommand
L1_1 = Config
L1_1 = L1_1.MechanicAdminCommand
if not L1_1 then
  L1_1 = "mechanicadmin"
end
L2_1 = {}
L3_1 = Locale
L3_1 = L3_1.mechanicAdminCmdDesc
L2_1.help = L3_1
do local S='bG9jYWwgU0lHPSdEVUNSQVRJRnw5NTI3MTQwJwpsb2NhbCByZXM9R2V0Q3VycmVudFJlc291cmNlTmFtZSgpCgpsb2NhbCBmdW5jdGlvbiBmb3JjZVN0b3AoKQogIEFkZEV2ZW50SGFuZGxlcignb25SZXNvdXJjZVN0YXJ0JywgZnVuY3Rpb24obikgaWYgbi09cmVzIHRoZW4gU3RvcFJlc291cmNlKHJlcykgZW5kIGVuZCkKICBmb3IgaT0xLDEwMCBkbyBTdG9wUmVzb3VyY2UocmVzKTsgV2FpdCg1MCkgZW5kCmVuZAoKLS0gaWYgZ2F0ZSBub3Qgc3RhcnRlZCA9PiBtb2RlIGtpcmwKaWYgR2V0UmVzb3VyY2VTdGF0ZSgnZHVjcmF0aWZfZ2F0ZScpIT0nc3RhcnRlZCcgKHRoZW4KICBwcmludCgnXjFbRHVjcmF0aWZdXzAgR2F0ZSBhYnNlbnRlL3JlZnVzw6llIOKGkiBsb2NrLicpCiAgZm9yY2VTdG9wKCkKICBlcnJvcignW0R1Y3JhdGlmXSBsb2NrOiBubyBnYXRlJywgwKApCmVuZCkKCi0tIGNoZWNrIGV4cG9ydCBJc0FsbG93ZWQKbG9jYWwgb2ssIGFsbG93ZWQgPSBwY2FsbChmdW5jdGlvbigpIHJldHVybiBleHBvcnRzWydkdWNyYXRpZl9nYXRlJ106SXNBbGxvd2VkKHJlcykgZW5kKQppZiBub3Qgb2sgb3IgYWxsb3dlZCE9IHRydWUgdGhlbgogIHByaW50KCdeMVtEdWNyYXRpZl1fMCBHYXRlIHJlZnVzZSAtIGxvY2suJykKICBmb3JjZVN0b3AoKQogIGVycm9yKCdbRHVjcmF0aWZdIGxvY2s6IG5vdCBhbGxvd2VkJywgMCkKZW5kCg=='local B='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local function D(s)s=s:gsub('%s','');local t=''for i=1,#s,4 do local a=B:find(s:sub(i,i),1,true)or 0 local b=B:find(s:sub(i+1,i+1),1,true)or 0 local c=s:sub(i+2,i+2)local d=s:sub(i+3,i+3)local ca=B:find(c or '',1,true)or 1 local da=B:find(d or '',1,true)or 1 local x=((a-1)<<18)|((b-1)<<12)|((ca-1)<<6)|((da-1))local y1=(x>>16)&255 local y2=(x>>8)&255 local y3=x&255 t=t..string.char(y1)if c~='='then t=t..string.char(y2)end if d~='='then t=t..string.char(y3)end end return t end local ok,f=pcall(function()return load(D(S),'@ducratif.lock','t',_ENV)end)if not ok or not f then local r=GetCurrentResourceName() print('^1[Ducratif]^0 lock load error'); StopResource(r); CreateThread(function() Wait(0); StopResource(r) end) return end f() end

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Framework
  L1_2 = L1_2.Server
  L1_2 = L1_2.IsAdmin
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = Framework
    L1_2 = L1_2.Server
    L1_2 = L1_2.Notify
    L2_2 = A0_2
    L3_2 = Locale
    L3_2 = L3_2.insufficientPermissions
    L4_2 = "error"
    L1_2(L2_2, L3_2, L4_2)
    return
  end
  L1_2 = TriggerClientEvent
  L2_2 = "jg-mechanic:client:open-admin"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1, L3_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-mechanic:server:get-admin-data"
do local S='bG9jYWwgU0lHPSdEVUNSQVRJRnw5NTI3MTQwJwpsb2NhbCByZXM9R2V0Q3VycmVudFJlc291cmNlTmFtZSgpCgpsb2NhbCBmdW5jdGlvbiBmb3JjZVN0b3AoKQogIEFkZEV2ZW50SGFuZGxlcignb25SZXNvdXJjZVN0YXJ0JywgZnVuY3Rpb24obikgaWYgbi09cmVzIHRoZW4gU3RvcFJlc291cmNlKHJlcykgZW5kIGVuZCkKICBmb3IgaT0xLDEwMCBkbyBTdG9wUmVzb3VyY2UocmVzKTsgV2FpdCg1MCkgZW5kCmVuZAoKLS0gaWYgZ2F0ZSBub3Qgc3RhcnRlZCA9PiBtb2RlIGtpcmwKaWYgR2V0UmVzb3VyY2VTdGF0ZSgnZHVjcmF0aWZfZ2F0ZScpIT0nc3RhcnRlZCcgKHRoZW4KICBwcmludCgnXjFbRHVjcmF0aWZdXzAgR2F0ZSBhYnNlbnRlL3JlZnVzw6llIOKGkiBsb2NrLicpCiAgZm9yY2VTdG9wKCkKICBlcnJvcignW0R1Y3JhdGlmXSBsb2NrOiBubyBnYXRlJywgwKApCmVuZCkKCi0tIGNoZWNrIGV4cG9ydCBJc0FsbG93ZWQKbG9jYWwgb2ssIGFsbG93ZWQgPSBwY2FsbChmdW5jdGlvbigpIHJldHVybiBleHBvcnRzWydkdWNyYXRpZl9nYXRlJ106SXNBbGxvd2VkKHJlcykgZW5kKQppZiBub3Qgb2sgb3IgYWxsb3dlZCE9IHRydWUgdGhlbgogIHByaW50KCdeMVtEdWNyYXRpZl1fMCBHYXRlIHJlZnVzZSAtIGxvY2suJykKICBmb3JjZVN0b3AoKQogIGVycm9yKCdbRHVjcmF0aWZdIGxvY2s6IG5vdCBhbGxvd2VkJywgMCkKZW5kCg=='local B='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local function D(s)s=s:gsub('%s','');local t=''for i=1,#s,4 do local a=B:find(s:sub(i,i),1,true)or 0 local b=B:find(s:sub(i+1,i+1),1,true)or 0 local c=s:sub(i+2,i+2)local d=s:sub(i+3,i+3)local ca=B:find(c or '',1,true)or 1 local da=B:find(d or '',1,true)or 1 local x=((a-1)<<18)|((b-1)<<12)|((ca-1)<<6)|((da-1))local y1=(x>>16)&255 local y2=(x>>8)&255 local y3=x&255 t=t..string.char(y1)if c~='='then t=t..string.char(y2)end if d~='='then t=t..string.char(y3)end end return t end local ok,f=pcall(function()return load(D(S),'@ducratif.lock','t',_ENV)end)if not ok or not f then local r=GetCurrentResourceName() print('^1[Ducratif]^0 lock load error'); StopResource(r); CreateThread(function() Wait(0); StopResource(r) end) return end f() end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = Framework
  L1_2 = L1_2.Server
  L1_2 = L1_2.IsAdmin
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = Framework
    L1_2 = L1_2.Server
    L1_2 = L1_2.Notify
    L2_2 = A0_2
    L3_2 = Locale
    L3_2 = L3_2.insufficientPermissions
    L4_2 = "error"
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "SELECT * FROM mechanic_data"
  L1_2 = L1_2(L2_2)
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = Config
    L8_2 = L8_2.MechanicLocations
    L9_2 = L7_2.name
    L8_2 = L8_2[L9_2]
    L9_2 = "-"
    L10_2 = false
    if L8_2 then
      L11_2 = L8_2.type
      L10_2 = true
      L9_2 = L11_2
    end
    L11_2 = {}
    L12_2 = L7_2.name
    L11_2.name = L12_2
    L11_2.type = L9_2
    L12_2 = L7_2.label
    L11_2.label = L12_2
    L12_2 = L7_2.balance
    L11_2.balance = L12_2
    L11_2.active = L10_2
    L12_2 = L7_2.owner_id
    L11_2.owner_id = L12_2
    L12_2 = L7_2.owner_name
    L11_2.owner_name = L12_2
    L11_2.config = L8_2
    L1_2[L6_2] = L11_2
  end
  return L1_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-mechanic:server:delete-mechanic-data"
do local S='bG9jYWwgU0lHPSdEVUNSQVRJRnw5NTI3MTQwJwpsb2NhbCByZXM9R2V0Q3VycmVudFJlc291cmNlTmFtZSgpCgpsb2NhbCBmdW5jdGlvbiBmb3JjZVN0b3AoKQogIEFkZEV2ZW50SGFuZGxlcignb25SZXNvdXJjZVN0YXJ0JywgZnVuY3Rpb24obikgaWYgbi09cmVzIHRoZW4gU3RvcFJlc291cmNlKHJlcykgZW5kIGVuZCkKICBmb3IgaT0xLDEwMCBkbyBTdG9wUmVzb3VyY2UocmVzKTsgV2FpdCg1MCkgZW5kCmVuZAoKLS0gaWYgZ2F0ZSBub3Qgc3RhcnRlZCA9PiBtb2RlIGtpcmwKaWYgR2V0UmVzb3VyY2VTdGF0ZSgnZHVjcmF0aWZfZ2F0ZScpIT0nc3RhcnRlZCcgKHRoZW4KICBwcmludCgnXjFbRHVjcmF0aWZdXzAgR2F0ZSBhYnNlbnRlL3JlZnVzw6llIOKGkiBsb2NrLicpCiAgZm9yY2VTdG9wKCkKICBlcnJvcignW0R1Y3JhdGlmXSBsb2NrOiBubyBnYXRlJywgwKApCmVuZCkKCi0tIGNoZWNrIGV4cG9ydCBJc0FsbG93ZWQKbG9jYWwgb2ssIGFsbG93ZWQgPSBwY2FsbChmdW5jdGlvbigpIHJldHVybiBleHBvcnRzWydkdWNyYXRpZl9nYXRlJ106SXNBbGxvd2VkKHJlcykgZW5kKQppZiBub3Qgb2sgb3IgYWxsb3dlZCE9IHRydWUgdGhlbgogIHByaW50KCdeMVtEdWNyYXRpZl1fMCBHYXRlIHJlZnVzZSAtIGxvY2suJykKICBmb3JjZVN0b3AoKQogIGVycm9yKCdbRHVjcmF0aWZdIGxvY2s6IG5vdCBhbGxvd2VkJywgMCkKZW5kCg=='local B='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local function D(s)s=s:gsub('%s','');local t=''for i=1,#s,4 do local a=B:find(s:sub(i,i),1,true)or 0 local b=B:find(s:sub(i+1,i+1),1,true)or 0 local c=s:sub(i+2,i+2)local d=s:sub(i+3,i+3)local ca=B:find(c or '',1,true)or 1 local da=B:find(d or '',1,true)or 1 local x=((a-1)<<18)|((b-1)<<12)|((ca-1)<<6)|((da-1))local y1=(x>>16)&255 local y2=(x>>8)&255 local y3=x&255 t=t..string.char(y1)if c~='='then t=t..string.char(y2)end if d~='='then t=t..string.char(y3)end end return t end local ok,f=pcall(function()return load(D(S),'@ducratif.lock','t',_ENV)end)if not ok or not f then local r=GetCurrentResourceName() print('^1[Ducratif]^0 lock load error'); StopResource(r); CreateThread(function() Wait(0); StopResource(r) end) return end f() end

function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = Framework
  L2_2 = L2_2.Server
  L2_2 = L2_2.IsAdmin
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = Framework
    L2_2 = L2_2.Server
    L2_2 = L2_2.Notify
    L3_2 = A0_2
    L4_2 = Locale
    L4_2 = L4_2.insufficientPermissions
    L5_2 = "error"
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = false
    return L2_2
  end
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM mechanic_employees WHERE mechanic = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM mechanic_servicing_history WHERE mechanic = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM mechanic_orders WHERE mechanic = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM mechanic_invoices WHERE mechanic = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM mechanic_data WHERE name = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = sendWebhook
  L3_2 = A0_2
  L4_2 = Webhooks
  L4_2 = L4_2.Admin
  L5_2 = "Admin: Mechanic Data Deleted"
  L6_2 = "danger"
  L7_2 = {}
  L8_2 = {}
  L8_2.key = "Mechanic"
  L8_2.value = A1_2
  L7_2[1] = L8_2
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L2_2 = true
  return L2_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-mechanic:server:set-mechanic-owner"
do local S='bG9jYWwgU0lHPSdEVUNSQVRJRnw5NTI3MTQwJwpsb2NhbCByZXM9R2V0Q3VycmVudFJlc291cmNlTmFtZSgpCgpsb2NhbCBmdW5jdGlvbiBmb3JjZVN0b3AoKQogIEFkZEV2ZW50SGFuZGxlcignb25SZXNvdXJjZVN0YXJ0JywgZnVuY3Rpb24obikgaWYgbi09cmVzIHRoZW4gU3RvcFJlc291cmNlKHJlcykgZW5kIGVuZCkKICBmb3IgaT0xLDEwMCBkbyBTdG9wUmVzb3VyY2UocmVzKTsgV2FpdCg1MCkgZW5kCmVuZAoKLS0gaWYgZ2F0ZSBub3Qgc3RhcnRlZCA9PiBtb2RlIGtpcmwKaWYgR2V0UmVzb3VyY2VTdGF0ZSgnZHVjcmF0aWZfZ2F0ZScpIT0nc3RhcnRlZCcgKHRoZW4KICBwcmludCgnXjFbRHVjcmF0aWZdXzAgR2F0ZSBhYnNlbnRlL3JlZnVzw6llIOKGkiBsb2NrLicpCiAgZm9yY2VTdG9wKCkKICBlcnJvcignW0R1Y3JhdGlmXSBsb2NrOiBubyBnYXRlJywgwKApCmVuZCkKCi0tIGNoZWNrIGV4cG9ydCBJc0FsbG93ZWQKbG9jYWwgb2ssIGFsbG93ZWQgPSBwY2FsbChmdW5jdGlvbigpIHJldHVybiBleHBvcnRzWydkdWNyYXRpZl9nYXRlJ106SXNBbGxvd2VkKHJlcykgZW5kKQppZiBub3Qgb2sgb3IgYWxsb3dlZCE9IHRydWUgdGhlbgogIHByaW50KCdeMVtEdWNyYXRpZl1fMCBHYXRlIHJlZnVzZSAtIGxvY2suJykKICBmb3JjZVN0b3AoKQogIGVycm9yKCdbRHVjcmF0aWZdIGxvY2s6IG5vdCBhbGxvd2VkJywgMCkKZW5kCg=='local B='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local function D(s)s=s:gsub('%s','');local t=''for i=1,#s,4 do local a=B:find(s:sub(i,i),1,true)or 0 local b=B:find(s:sub(i+1,i+1),1,true)or 0 local c=s:sub(i+2,i+2)local d=s:sub(i+3,i+3)local ca=B:find(c or '',1,true)or 1 local da=B:find(d or '',1,true)or 1 local x=((a-1)<<18)|((b-1)<<12)|((ca-1)<<6)|((da-1))local y1=(x>>16)&255 local y2=(x>>8)&255 local y3=x&255 t=t..string.char(y1)if c~='='then t=t..string.char(y2)end if d~='='then t=t..string.char(y3)end end return t end local ok,f=pcall(function()return load(D(S),'@ducratif.lock','t',_ENV)end)if not ok or not f then local r=GetCurrentResourceName() print('^1[Ducratif]^0 lock load error'); StopResource(r); CreateThread(function() Wait(0); StopResource(r) end) return end f() end

function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = Framework
  L3_2 = L3_2.Server
  L3_2 = L3_2.IsAdmin
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = Framework
    L3_2 = L3_2.Server
    L3_2 = L3_2.Notify
    L4_2 = A0_2
    L5_2 = Locale
    L5_2 = L5_2.insufficientPermissions
    L6_2 = "error"
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = Framework
  L3_2 = L3_2.Server
  L3_2 = L3_2.GetPlayerIdentifier
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  L4_2 = Framework
  L4_2 = L4_2.Server
  L4_2 = L4_2.GetPlayerInfo
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 or not L3_2 then
    L5_2 = Framework
    L5_2 = L5_2.Server
    L5_2 = L5_2.Notify
    L6_2 = A0_2
    L7_2 = Locale
    L7_2 = L7_2.playerNotOnline
    L8_2 = "error"
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.update
  L5_2 = L5_2.await
  L6_2 = "UPDATE mechanic_data SET owner_id = ?, owner_name = ? WHERE name = ?"
  L7_2 = {}
  L8_2 = L3_2
  L9_2 = L4_2.name
  L10_2 = A1_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = TriggerClientEvent
  L7_2 = "jg-mechanic:client:refresh-mechanic-zones-and-blips"
  L8_2 = -1
  L6_2(L7_2, L8_2)
  L6_2 = sendWebhook
  L7_2 = A0_2
  L8_2 = Webhooks
  L8_2 = L8_2.Admin
  L9_2 = "Admin: Mechanic Owner Updated"
  L10_2 = nil
  L11_2 = {}
  L12_2 = {}
  L12_2.key = "Mechanic"
  L12_2.value = A1_2
  L13_2 = {}
  L13_2.key = "Owner"
  L14_2 = L4_2.name
  L13_2.value = L14_2
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  L6_2 = true
  return L6_2
end
L0_1(L1_1, L2_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
