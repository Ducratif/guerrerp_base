--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports["es_extended"]:getSharedObject()

local grades = {}
local staff = {}
local perms = Config.Permissions

function LoadGrades()
    local result = MySQL.query.await("SELECT * FROM admin_grades")
    grades = {}
    for _, row in ipairs(result) do
        row.permissions = json.decode(row.permissions)
        grades[row.id] = row
    end
end

function LoadStaff()
    local result = MySQL.query.await("SELECT * FROM admin_staff")
    staff = {}
    for _, row in ipairs(result) do
        staff[row.identifier] = row
    end
end

CreateThread(function()
    -- Boot, création grade ROI s'il existe pas
    local roi = MySQL.single.await("SELECT * FROM admin_grades WHERE name = 'roi'")
    if not roi then
        MySQL.insert('INSERT INTO admin_grades (name, label, color, permissions, created_by) VALUES (?,?,?,?,?)', {
            "roi", "ROI", "#ffcc00", json.encode("*"), Config.ROIIdentifier
        })
    end
    LoadGrades()
    -- Auto assign le grade roi à ton identifier
    if Config.ROIIdentifier then
        local stf = MySQL.single.await('SELECT * FROM admin_staff WHERE identifier = ?', {Config.ROIIdentifier})
        if not stf then
            MySQL.insert('INSERT INTO admin_staff (identifier, grade_id) VALUES (?, (SELECT id FROM admin_grades WHERE name="roi"))', {Config.ROIIdentifier})
        end
    end
    LoadStaff()
end)

function HasPerm(identifier, perm)
    local stf = staff[identifier]
    if not stf then return false end
    local grade = grades[stf.grade_id]
    if not grade then return false end
    if grade.permissions == "*" then return true end
    for _, p in ipairs(grade.permissions) do
        if p == perm then return true end
    end
    return false
end

-- -------------------
-- CALLBACKS / ACTIONS
-- -------------------

lib.callback.register('adminmenu:getStaffInfos', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return {success=false, msg="Non connecté"} end
    local stf = staff[xPlayer.identifier]
    if not stf then return {success=false, msg="Non staff"} end
    local grade = grades[stf.grade_id]
    return {
        success = true,
        staff = stf,
        grade = grade,
        perms = (grade.permissions == "*" and perms) or (function(list) local out = {}; for _,p in ipairs(list) do out[p]=perms[p]; end; return out end)(grade.permissions)
    }
end)

lib.callback.register('adminmenu:getPlayers', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not HasPerm(xPlayer.identifier, "kick_player") then return {success=false, msg="Pas la perm"} end
    local players = {}
    for _,ply in pairs(ESX.GetPlayers()) do
        local xP = ESX.GetPlayerFromId(ply)
        table.insert(players, {
            id = ply, name = xP.getName(), job = xP.getJob().label, money = xP.getMoney(), bank = xP.getAccount('bank').money, identifier = xP.identifier
        })
    end
    return {success=true, players=players}
end)

lib.callback.register('adminmenu:kickPlayer', function(source, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not HasPerm(xPlayer.identifier, "kick_player") then return {success=false, msg="Pas la perm"} end
    if not data.target or not data.reason then return {success=false, msg="Manque infos"} end
    DropPlayer(data.target, '[ADMIN] Kick: '..data.reason)
    MySQL.insert('INSERT INTO admin_logs (staff_identifier, staff_name, target_identifier, action, details) VALUES (?,?,?,?,?)', {xPlayer.identifier, xPlayer.getName(), data.target, "kick_player", data.reason})
    return {success=true}
end)

lib.callback.register('adminmenu:banPlayer', function(source, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not HasPerm(xPlayer.identifier, "ban_player") then return {success=false, msg="Pas la perm"} end
    -- À intégrer avec ton système de ban, genre EasyAdmin, ou propre à toi
    -- EXEMPLE SIMPLE (met à jour la DB, gère la déco, ajoute le log)
    -- À toi d'intégrer ton ban réel ici.
    return {success=true, msg="Ban fonction à compléter selon ton système"}
end)

-- Le même principe pour toutes les autres actions CRUD staff, CRUD grades, vehicles, logs, settings etc.

RegisterNetEvent('adminmenu:reloadAll')
AddEventHandler('adminmenu:reloadAll', function()
    LoadGrades()
    LoadStaff()
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
