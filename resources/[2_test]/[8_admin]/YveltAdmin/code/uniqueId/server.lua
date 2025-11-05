--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
UIDS = {}
UID = {}
UIDtoID = {}

RegisterServerEvent('YveltAdmin:GetInfoUniqueId')
AddEventHandler('YveltAdmin:GetInfoUniqueId', function()
    local source = source
    
	local id = YveltHelper:getIdentifier(source)
    local name = GetPlayerName(source) 
    
    MySQL.Async.fetchAll('SELECT uid FROM yvelt_uniqueid WHERE identifier = @identifier', {['@identifier'] = id}, function(players)
        if players[1] then
            id = players[1].uid
            idmia = id
            UIDS[source] = id
            UIDtoID[id] = source
            TriggerClientEvent('YveltAdmin:GetInfo', -1, UIDS, UIDtoID)
            
            name = players[1].name
            if name ~= GetPlayerName(source) then
                MySQL.Async.execute('UPDATE yvelt_uniqueid SET name = @name WHERE uid = @uid', {
                    ['@name'] = GetPlayerName(source),
                    ['@uid'] = id,
                })
            end
        else
            MySQL.Async.execute("INSERT INTO yvelt_uniqueid (name,identifier) VALUES (@name,@identifier)", {['@name'] = name, ['@identifier'] = id}, function(rowsChanged)
                if rowsChanged ~= nil then
                    MySQL.Async.fetchAll('SELECT uid FROM yvelt_uniqueid WHERE identifier = @identifier', {['@identifier'] = id}, function(players)
                        if players[1] then
                            id = players[1].uid
                            idmia = id
                            UIDS[source] = id
                            UIDtoID[id] = source
                            TriggerClientEvent('YveltAdmin:GetInfo', -1, UIDS, UIDtoID)
                        end
                    end)
                end
            end)
        end
	end)
end)

exports('getUIDfromID', function(ID)
    local id = ID
    return UIDS[id]
end)

exports('getIDfromUID', function(PUID)
    local id = PUID
    return UIDtoID[id]
end)

function UID:getUIDfromID(ID)
    local id = ID
    return UIDS[id]
end

function UID:getIDfromUID(PUID)
    local id = PUID
    return UIDtoID[id]
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
