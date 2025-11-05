--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-mechanic:server:dyno-share-with-player"
do local S='bG9jYWwgU0lHPSdEVUNSQVRJRnw5NTI3MTQwJwpsb2NhbCByZXM9R2V0Q3VycmVudFJlc291cmNlTmFtZSgpCgpsb2NhbCBmdW5jdGlvbiBmb3JjZVN0b3AoKQogIEFkZEV2ZW50SGFuZGxlcignb25SZXNvdXJjZVN0YXJ0JywgZnVuY3Rpb24obikgaWYgbi09cmVzIHRoZW4gU3RvcFJlc291cmNlKHJlcykgZW5kIGVuZCkKICBmb3IgaT0xLDEwMCBkbyBTdG9wUmVzb3VyY2UocmVzKTsgV2FpdCg1MCkgZW5kCmVuZAoKLS0gaWYgZ2F0ZSBub3Qgc3RhcnRlZCA9PiBtb2RlIGtpcmwKaWYgR2V0UmVzb3VyY2VTdGF0ZSgnZHVjcmF0aWZfZ2F0ZScpIT0nc3RhcnRlZCcgKHRoZW4KICBwcmludCgnXjFbRHVjcmF0aWZdXzAgR2F0ZSBhYnNlbnRlL3JlZnVzw6llIOKGkiBsb2NrLicpCiAgZm9yY2VTdG9wKCkKICBlcnJvcignW0R1Y3JhdGlmXSBsb2NrOiBubyBnYXRlJywgwKApCmVuZCkKCi0tIGNoZWNrIGV4cG9ydCBJc0FsbG93ZWQKbG9jYWwgb2ssIGFsbG93ZWQgPSBwY2FsbChmdW5jdGlvbigpIHJldHVybiBleHBvcnRzWydkdWNyYXRpZl9nYXRlJ106SXNBbGxvd2VkKHJlcykgZW5kKQppZiBub3Qgb2sgb3IgYWxsb3dlZCE9IHRydWUgdGhlbgogIHByaW50KCdeMVtEdWNyYXRpZl1fMCBHYXRlIHJlZnVzZSAtIGxvY2suJykKICBmb3JjZVN0b3AoKQogIGVycm9yKCdbRHVjcmF0aWZdIGxvY2s6IG5vdCBhbGxvd2VkJywgMCkKZW5kCg=='local B='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local function D(s)s=s:gsub('%s','');local t=''for i=1,#s,4 do local a=B:find(s:sub(i,i),1,true)or 0 local b=B:find(s:sub(i+1,i+1),1,true)or 0 local c=s:sub(i+2,i+2)local d=s:sub(i+3,i+3)local ca=B:find(c or '',1,true)or 1 local da=B:find(d or '',1,true)or 1 local x=((a-1)<<18)|((b-1)<<12)|((ca-1)<<6)|((da-1))local y1=(x>>16)&255 local y2=(x>>8)&255 local y3=x&255 t=t..string.char(y1)if c~='='then t=t..string.char(y2)end if d~='='then t=t..string.char(y3)end end return t end local ok,f=pcall(function()return load(D(S),'@ducratif.lock','t',_ENV)end)if not ok or not f then local r=GetCurrentResourceName() print('^1[Ducratif]^0 lock load error'); StopResource(r); CreateThread(function() Wait(0); StopResource(r) end) return end f() end

function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = Player
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.state
  if L3_2 then
    L4_2 = L3_2.isBusy
    if L4_2 then
      L4_2 = Framework
      L4_2 = L4_2.Server
      L4_2 = L4_2.Notify
      L5_2 = A0_2
      L6_2 = Locale
      L6_2 = L6_2.playerIsBusy
      L7_2 = "error"
      L4_2(L5_2, L6_2, L7_2)
      L4_2 = false
      return L4_2
    end
  end
  L4_2 = TriggerClientEvent
  L5_2 = "jg-mechanic:client:dyno-show-results-sheet"
  L6_2 = A1_2
  L7_2 = A2_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = true
  return L4_2
end
L0_1(L1_1, L2_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
