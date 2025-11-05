--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- ducratif_gate/server.lua
-- Gatekeeper non-bypass: cancel immédiat + (re)start seulement si vérif OK

local API_URL   = "https://guerrerp.ovh/php-api/api/verify"
local TIMEOUTMS = 10000

-- Noms EXACTS à protéger
local PROTECTED = {
  ["jg-mechanic"] = true,
  -- ["autre-resource"] = true,
}

local ALLOWED = {} -- res -> true quand dernière vérif OK
local BUSY    = {} -- res -> true si vérif en cours (évite spam)

local function log(msg) print(("^3[Ducratif]^0 %s"):format(msg)) end

-- =========== Auto-HWID (persisté dans CE resource) ===========
local function genUUID()
  local t='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
  local seed = tonumber(tostring(os.time()):reverse():sub(1,6)) or os.time()
  math.randomseed(seed + math.random(1,999999))
  return (t:gsub('[xy]', function(c)
    local v = (c=='x') and math.random(0,15) or math.random(8,11)
    return string.format('%x', v)
  end))
end

local function ensureLocalHWID()
  local res = GetCurrentResourceName()
  local path = "ducratif_dev_hwid.txt"
  local hwid = LoadResourceFile(res, path)
  if hwid and #hwid >= 16 then return hwid end
  hwid = genUUID()
  SaveResourceFile(res, path, hwid, -1)
  log("HWID local généré: " .. hwid .. " (persisté dans " .. path .. ")")
  return hwid
end
-- =============================================================

local function verifyOnce(license, userId, apiKey, serverSecret)
  local p = promise.new()
  local payload = json.encode({ license = license, discord_user_id = userId })
  local headers = {
    ["Content-Type"]    = "application/json",
    ["x-api-key"]       = apiKey,
    ["x-server-secret"] = serverSecret,
    ["x-server-hwid"]   = ensureLocalHWID()
  }

  PerformHttpRequest(API_URL, function(code, body)
    p:resolve({ code = code, body = tostring(body or "") })
  end, "POST", payload, headers)

  SetTimeout(TIMEOUTMS, function()
    if p.state ~= 2 then p:resolve({ code = -1, body = "timeout" }) end
  end)

  local r = Citizen.Await(p)
  return r.code, r.body
end

-- export pour guard.lua (sanity check côté res protégée)
exports('IsAllowed', function(res)
  return ALLOWED[res] == true
end)

-- nettoyage
AddEventHandler("onResourceStop", function(name)
  ALLOWED[name] = nil
  BUSY[name]    = nil
end)

-- cœur: annule TOUT démarrage auto, vérifie en asynchrone, puis restart si OK
AddEventHandler("onResourceStarting", function(name)
  if not PROTECTED[name] then return end

  -- si déjà autorisé, on laisse passer
  if ALLOWED[name] then
    return
  end

  -- on annule immédiatement le démarrage (imparable)
  CancelEvent()

  -- si déjà en vérif, ne rien faire (on attend le résultat courant)
  if BUSY[name] then return end
  BUSY[name] = true

  -- lire les convars
  local license      = GetConvar("ducratif_license", "")
  local userId       = GetConvar("ducratif_user", "")
  local apiKey       = GetConvar("ducratif_apikey", "")
  local serverSecret = GetConvar("ducratif_secret", "")

  if license == "" or userId == "" or apiKey == "" or serverSecret == "" then
    log(("Config manquante (apikey/license/user/secret) pour '%s'. Démarrage bloqué."):format(name))
    BUSY[name] = nil
    return
  end

  log(("Gate '%s' → vérif en cours…"):format(name))

  CreateThread(function()
    local code, body = verifyOnce(license, userId, apiKey, serverSecret)

    if code == 200 then
      ALLOWED[name] = true
      BUSY[name]    = nil
      log(("Script by Ducratif — vérification OK. '%s' autorisé (redémarrage)."):format(name))
      -- on (re)démarre nous-mêmes; onResourceStarting sera rappelé,
      -- ALLOWED[name] étant true, on ne cancel plus.
      StartResource(name)
      return
    end

    -- KO
    if code == -1 then
      log(("Vérification: TIMEOUT (>%d ms). '%s' bloqué."):format(TIMEOUTMS, name))
    else
      log(("Vérification refusée (HTTP %s). '%s' bloqué. Réponse: %s"):format(code, name, body))
    end
    ALLOWED[name] = nil
    BUSY[name]    = nil
  end)
end)


-- Re-check toutes les 10 min : si une licence devient KO, on stop la res protégée
CreateThread(function()
  while true do
    Wait(10 * 60 * 1000)
    for name, allowed in pairs(ALLOWED) do
      if allowed then
        -- relance la séquence onResourceStarting/verify via un restart 'soft'
        -- (si toujours OK, le gate laissera passer; sinon, elle restera bloquée)
        StartResource(name)
      end
    end
  end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
