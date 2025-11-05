--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- client_lock.lua (ajoute en haut, facultatif)
local PANIC = true
if PANIC and GetResourceState('ducratif_gate') ~= 'started' then
  -- on “gèle” ce client pour ce script: on ne lance aucune logique de la ressource
  CreateThread(function()
    while true do
      Wait(1000000) -- endormir les éventuels threads de ce client.lua
    end
  end)
end

-- client_lock.lua — ping serveur pour contrôle; bruit si refus
local RES = GetCurrentResourceName()

-- ping serveur plusieurs fois au boot (et si le mec relance)
CreateThread(function()
  for i = 1, 30 do           -- ~15s (30 * 500ms)
    TriggerServerEvent('ducratif:ck')
    Wait(500)
  end
end)

-- bruit console si refus (le kick arrive juste après)
RegisterNetEvent('ducratif:deny', function()
  local function rnd(n) return math.random(1, n) end
  local function randHex(len) local s={} for i=1,len do s[i]=string.format("%x", rnd(15)) end return table.concat(s) end
  local function randB64(len) local c="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=" local s={} for i=1,len do local j=rnd(#c) s[i]=c:sub(j,j) end return table.concat(s) end
  local function fakeErr()
    local files={"cl_boot","cl_core","bridge","ui","pipe","queue","store"} local ext={"lua","dll","so","bin"}
    return ("SCRIPT ERROR: @%s/%s.%s:%d: %s"):format(RES, files[rnd(#files)], ext[rnd(#ext)], rnd(300), "unexpected symbol near")
  end
  local t0 = GetGameTimer()
  while GetGameTimer() - t0 < 2000 do
    local m = rnd(3)
    if m==1 then print(("0x%s 0x%s"):format(randHex(32), randHex(32)))
    elseif m==2 then print(("TRACE %s :: %s"):format(randHex(6), randB64(64)))
    else print(fakeErr()) end
    Wait(30)
  end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
