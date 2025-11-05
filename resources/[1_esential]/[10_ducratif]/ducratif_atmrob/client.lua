--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local Config = Config

local atmModels = {}
for _, name in ipairs(Config.ATMModels) do
    table.insert(atmModels, GetHashKey(name))
end

local function loadAnim(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(10)
        end
    end
end

local function playAnim()
    local ped = PlayerPedId()
    if Config.Animation.type == 'scenario' then
        TaskStartScenarioInPlace(ped, Config.Animation.scenario, 0, true)
    else
        loadAnim(Config.Animation.dict)
        TaskPlayAnim(ped, Config.Animation.dict, Config.Animation.clip, 1.0, 1.0, Config.ProgressDuration, Config.Animation.flag or 49, 0, false, false, false)
    end
end

local function stopAnim()
    local ped = PlayerPedId()
    ClearPedTasks(ped)
    ClearPedTasksImmediately(ped)
end

local currentAtmKey = nil

local function startMinigame(atmKey)
    currentAtmKey = atmKey
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        timeLimit = Config.Minigame.TimeLimit or 20000
    })
end

RegisterNUICallback('minigame:end', function(data, cb)
    SetNuiFocus(false, false)
    local success = data and data.success
    if success then
        TriggerServerEvent('ducratif_atmrob:onSuccess', currentAtmKey)
    else
        TriggerServerEvent('ducratif_atmrob:onFail', currentAtmKey, 'minigame_failed')
    end
    currentAtmKey = nil
    cb(1)
end)

local function vecToKey(v)
    return string.format('%.2f,%.2f,%.2f', v.x, v.y, v.z)
end

local function StartAtmRobbery(entity)
    local coords = GetEntityCoords(entity)
    local atmKey = vecToKey(coords)

    local ok, reason, cooldownLeft = lib.callback.await('ducratif_atmrob:canStart', false, atmKey, GetEntityModel(entity), {x=coords.x, y=coords.y, z=coords.z})
    if not ok then
        local desc = reason or 'Action impossible.'
        if cooldownLeft then
            desc = string.format('%s (%d sec)', desc, math.floor(cooldownLeft))
        end
        lib.notify({title='ATM', description=desc, type='error'})
        return
    end

    -- Progress pré-hack
    playAnim()
    local progressed = lib.progressBar({
        duration = Config.ProgressDuration,
        label = Config.ProgressLabel,
        useWhileDead = false,
        canCancel = true,
        disable = { move = true, car = true, mouse = false, combat = true }
    })
    stopAnim()

    if not progressed then
        lib.notify({title='ATM', description='Action annulée.', type='warning'})
        TriggerServerEvent('ducratif_atmrob:logCancel', atmKey, 'progress_cancelled')
        return
    end

    -- Lance le minijeu
    startMinigame(atmKey)
end

-- Anti-doublon pour ox_target
local _atmTargetAdded = false
local function registerATMTarget()
    if _atmTargetAdded then return end
    exports.ox_target:addModel(atmModels, {
        {
            name = 'ducratif_atmrob_start',
            label = Config.TargetLabel,
            icon = 'fa-solid fa-sack-dollar',
            distance = 1.6,
            onSelect = function(data)
                if data and data.entity then
                    StartAtmRobbery(data.entity)
                end
            end
        }
    })
    _atmTargetAdded = true
end


AddEventHandler('onResourceStart', function(resName)
    if resName ~= GetCurrentResourceName() then return end
    registerATMTarget()
end)


-- Sécurité: si le script est (re)chargé en cours
CreateThread(function()
    Wait(500)
    registerATMTarget()
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
