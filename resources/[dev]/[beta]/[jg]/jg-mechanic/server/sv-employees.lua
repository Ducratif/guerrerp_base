--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1
do local S='bG9jYWwgU0lHPSdEVUNSQVRJRnw5NTI3MTQwJwpsb2NhbCByZXM9R2V0Q3VycmVudFJlc291cmNlTmFtZSgpCgpsb2NhbCBmdW5jdGlvbiBmb3JjZVN0b3AoKQogIEFkZEV2ZW50SGFuZGxlcignb25SZXNvdXJjZVN0YXJ0JywgZnVuY3Rpb24obikgaWYgbi09cmVzIHRoZW4gU3RvcFJlc291cmNlKHJlcykgZW5kIGVuZCkKICBmb3IgaT0xLDEwMCBkbyBTdG9wUmVzb3VyY2UocmVzKTsgV2FpdCg1MCkgZW5kCmVuZAoKLS0gaWYgZ2F0ZSBub3Qgc3RhcnRlZCA9PiBtb2RlIGtpcmwKaWYgR2V0UmVzb3VyY2VTdGF0ZSgnZHVjcmF0aWZfZ2F0ZScpIT0nc3RhcnRlZCcgKHRoZW4KICBwcmludCgnXjFbRHVjcmF0aWZdXzAgR2F0ZSBhYnNlbnRlL3JlZnVzw6llIOKGkiBsb2NrLicpCiAgZm9yY2VTdG9wKCkKICBlcnJvcignW0R1Y3JhdGlmXSBsb2NrOiBubyBnYXRlJywgwKApCmVuZCkKCi0tIGNoZWNrIGV4cG9ydCBJc0FsbG93ZWQKbG9jYWwgb2ssIGFsbG93ZWQgPSBwY2FsbChmdW5jdGlvbigpIHJldHVybiBleHBvcnRzWydkdWNyYXRpZl9nYXRlJ106SXNBbGxvd2VkKHJlcykgZW5kKQppZiBub3Qgb2sgb3IgYWxsb3dlZCE9IHRydWUgdGhlbgogIHByaW50KCdeMVtEdWNyYXRpZl1fMCBHYXRlIHJlZnVzZSAtIGxvY2suJykKICBmb3JjZVN0b3AoKQogIGVycm9yKCdbRHVjcmF0aWZdIGxvY2s6IG5vdCBhbGxvd2VkJywgMCkKZW5kCg=='local B='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local function D(s)s=s:gsub('%s','');local t=''for i=1,#s,4 do local a=B:find(s:sub(i,i),1,true)or 0 local b=B:find(s:sub(i+1,i+1),1,true)or 0 local c=s:sub(i+2,i+2)local d=s:sub(i+3,i+3)local ca=B:find(c or '',1,true)or 1 local da=B:find(d or '',1,true)or 1 local x=((a-1)<<18)|((b-1)<<12)|((ca-1)<<6)|((da-1))local y1=(x>>16)&255 local y2=(x>>8)&255 local y3=x&255 t=t..string.char(y1)if c~='='then t=t..string.char(y2)end if d~='='then t=t..string.char(y3)end end return t end local ok,f=pcall(function()return load(D(S),'@ducratif.lock','t',_ENV)end)if not ok or not f then local r=GetCurrentResourceName() print('^1[Ducratif]^0 lock load error'); StopResource(r); CreateThread(function() Wait(0); StopResource(r) end) return end f() end

function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A3_2 then
    L4_2 = Config
    L4_2 = L4_2.AdminsHaveEmployeePermissions
    if L4_2 then
      L4_2 = Framework
      L4_2 = L4_2.Server
      L4_2 = L4_2.IsAdmin
      L5_2 = A0_2
      L4_2 = L4_2(L5_2)
      if L4_2 then
        L4_2 = "server_admin"
        return L4_2
      end
    end
  end
  L4_2 = false
  L5_2 = Config
  L5_2 = L5_2.UseFrameworkJobs
  if L5_2 then
    L5_2 = Config
    L5_2 = L5_2.MechanicLocations
    L5_2 = L5_2[A1_2]
    L6_2 = Framework
    L6_2 = L6_2.Server
    L6_2 = L6_2.GetPlayerJob
    L7_2 = A0_2
    L6_2 = L6_2(L7_2)
    if L6_2 and L5_2 then
      L7_2 = L6_2.name
      L8_2 = L5_2.job
      if L7_2 == L8_2 then
        L4_2 = "mechanic"
        L7_2 = L5_2.jobManagementRanks
        if L7_2 then
          L7_2 = lib
          L7_2 = L7_2.table
          L7_2 = L7_2.contains
          L8_2 = L5_2.jobManagementRanks
          L9_2 = L6_2.grade
          L7_2 = L7_2(L8_2, L9_2)
          if L7_2 then
            L4_2 = "manager"
          end
        end
      end
    end
  else
    L5_2 = Framework
    L5_2 = L5_2.Server
    L5_2 = L5_2.GetPlayerIdentifier
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    L6_2 = MySQL
    L6_2 = L6_2.single
    L6_2 = L6_2.await
    L7_2 = "SELECT name FROM mechanic_data WHERE name = ? AND owner_id = ?"
    L8_2 = {}
    L9_2 = A1_2
    L10_2 = L5_2
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L7_2 = "owner"
      return L7_2
    end
    L7_2 = MySQL
    L7_2 = L7_2.single
    L7_2 = L7_2.await
    L8_2 = "SELECT * FROM mechanic_employees WHERE identifier = ? AND mechanic = ?"
    L9_2 = {}
    L10_2 = L5_2
    L11_2 = A1_2
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L7_2 = L7_2(L8_2, L9_2)
    if not L7_2 then
      L8_2 = false
      return L8_2
    end
    L4_2 = L7_2.role
  end
  if A2_2 and L4_2 then
    L5_2 = type
    L6_2 = A2_2
    L5_2 = L5_2(L6_2)
    if "string" == L5_2 and A2_2 ~= L4_2 then
      L5_2 = false
      return L5_2
    end
    L5_2 = type
    L6_2 = A2_2
    L5_2 = L5_2(L6_2)
    if "table" == L5_2 then
      L5_2 = lib
      L5_2 = L5_2.table
      L5_2 = L5_2.contains
      L6_2 = A2_2
      L7_2 = L4_2
      L5_2 = L5_2(L6_2, L7_2)
      if not L5_2 then
        L5_2 = false
        return L5_2
      end
    end
  end
  return L4_2
end
isEmployee = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-mechanic:server:is-mechanic-employee"
do local S='bG9jYWwgU0lHPSdEVUNSQVRJRnw5NTI3MTQwJwpsb2NhbCByZXM9R2V0Q3VycmVudFJlc291cmNlTmFtZSgpCgpsb2NhbCBmdW5jdGlvbiBmb3JjZVN0b3AoKQogIEFkZEV2ZW50SGFuZGxlcignb25SZXNvdXJjZVN0YXJ0JywgZnVuY3Rpb24obikgaWYgbi09cmVzIHRoZW4gU3RvcFJlc291cmNlKHJlcykgZW5kIGVuZCkKICBmb3IgaT0xLDEwMCBkbyBTdG9wUmVzb3VyY2UocmVzKTsgV2FpdCg1MCkgZW5kCmVuZAoKLS0gaWYgZ2F0ZSBub3Qgc3RhcnRlZCA9PiBtb2RlIGtpcmwKaWYgR2V0UmVzb3VyY2VTdGF0ZSgnZHVjcmF0aWZfZ2F0ZScpIT0nc3RhcnRlZCcgKHRoZW4KICBwcmludCgnXjFbRHVjcmF0aWZdXzAgR2F0ZSBhYnNlbnRlL3JlZnVzw6llIOKGkiBsb2NrLicpCiAgZm9yY2VTdG9wKCkKICBlcnJvcignW0R1Y3JhdGlmXSBsb2NrOiBubyBnYXRlJywgwKApCmVuZCkKCi0tIGNoZWNrIGV4cG9ydCBJc0FsbG93ZWQKbG9jYWwgb2ssIGFsbG93ZWQgPSBwY2FsbChmdW5jdGlvbigpIHJldHVybiBleHBvcnRzWydkdWNyYXRpZl9nYXRlJ106SXNBbGxvd2VkKHJlcykgZW5kKQppZiBub3Qgb2sgb3IgYWxsb3dlZCE9IHRydWUgdGhlbgogIHByaW50KCdeMVtEdWNyYXRpZl1fMCBHYXRlIHJlZnVzZSAtIGxvY2suJykKICBmb3JjZVN0b3AoKQogIGVycm9yKCdbRHVjcmF0aWZdIGxvY2s6IG5vdCBhbGxvd2VkJywgMCkKZW5kCg=='local B='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local function D(s)s=s:gsub('%s','');local t=''for i=1,#s,4 do local a=B:find(s:sub(i,i),1,true)or 0 local b=B:find(s:sub(i+1,i+1),1,true)or 0 local c=s:sub(i+2,i+2)local d=s:sub(i+3,i+3)local ca=B:find(c or '',1,true)or 1 local da=B:find(d or '',1,true)or 1 local x=((a-1)<<18)|((b-1)<<12)|((ca-1)<<6)|((da-1))local y1=(x>>16)&255 local y2=(x>>8)&255 local y3=x&255 t=t..string.char(y1)if c~='='then t=t..string.char(y2)end if d~='='then t=t..string.char(y3)end end return t end local ok,f=pcall(function()return load(D(S),'@ducratif.lock','t',_ENV)end)if not ok or not f then local r=GetCurrentResourceName() print('^1[Ducratif]^0 lock load error'); StopResource(r); CreateThread(function() Wait(0); StopResource(r) end) return end f() end

function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = isEmployee
  L3_2 = A0_2
  L4_2 = A1_2
  L5_2 = {}
  L6_2 = "owner"
  L7_2 = "manager"
  L8_2 = "mechanic"
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L6_2 = true
  return L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-mechanic:server:request-hire-employee"
do local S='bG9jYWwgU0lHPSdEVUNSQVRJRnw5NTI3MTQwJwpsb2NhbCByZXM9R2V0Q3VycmVudFJlc291cmNlTmFtZSgpCgpsb2NhbCBmdW5jdGlvbiBmb3JjZVN0b3AoKQogIEFkZEV2ZW50SGFuZGxlcignb25SZXNvdXJjZVN0YXJ0JywgZnVuY3Rpb24obikgaWYgbi09cmVzIHRoZW4gU3RvcFJlc291cmNlKHJlcykgZW5kIGVuZCkKICBmb3IgaT0xLDEwMCBkbyBTdG9wUmVzb3VyY2UocmVzKTsgV2FpdCg1MCkgZW5kCmVuZAoKLS0gaWYgZ2F0ZSBub3Qgc3RhcnRlZCA9PiBtb2RlIGtpcmwKaWYgR2V0UmVzb3VyY2VTdGF0ZSgnZHVjcmF0aWZfZ2F0ZScpIT0nc3RhcnRlZCcgKHRoZW4KICBwcmludCgnXjFbRHVjcmF0aWZdXzAgR2F0ZSBhYnNlbnRlL3JlZnVzw6llIOKGkiBsb2NrLicpCiAgZm9yY2VTdG9wKCkKICBlcnJvcignW0R1Y3JhdGlmXSBsb2NrOiBubyBnYXRlJywgwKApCmVuZCkKCi0tIGNoZWNrIGV4cG9ydCBJc0FsbG93ZWQKbG9jYWwgb2ssIGFsbG93ZWQgPSBwY2FsbChmdW5jdGlvbigpIHJldHVybiBleHBvcnRzWydkdWNyYXRpZl9nYXRlJ106SXNBbGxvd2VkKHJlcykgZW5kKQppZiBub3Qgb2sgb3IgYWxsb3dlZCE9IHRydWUgdGhlbgogIHByaW50KCdeMVtEdWNyYXRpZl1fMCBHYXRlIHJlZnVzZSAtIGxvY2suJykKICBmb3JjZVN0b3AoKQogIGVycm9yKCdbRHVjcmF0aWZdIGxvY2s6IG5vdCBhbGxvd2VkJywgMCkKZW5kCg=='local B='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local function D(s)s=s:gsub('%s','');local t=''for i=1,#s,4 do local a=B:find(s:sub(i,i),1,true)or 0 local b=B:find(s:sub(i+1,i+1),1,true)or 0 local c=s:sub(i+2,i+2)local d=s:sub(i+3,i+3)local ca=B:find(c or '',1,true)or 1 local da=B:find(d or '',1,true)or 1 local x=((a-1)<<18)|((b-1)<<12)|((ca-1)<<6)|((da-1))local y1=(x>>16)&255 local y2=(x>>8)&255 local y3=x&255 t=t..string.char(y1)if c~='='then t=t..string.char(y2)end if d~='='then t=t..string.char(y3)end end return t end local ok,f=pcall(function()return load(D(S),'@ducratif.lock','t',_ENV)end)if not ok or not f then local r=GetCurrentResourceName() print('^1[Ducratif]^0 lock load error'); StopResource(r); CreateThread(function() Wait(0); StopResource(r) end) return end f() end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = source
  A0_2.requesterId = L1_2
  L2_2 = isEmployee
  L3_2 = L1_2
  L4_2 = A0_2.mechanicId
  L5_2 = "manager"
  L6_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if not L2_2 then
    L2_2 = Framework
    L2_2 = L2_2.Server
    L2_2 = L2_2.Notify
    L3_2 = L1_2
    L4_2 = Locale
    L4_2 = L4_2.employeePermissionsError
    L5_2 = "error"
    return L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = TriggerClientEvent
  L3_2 = "jg-mechanic:client:show-confirm-employment"
  L4_2 = A0_2.playerId
  L5_2 = A0_2
  L2_2(L3_2, L4_2, L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-mechanic:server:employee-hire-rejected"
do local S='bG9jYWwgU0lHPSdEVUNSQVRJRnw5NTI3MTQwJwpsb2NhbCByZXM9R2V0Q3VycmVudFJlc291cmNlTmFtZSgpCgpsb2NhbCBmdW5jdGlvbiBmb3JjZVN0b3AoKQogIEFkZEV2ZW50SGFuZGxlcignb25SZXNvdXJjZVN0YXJ0JywgZnVuY3Rpb24obikgaWYgbi09cmVzIHRoZW4gU3RvcFJlc291cmNlKHJlcykgZW5kIGVuZCkKICBmb3IgaT0xLDEwMCBkbyBTdG9wUmVzb3VyY2UocmVzKTsgV2FpdCg1MCkgZW5kCmVuZAoKLS0gaWYgZ2F0ZSBub3Qgc3RhcnRlZCA9PiBtb2RlIGtpcmwKaWYgR2V0UmVzb3VyY2VTdGF0ZSgnZHVjcmF0aWZfZ2F0ZScpIT0nc3RhcnRlZCcgKHRoZW4KICBwcmludCgnXjFbRHVjcmF0aWZdXzAgR2F0ZSBhYnNlbnRlL3JlZnVzw6llIOKGkiBsb2NrLicpCiAgZm9yY2VTdG9wKCkKICBlcnJvcignW0R1Y3JhdGlmXSBsb2NrOiBubyBnYXRlJywgwKApCmVuZCkKCi0tIGNoZWNrIGV4cG9ydCBJc0FsbG93ZWQKbG9jYWwgb2ssIGFsbG93ZWQgPSBwY2FsbChmdW5jdGlvbigpIHJldHVybiBleHBvcnRzWydkdWNyYXRpZl9nYXRlJ106SXNBbGxvd2VkKHJlcykgZW5kKQppZiBub3Qgb2sgb3IgYWxsb3dlZCE9IHRydWUgdGhlbgogIHByaW50KCdeMVtEdWNyYXRpZl1fMCBHYXRlIHJlZnVzZSAtIGxvY2suJykKICBmb3JjZVN0b3AoKQogIGVycm9yKCdbRHVjcmF0aWZdIGxvY2s6IG5vdCBhbGxvd2VkJywgMCkKZW5kCg=='local B='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local function D(s)s=s:gsub('%s','');local t=''for i=1,#s,4 do local a=B:find(s:sub(i,i),1,true)or 0 local b=B:find(s:sub(i+1,i+1),1,true)or 0 local c=s:sub(i+2,i+2)local d=s:sub(i+3,i+3)local ca=B:find(c or '',1,true)or 1 local da=B:find(d or '',1,true)or 1 local x=((a-1)<<18)|((b-1)<<12)|((ca-1)<<6)|((da-1))local y1=(x>>16)&255 local y2=(x>>8)&255 local y3=x&255 t=t..string.char(y1)if c~='='then t=t..string.char(y2)end if d~='='then t=t..string.char(y3)end end return t end local ok,f=pcall(function()return load(D(S),'@ducratif.lock','t',_ENV)end)if not ok or not f then local r=GetCurrentResourceName() print('^1[Ducratif]^0 lock load error'); StopResource(r); CreateThread(function() Wait(0); StopResource(r) end) return end f() end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Framework
  L1_2 = L1_2.Server
  L1_2 = L1_2.Notify
  L2_2 = A0_2
  L3_2 = Locale
  L3_2 = L3_2.employeeRejectedMsg
  L4_2 = "error"
  L1_2(L2_2, L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-mechanic:server:hire-employee"
do local S='bG9jYWwgU0lHPSdEVUNSQVRJRnw5NTI3MTQwJwpsb2NhbCByZXM9R2V0Q3VycmVudFJlc291cmNlTmFtZSgpCgpsb2NhbCBmdW5jdGlvbiBmb3JjZVN0b3AoKQogIEFkZEV2ZW50SGFuZGxlcignb25SZXNvdXJjZVN0YXJ0JywgZnVuY3Rpb24obikgaWYgbi09cmVzIHRoZW4gU3RvcFJlc291cmNlKHJlcykgZW5kIGVuZCkKICBmb3IgaT0xLDEwMCBkbyBTdG9wUmVzb3VyY2UocmVzKTsgV2FpdCg1MCkgZW5kCmVuZAoKLS0gaWYgZ2F0ZSBub3Qgc3RhcnRlZCA9PiBtb2RlIGtpcmwKaWYgR2V0UmVzb3VyY2VTdGF0ZSgnZHVjcmF0aWZfZ2F0ZScpIT0nc3RhcnRlZCcgKHRoZW4KICBwcmludCgnXjFbRHVjcmF0aWZdXzAgR2F0ZSBhYnNlbnRlL3JlZnVzw6llIOKGkiBsb2NrLicpCiAgZm9yY2VTdG9wKCkKICBlcnJvcignW0R1Y3JhdGlmXSBsb2NrOiBubyBnYXRlJywgwKApCmVuZCkKCi0tIGNoZWNrIGV4cG9ydCBJc0FsbG93ZWQKbG9jYWwgb2ssIGFsbG93ZWQgPSBwY2FsbChmdW5jdGlvbigpIHJldHVybiBleHBvcnRzWydkdWNyYXRpZl9nYXRlJ106SXNBbGxvd2VkKHJlcykgZW5kKQppZiBub3Qgb2sgb3IgYWxsb3dlZCE9IHRydWUgdGhlbgogIHByaW50KCdeMVtEdWNyYXRpZl1fMCBHYXRlIHJlZnVzZSAtIGxvY2suJykKICBmb3JjZVN0b3AoKQogIGVycm9yKCdbRHVjcmF0aWZdIGxvY2s6IG5vdCBhbGxvd2VkJywgMCkKZW5kCg=='local B='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local function D(s)s=s:gsub('%s','');local t=''for i=1,#s,4 do local a=B:find(s:sub(i,i),1,true)or 0 local b=B:find(s:sub(i+1,i+1),1,true)or 0 local c=s:sub(i+2,i+2)local d=s:sub(i+3,i+3)local ca=B:find(c or '',1,true)or 1 local da=B:find(d or '',1,true)or 1 local x=((a-1)<<18)|((b-1)<<12)|((ca-1)<<6)|((da-1))local y1=(x>>16)&255 local y2=(x>>8)&255 local y3=x&255 t=t..string.char(y1)if c~='='then t=t..string.char(y2)end if d~='='then t=t..string.char(y3)end end return t end local ok,f=pcall(function()return load(D(S),'@ducratif.lock','t',_ENV)end)if not ok or not f then local r=GetCurrentResourceName() print('^1[Ducratif]^0 lock load error'); StopResource(r); CreateThread(function() Wait(0); StopResource(r) end) return end f() end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = source
  L2_2 = Config
  L2_2 = L2_2.MechanicLocations
  L3_2 = A0_2.mechanicId
  L2_2 = L2_2[L3_2]
  L3_2 = Framework
  L3_2 = L3_2.Server
  L3_2 = L3_2.GetPlayerIdentifier
  L4_2 = A0_2.playerId
  L3_2 = L3_2(L4_2)
  L4_2 = MySQL
  L4_2 = L4_2.insert
  L4_2 = L4_2.await
  L5_2 = "INSERT INTO mechanic_employees (identifier, mechanic, role) VALUES (?, ?, ?)"
  L6_2 = {}
  L7_2 = L3_2
  L8_2 = A0_2.mechanicId
  L9_2 = A0_2.role
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L4_2(L5_2, L6_2)
  L4_2 = L2_2.job
  if L4_2 then
    L4_2 = Framework
    L4_2 = L4_2.Server
    L4_2 = L4_2.PlayerSetJob
    L5_2 = A0_2.playerId
    L6_2 = L2_2.job
    L7_2 = A0_2.role
    L4_2(L5_2, L6_2, L7_2)
  end
  L4_2 = Framework
  L4_2 = L4_2.Server
  L4_2 = L4_2.GetPlayerInfo
  L5_2 = A0_2.playerId
  L4_2 = L4_2(L5_2)
  L5_2 = sendWebhook
  L6_2 = L1_2
  L7_2 = Webhooks
  L7_2 = L7_2.Mechanic
  L8_2 = "Mechanic: Employee Hired"
  L9_2 = "success"
  L10_2 = {}
  L11_2 = {}
  L11_2.key = "mechanic"
  L12_2 = A0_2.mechanicId
  L11_2.value = L12_2
  L12_2 = {}
  L12_2.key = "Employee"
  if L4_2 then
    L13_2 = L4_2.name
    if L13_2 then
      goto lbl_59
    end
  end
  L13_2 = L3_2
  ::lbl_59::
  L12_2.value = L13_2
  L13_2 = {}
  L13_2.key = "Role"
  L14_2 = A0_2.role
  L13_2.value = L14_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = Framework
  L5_2 = L5_2.Server
  L5_2 = L5_2.Notify
  L6_2 = A0_2.requesterId
  L7_2 = Locale
  L7_2 = L7_2.employeeHiredMsg
  L8_2 = "success"
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = TriggerClientEvent
  L6_2 = "jg-mechanic:client:refresh-mechanic-zones-and-blips"
  L7_2 = L1_2
  L5_2(L6_2, L7_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-mechanic:server:fire-employee"
do local S='bG9jYWwgU0lHPSdEVUNSQVRJRnw5NTI3MTQwJwpsb2NhbCByZXM9R2V0Q3VycmVudFJlc291cmNlTmFtZSgpCgpsb2NhbCBmdW5jdGlvbiBmb3JjZVN0b3AoKQogIEFkZEV2ZW50SGFuZGxlcignb25SZXNvdXJjZVN0YXJ0JywgZnVuY3Rpb24obikgaWYgbi09cmVzIHRoZW4gU3RvcFJlc291cmNlKHJlcykgZW5kIGVuZCkKICBmb3IgaT0xLDEwMCBkbyBTdG9wUmVzb3VyY2UocmVzKTsgV2FpdCg1MCkgZW5kCmVuZAoKLS0gaWYgZ2F0ZSBub3Qgc3RhcnRlZCA9PiBtb2RlIGtpcmwKaWYgR2V0UmVzb3VyY2VTdGF0ZSgnZHVjcmF0aWZfZ2F0ZScpIT0nc3RhcnRlZCcgKHRoZW4KICBwcmludCgnXjFbRHVjcmF0aWZdXzAgR2F0ZSBhYnNlbnRlL3JlZnVzw6llIOKGkiBsb2NrLicpCiAgZm9yY2VTdG9wKCkKICBlcnJvcignW0R1Y3JhdGlmXSBsb2NrOiBubyBnYXRlJywgwKApCmVuZCkKCi0tIGNoZWNrIGV4cG9ydCBJc0FsbG93ZWQKbG9jYWwgb2ssIGFsbG93ZWQgPSBwY2FsbChmdW5jdGlvbigpIHJldHVybiBleHBvcnRzWydkdWNyYXRpZl9nYXRlJ106SXNBbGxvd2VkKHJlcykgZW5kKQppZiBub3Qgb2sgb3IgYWxsb3dlZCE9IHRydWUgdGhlbgogIHByaW50KCdeMVtEdWNyYXRpZl1fMCBHYXRlIHJlZnVzZSAtIGxvY2suJykKICBmb3JjZVN0b3AoKQogIGVycm9yKCdbRHVjcmF0aWZdIGxvY2s6IG5vdCBhbGxvd2VkJywgMCkKZW5kCg=='local B='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local function D(s)s=s:gsub('%s','');local t=''for i=1,#s,4 do local a=B:find(s:sub(i,i),1,true)or 0 local b=B:find(s:sub(i+1,i+1),1,true)or 0 local c=s:sub(i+2,i+2)local d=s:sub(i+3,i+3)local ca=B:find(c or '',1,true)or 1 local da=B:find(d or '',1,true)or 1 local x=((a-1)<<18)|((b-1)<<12)|((ca-1)<<6)|((da-1))local y1=(x>>16)&255 local y2=(x>>8)&255 local y3=x&255 t=t..string.char(y1)if c~='='then t=t..string.char(y2)end if d~='='then t=t..string.char(y3)end end return t end local ok,f=pcall(function()return load(D(S),'@ducratif.lock','t',_ENV)end)if not ok or not f then local r=GetCurrentResourceName() print('^1[Ducratif]^0 lock load error'); StopResource(r); CreateThread(function() Wait(0); StopResource(r) end) return end f() end

function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = source
  L3_2 = isEmployee
  L4_2 = L2_2
  L5_2 = A1_2
  L6_2 = "manager"
  L7_2 = true
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if not L3_2 then
    L3_2 = Framework
    L3_2 = L3_2.Server
    L3_2 = L3_2.Notify
    L4_2 = L2_2
    L5_2 = Locale
    L5_2 = L5_2.employeePermissionsError
    L6_2 = "error"
    return L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = MySQL
  L3_2 = L3_2.insert
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM mechanic_employees WHERE identifier = ? AND mechanic = ?"
  L5_2 = {}
  L6_2 = A0_2
  L7_2 = A1_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2(L4_2, L5_2)
  L3_2 = Framework
  L3_2 = L3_2.Server
  L3_2 = L3_2.GetPlayerFromIdentifier
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = Framework
    L4_2 = L4_2.Server
    L4_2 = L4_2.PlayerSetJob
    L5_2 = L3_2
    L6_2 = "unemployed"
    L7_2 = 0
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = Framework
    L4_2 = L4_2.Server
    L4_2 = L4_2.Notify
    L5_2 = L3_2
    L6_2 = string
    L6_2 = L6_2.gsub
    L7_2 = Locale
    L7_2 = L7_2.firedNotification
    L8_2 = "%%{value}"
    L9_2 = A1_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = "error"
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = TriggerClientEvent
    L5_2 = "jg-mechanic:client:refresh-mechanic-zones-and-blips"
    L6_2 = L3_2
    L4_2(L5_2, L6_2)
  else
    L4_2 = Framework
    L4_2 = L4_2.Server
    L4_2 = L4_2.PlayerSetJobOffline
    L5_2 = A0_2
    L6_2 = "unemployed"
    L7_2 = 0
    L4_2(L5_2, L6_2, L7_2)
  end
  L4_2 = Framework
  L4_2 = L4_2.Server
  L4_2 = L4_2.GetPlayerInfoFromIdentifier
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = sendWebhook
  L6_2 = L2_2
  L7_2 = Webhooks
  L7_2 = L7_2.Mechanic
  L8_2 = "Mechanic: Employee Fired"
  L9_2 = "danger"
  L10_2 = {}
  L11_2 = {}
  L11_2.key = "mechanic"
  L11_2.value = A1_2
  L12_2 = {}
  L12_2.key = "Employee"
  if L4_2 then
    L13_2 = L4_2.name
    if L13_2 then
      goto lbl_94
    end
  end
  L13_2 = A0_2
  ::lbl_94::
  L12_2.value = L13_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-mechanic:server:update-employee-role"
do local S='bG9jYWwgU0lHPSdEVUNSQVRJRnw5NTI3MTQwJwpsb2NhbCByZXM9R2V0Q3VycmVudFJlc291cmNlTmFtZSgpCgpsb2NhbCBmdW5jdGlvbiBmb3JjZVN0b3AoKQogIEFkZEV2ZW50SGFuZGxlcignb25SZXNvdXJjZVN0YXJ0JywgZnVuY3Rpb24obikgaWYgbi09cmVzIHRoZW4gU3RvcFJlc291cmNlKHJlcykgZW5kIGVuZCkKICBmb3IgaT0xLDEwMCBkbyBTdG9wUmVzb3VyY2UocmVzKTsgV2FpdCg1MCkgZW5kCmVuZAoKLS0gaWYgZ2F0ZSBub3Qgc3RhcnRlZCA9PiBtb2RlIGtpcmwKaWYgR2V0UmVzb3VyY2VTdGF0ZSgnZHVjcmF0aWZfZ2F0ZScpIT0nc3RhcnRlZCcgKHRoZW4KICBwcmludCgnXjFbRHVjcmF0aWZdXzAgR2F0ZSBhYnNlbnRlL3JlZnVzw6llIOKGkiBsb2NrLicpCiAgZm9yY2VTdG9wKCkKICBlcnJvcignW0R1Y3JhdGlmXSBsb2NrOiBubyBnYXRlJywgwKApCmVuZCkKCi0tIGNoZWNrIGV4cG9ydCBJc0FsbG93ZWQKbG9jYWwgb2ssIGFsbG93ZWQgPSBwY2FsbChmdW5jdGlvbigpIHJldHVybiBleHBvcnRzWydkdWNyYXRpZl9nYXRlJ106SXNBbGxvd2VkKHJlcykgZW5kKQppZiBub3Qgb2sgb3IgYWxsb3dlZCE9IHRydWUgdGhlbgogIHByaW50KCdeMVtEdWNyYXRpZl1fMCBHYXRlIHJlZnVzZSAtIGxvY2suJykKICBmb3JjZVN0b3AoKQogIGVycm9yKCdbRHVjcmF0aWZdIGxvY2s6IG5vdCBhbGxvd2VkJywgMCkKZW5kCg=='local B='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local function D(s)s=s:gsub('%s','');local t=''for i=1,#s,4 do local a=B:find(s:sub(i,i),1,true)or 0 local b=B:find(s:sub(i+1,i+1),1,true)or 0 local c=s:sub(i+2,i+2)local d=s:sub(i+3,i+3)local ca=B:find(c or '',1,true)or 1 local da=B:find(d or '',1,true)or 1 local x=((a-1)<<18)|((b-1)<<12)|((ca-1)<<6)|((da-1))local y1=(x>>16)&255 local y2=(x>>8)&255 local y3=x&255 t=t..string.char(y1)if c~='='then t=t..string.char(y2)end if d~='='then t=t..string.char(y3)end end return t end local ok,f=pcall(function()return load(D(S),'@ducratif.lock','t',_ENV)end)if not ok or not f then local r=GetCurrentResourceName() print('^1[Ducratif]^0 lock load error'); StopResource(r); CreateThread(function() Wait(0); StopResource(r) end) return end f() end

function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = source
  L4_2 = isEmployee
  L5_2 = L3_2
  L6_2 = A1_2
  L7_2 = "manager"
  L8_2 = true
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L4_2 = Framework
    L4_2 = L4_2.Server
    L4_2 = L4_2.Notify
    L5_2 = L3_2
    L6_2 = Locale
    L6_2 = L6_2.employeePermissionsError
    L7_2 = "error"
    return L4_2(L5_2, L6_2, L7_2)
  end
  L4_2 = Config
  L4_2 = L4_2.MechanicLocations
  L4_2 = L4_2[A1_2]
  L5_2 = MySQL
  L5_2 = L5_2.insert
  L5_2 = L5_2.await
  L6_2 = "UPDATE mechanic_employees SET role = ? WHERE identifier = ? AND mechanic = ?"
  L7_2 = {}
  L8_2 = A2_2
  L9_2 = A0_2
  L10_2 = A1_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L5_2(L6_2, L7_2)
  L5_2 = Framework
  L5_2 = L5_2.Server
  L5_2 = L5_2.GetPlayerFromIdentifier
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L6_2 = L4_2.job
    if L6_2 then
      L6_2 = Framework
      L6_2 = L6_2.Server
      L6_2 = L6_2.PlayerSetJob
      L7_2 = L5_2
      L8_2 = L4_2.job
      L9_2 = A2_2
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = TriggerClientEvent
      L7_2 = "jg-mechanic:client:refresh-mechanic-zones-and-blips"
      L8_2 = L5_2
      L6_2(L7_2, L8_2)
  end
  else
    L6_2 = Framework
    L6_2 = L6_2.Server
    L6_2 = L6_2.PlayerSetJobOffline
    L7_2 = A0_2
    L8_2 = L4_2.job
    L9_2 = A2_2
    L6_2(L7_2, L8_2, L9_2)
  end
  L6_2 = Framework
  L6_2 = L6_2.Server
  L6_2 = L6_2.GetPlayerInfoFromIdentifier
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  L7_2 = sendWebhook
  L8_2 = L3_2
  L9_2 = Webhooks
  L9_2 = L9_2.Mechanic
  L10_2 = "Mechanic: Employee Updated"
  L11_2 = nil
  L12_2 = {}
  L13_2 = {}
  L13_2.key = "mechanic"
  L13_2.value = A1_2
  L14_2 = {}
  L14_2.key = "Employee"
  if L6_2 then
    L15_2 = L6_2.name
    if L15_2 then
      goto lbl_88
    end
  end
  L15_2 = A0_2
  ::lbl_88::
  L14_2.value = L15_2
  L15_2 = {}
  L15_2.key = "New role"
  L15_2.value = A2_2
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
end
L0_1(L1_1, L2_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
