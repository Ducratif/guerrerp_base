--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterCommand('clearkeys', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.setInventoryItem('carkey', 0)

        -- Notification avec ox_lib côté client
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Garage',
            description = 'Toutes les clés ont été supprimées de votre inventaire.',
            type = 'info',
            duration = 5000
        })
    end
end)



lib.locale()


local vehiculos = {}

function Crearvehiculo(model, coordinates, heading, props, source, puertas, TaskInCar)
    local entity = CreateVehicleServerSetter(model, "automobile", coordinates.x, coordinates.y, coordinates.z, heading)
    Wait(100)

    while not DoesEntityExist(entity) do
        Wait(0)
    end

    if TaskInCar then
        if Garage.SetInToVehicle then
            TaskWarpPedIntoVehicle(GetPlayerPed(source), entity, -1)
        end
    end

    local network = NetworkGetNetworkIdFromEntity(entity)
    Wait(200)

    local netid = NetworkGetEntityFromNetworkId(network)
    
    if Garage.Debug then
        print(("VEH: %s, NET: %s,NID: %s"):format(entity, network, netid)) 
    end
    
    vehiculos[network] = source

    local state = Entity(netid)

    Wait(1000)

    if vehiculos[network] == source then
        state.state.Mods = props
    end

    SetVehicleDoorsLocked(entity, puertas)

end


lib.callback.register('LeDjo_Garage:getOwnerVehicles', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local vehicles = {}

    local results = MySQL.Sync.fetchAll(
        "SELECT * FROM `owned_vehicles` WHERE `owner` = @identifier OR `amigos` LIKE @like_identifier", {
            ['@identifier'] = identifier,
            ['@like_identifier'] = '%' .. identifier .. '%',
        })

    if results[1] ~= nil then
        for i = 1, #results do
            local result = results[i]
            local veh = json.decode(result.vehicle)
            veh.plate = result.plate
            veh.parking = result.parking
            veh.stored = result.stored
            veh.pound = result.pound
            veh.mileage = result.mileage
            veh.type = result.type
            veh.id = identifier
            veh.duen = result.owner
            veh.amigos = result.amigos
            veh.props = result.vehicle

            local isFriend = false
            if amigos ~= nil then
                for j = 1, #amigos do
                    local amigo = amigos[j]
                    if amigo == identifier then
                        isFriend = true
                        break
                    end
                end
            end
            if result.owner == identifier or isFriend then
                veh.owned = true
                vehicles[#vehicles + 1] = veh
            end
        end
    end

    -- vehiculo compartido
    local sharedResults = MySQL.Sync.fetchAll(
        "SELECT * FROM `owned_vehicles` WHERE JSON_CONTAINS(`amigos`, @identifier, '$')", {
            ['@identifier'] = json.encode({ identifier = identifier }),
        })

    if sharedResults[1] ~= nil then
        for i = 1, #sharedResults do
            local result = sharedResults[i]
            local veh = json.decode(result.vehicle)
            veh.plate = result.plate
            veh.parking = result.parking
            veh.stored = result.stored
            veh.pound = result.pound
            veh.mileage = result.mileage
            veh.type = result.type
            veh.id = identifier
            veh.duen = result.owner
            veh.amigos = json.decode(result.amigos)
            veh.props = result.vehicle
            --AGregar vehiculo si esta compartido a la lista.
            if result.owner ~= identifier then
                veh.owned = false
                vehicles[#vehicles + 1] = veh
            end
        end
    end



    return vehicles
end)


lib.callback.register('LeDjo_Garage:owner_vehicles', function(source)
    local vehicles = {}
    local results = MySQL.Sync.fetchAll("SELECT * FROM `owned_vehicles`")
    if results[1] ~= nil then
        for i = 1, #results do
            local result = results[i]
            local veh = json.decode(result.vehicle)

            veh.plate = result.plate
            veh.parking = result.parking
            veh.stored = result.stored
            veh.pound = result.pound
            veh.mileage = result.mileage
            veh.type = result.type
            veh.owner = result.owner
            veh.vehicle = result.vehicle
            veh.lastposition = result.lastposition

            vehicles[#vehicles + 1] = veh

            if Garage.Debug then
                print('Matrícula:', veh.plate, 'Modelo:', veh.model, 'positiom: ', veh.lastposition)
            end
        end

        return vehicles
    end
end)

RegisterServerEvent('LeDjo_Garage:EliminarAmigo', function(Amigo, plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xIndidentifier = xPlayer.getIdentifier()
    MySQL.Async.fetchAll(
        "SELECT `amigos` FROM `owned_vehicles` WHERE `owner` = @identifier AND `plate` = @plate", {
            ['@identifier'] = xIndidentifier,
            ['@plate'] = plate
        }, function(result)
            if result[1] ~= nil then
                local amigosTable = {}
                if result[1].amigos ~= nil and result[1].amigos ~= '' then
                    amigosTable = json.decode(result[1].amigos)
                end
                local found = false
                for i, amigo in ipairs(amigosTable) do
                    if amigo.name == Amigo then
                        table.remove(amigosTable, i)
                        found = true
                        break
                    end
                end
                if found then
                    local amigosStr = json.encode(amigosTable)

                    if #amigosTable == 0 then
                        amigosStr = nil
                    end

                    MySQL.Async.execute(
                        "UPDATE `owned_vehicles` SET `amigos` = @amigos WHERE `owner` = @identifier AND `plate` = @plate",
                        {
                            ['@identifier'] = xIndidentifier,
                            ['@plate'] = plate,
                            ['@amigos'] = amigosStr
                        }, function(rowsChanged)
                            if rowsChanged > 0 then
                                TriggerClientEvent('LeDjo_Garage:Notification', source,
                                    locale('AmigosLista1', Amigo, plate))
                            else
                                TriggerClientEvent('LeDjo_Garage:Notification', source,
                                    locale('AmigosLista2', Amigo, plate))
                            end
                        end)
                else
                    if Garage.Debug then
                        print('No se encontró al amigo ' .. Amigo .. ' en el vehículo con la matricula ' .. plate)
                    end
                end
            else
                if Garage.Debug then
                    print('No se pudo encontrar el vehículo con la matricula ' .. plate)
                end
            end
        end)
end)




RegisterServerEvent('LeDjo_Garage:CompartirAmigo', function(Amigo, Name, plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xIndidentifier = xPlayer.getIdentifier()

    local xAmigo = ESX.GetPlayerFromId(Amigo)
    local identifier = xAmigo.getIdentifier()

    if identifier == xIndidentifier then
        TriggerClientEvent('LeDjo_Garage:Notification', source, locale('noatimismo'))
        return
    end

    MySQL.Async.fetchAll(
        "SELECT `amigos` FROM `owned_vehicles` WHERE `owner` = @identifier AND `plate` = @plate", {
            ['@identifier'] = xIndidentifier,
            ['@plate'] = plate
        }, function(result)
            if result[1] ~= nil then
                local amigosTable = {}
                if result[1].amigos ~= nil and result[1].amigos ~= '' then
                    amigosTable = json.decode(result[1].amigos)
                end
                local amigoData = { name = Name, identifier = identifier }
                amigosTable[#amigosTable + 1] = amigoData
                local amigosStr = json.encode(amigosTable)


                MySQL.Async.execute(
                    "UPDATE `owned_vehicles` SET `amigos` = @amigos WHERE `owner` = @identifier AND `plate` = @plate",
                    {
                        ['@identifier'] = xIndidentifier,
                        ['@plate'] = plate,
                        ['@amigos'] = amigosStr
                    }, function(rowsChanged)
                        if rowsChanged > 0 then
                            TriggerClientEvent('LeDjo_Garage:Notification', source,
                                locale('AmigosLista3', plate, xAmigo.getName()))
                            TriggerClientEvent('LeDjo_Garage:Notification', xAmigo.source, locale('AmigosLista4', plate))
                        else
                            TriggerClientEvent('LeDjo_Garage:Notification', source,
                                locale('AmigosLista5', xAmigo.getName()))
                        end
                    end)
            else
                if Garage.Debug then
                    print('No se pudo encontrar el vehículo con la matricula ' .. plate)
                end
            end
        end)
end)


RegisterServerEvent('LeDjo_Garage:GuardarVehiculo', function(plate, vehicleData, garageName, vehicle)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local vehicleDataDecoded = json.decode(vehicleData)
    local vehicleDataEncoded = json.encode(vehicleDataDecoded)
    local encontrado = false
    local vehicles = MySQL.Sync.fetchAll("SELECT * FROM `owned_vehicles`")
    for i = 1, #vehicles do
        local data = vehicles[i]
        local stored = data.stored
        local parking = garageName
        if stored ~= 1 then
            stored = 1
        end
        local amigos = json.decode(data.amigos) or {}

        if plate == string.gsub(data.plate, "^%s*(.-)%s*$", "%1") then
            if data.owner == identifier then -- propriété
                MySQL.Async.execute(
                    "UPDATE `owned_vehicles` SET `vehicle` = @vehicleData, `stored` = @stored, `pound` = @pound, `calle` = @calle,  `parking` = @parking WHERE `owner` = @identifier AND `plate` = @plate",
                    {
                        ['@identifier'] = identifier,
                        ['@vehicleData'] = vehicleDataEncoded,
                        ['@plate'] = plate,
                        ['@stored'] = stored,
                        ['@parking'] = parking,
                        ['@calle'] = nil,
                        ['@pound'] = nil
                    },
                    function(rowsChanged)
                        if rowsChanged > 0 then
                            local vehEntity = NetworkGetEntityFromNetworkId(vehicle)
                            if vehEntity and DoesEntityExist(vehEntity) then
                                DeleteEntity(vehEntity)
                            end
                            TriggerClientEvent('LeDjo_Garage:Notification', source, locale('SERVER_VehiculoGuardado'))
                        else
                            TriggerClientEvent('LeDjo_Garage:Notification', source, locale('SERVER_ErrorGuardad'))
                        end
                    end
                )
                encontrado = true
            else
                for j = 1, #amigos do
                    local amigo = amigos[j]
                    if amigo.identifier == identifier then -- ami
                        MySQL.Async.execute(
                            "UPDATE `owned_vehicles` SET `vehicle` = @vehicleData, `stored` = @stored, `pound` = @pound, `calle` = @calle,  `parking` = @parking WHERE  `plate` = @plate",
                            {
                                ['@vehicleData'] = vehicleDataEncoded,
                                ['@plate'] = plate,
                                ['@stored'] = stored,
                                ['@parking'] = parking,
                                ['@calle'] = nil,
                                ['@pound'] = nil
                            },
                            function(rowsChanged)
                                if rowsChanged > 0 then
                                    local vehEntity = NetworkGetEntityFromNetworkId(vehicle)
                                    if vehEntity and DoesEntityExist(vehEntity) then
                                        DeleteEntity(vehEntity)
                                    end
                                    TriggerClientEvent('LeDjo_Garage:Notification', source, locale('SERVER_VehiculoGuardado'))
                                else
                                    TriggerClientEvent('LeDjo_Garage:Notification', source, locale('SERVER_ErrorGuardad'))
                                end
                            end
                        )
                        encontrado = true
                        break
                    end
                end
            end

        end
    end
    if not encontrado then
        TriggerClientEvent('LeDjo_Garage:Notification', source, locale('NoEsTuyo'))
    end
end)






lib.callback.register('LeDjo_Garage:getBankMoney', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local bank = xPlayer.getAccount("bank")
    local money = xPlayer.getMoney()
    return { bank = bank.money, money = money }
end)


RegisterServerEvent('LeDjo_Garage:RetirarVehiculo', function(plate, lastparking, pos, hea, props, model)
    local source = source
        MySQL.Async.execute(
        "UPDATE `owned_vehicles` SET `stored` = 0, `lastparking` = @lastparking, `calle` = @calle WHERE `plate` = @plate",
        {
            ['@lastparking'] = lastparking,
            ['@plate'] = plate,
            ['@calle'] = 1
        }, function(rowsChanged)
            if rowsChanged > 0 then
                Crearvehiculo(model, pos, hea, props, source, 0, true)
                TriggerClientEvent('LeDjo_Garage:Notification', source,
                    locale('SERVER_retirar'))
            else
                TriggerClientEvent('LeDjo_Garage:Notification', source,
                    locale('SERVER_ErrorRetirar'))
            end
        end)
end)



RegisterServerEvent('LeDjo_Garage:RetirarVehiculoImpound', function(plate, money, price, props, pos, hea, model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local bank = xPlayer.getAccount("bank")
    local price = price
    if money == 'money' then
        if xPlayer.getMoney() >= price then
            MySQL.Async.execute(
                "UPDATE `owned_vehicles` SET `pound` = NULL, `parking` = (SELECT `lastparking` FROM `owned_vehicles` WHERE `owner` = @identifier AND `plate` = @plate), `calle` = @calle WHERE `owner` = @identifier AND `plate` = @plate"
                ,
                {
                    ['@identifier'] = identifier,
                    ['@plate'] = plate,
                    ['@calle'] = 1
                }, function(rowsChanged)
                    if rowsChanged > 0 then
                        Crearvehiculo(model, pos, hea, props, source, 0, true)

                        xPlayer.removeAccountMoney("money", price)
                        TriggerClientEvent('LeDjo_Garage:Notification', source,
                            locale('SERVER_RetirarImpound', price))
                    else
                        TriggerClientEvent('LeDjo_Garage:Notification', source,
                            locale('SERVER_RetirarImpoundError'))
                    end
                end)
        else
            TriggerClientEvent('LeDjo_Garage:Notification', source,
                locale('SERVER_SinDinero'))
        end
    elseif money == 'bank' then
        if bank.money >= price then
            MySQL.Async.execute(
                "UPDATE `owned_vehicles` SET `pound` = NULL, `parking` = (SELECT `lastparking` FROM `owned_vehicles` WHERE `owner` = @identifier AND `plate` = @plate), `calle` = @calle WHERE `owner` = @identifier AND `plate` = @plate"
                ,
                {
                    ['@identifier'] = identifier,
                    ['@plate'] = plate,
                    ['@calle'] = 1
                }, function(rowsChanged)
                    if rowsChanged > 0 then
                        Crearvehiculo(model, pos, hea, props, source, 0, true)
                        xPlayer.removeAccountMoney("bank", price)
                        TriggerClientEvent('LeDjo_Garage:Notification', source,
                            locale('SERVER_RetirarImpound', price))
                    else
                        TriggerClientEvent('LeDjo_Garage:Notification', source,
                            locale('SERVER_RetirarImpoundError'))
                    end
                end)
        else
            TriggerClientEvent('LeDjo_Garage:Notification', source,
                locale('SERVER_SinDinero'))
        end
    end
end)

function DeleteVehicleByPlate(plate)
    local vehicles = GetAllVehicles()
    for i = 1, #vehicles, 1 do
        if GetVehicleNumberPlateText(vehicles[i]) == plate or (string.match(GetVehicleNumberPlateText(vehicles[i]), plate:gsub("%s", ".*")) ~= nil) then
            DeleteEntity(vehicles[i])
            return true
        end
    end
    return false
end

RegisterServerEvent('LeDjo_Garage:MandarVehiculoImpound', function(plate, impo)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()

    MySQL.Async.execute(
        "UPDATE `owned_vehicles` SET `parking` = @impo, `pound` = 1 WHERE `owner` = @identifier AND `plate` = @plate",
        {
            ['@identifier'] = identifier,
            ['@plate'] = plate,
            ['@impo'] = impo,
        }, function(rowsChanged)
            if rowsChanged > 0 then
                DeleteVehicleByPlate(plate)
                TriggerClientEvent('LeDjo_Garage:Notification', source, locale('SERVER_MandarVehiculoImpound'))
            else
                TriggerClientEvent('LeDjo_Garage:Notification', source, locale('SERVER_MandarMal'))
            end
        end)
end)









RegisterServerEvent('LeDjo_Garage:AgregarKilometros', function(vehPlate, km)
    local plate = vehPlate
    local newKM = km

    MySQL.Async.fetchScalar('SELECT plate FROM owned_vehicles WHERE plate = @plate', { ['@plate'] = plate },
        function(result)
            MySQL.Async.execute('UPDATE owned_vehicles SET mileage = @kms WHERE plate = @plate',
                { ['@plate'] = plate, ['@kms'] = newKM })
        end)
end)

lib.addCommand(Garage.OwnerCarAdmin.Command, {
    help = locale('setearcar2'),
    restricted = Garage.OwnerCarAdmin.Group,
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Target player\'s server id',
        },
    },
}, function(source, args)
    TriggerClientEvent('LeDjo_Garage:CheckVeh2', args.target)
end)



RegisterNetEvent('LeDjo_Garage:SetCarDB', function(vehicleData, plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == Garage.OwnerCarAdmin.Group then
        local plate = plate
        local results = MySQL.Sync.fetchAll(
            "SELECT * FROM owned_vehicles WHERE plate = @plate",
            { ['@plate'] = plate })
        if results[1] ~= nil then
            TriggerClientEvent('LeDjo_Garage:Notification', source,
                'El vehículo con placa ' .. plate .. ' ya está en propiedad.')
            if Garage.Debug then
                print('El vehículo con placa ' .. plate .. ' ya está en propiedad.')
            end
        else
            vehicleData.plate = plate
            local jsonVehicleData = json.encode(vehicleData)
            MySQL.Sync.execute(
                "INSERT INTO owned_vehicles (owner, plate, vehicle, calle) VALUES (@owner, @plate, @vehicle, @calle)",
                {
                    ['@owner'] = xPlayer.getIdentifier(),
                    ['@plate']   = plate,
                    ['@vehicle'] = jsonVehicleData,
                    ['@calle']   = nil,
                })
            TriggerClientEvent('LeDjo_Garage:Notification', source, 'El vehículo con placa ' ..
                plate .. ', ahora es de tu propiedad')
            if Garage.Debug then
                print('El vehículo con placa ' ..
                    plate .. ' ha sido agregado a las propiedades de ' .. xPlayer.getName() .. '.')
            end
        end
    else
        if Garage.Debug then
            print('El jugador ' ..
                xPlayer.getName() .. ' no tiene permisos suficientes para agregar vehículos a las propiedades.')
        end
    end
end)

if Garage.Persistent.Persitent then
    local vehiclesSpawned = {}

    AddEventHandler('playerDropped', function(reason)
        local player = source
        local xPlayer = ESX.GetPlayerFromId(player)

        if not xPlayer then
            print('[Garage] Joueur introuvable (probablement déjà déconnecté).')
            return
        end

        local charId = xPlayer.getIdentifier()
        local allVehicles = GetAllVehicles()
        local vehicles = MySQL.Sync.fetchAll("SELECT * FROM `owned_vehicles`")

        for i = 1, #allVehicles do
            local vehEntity = allVehicles[i]
            if DoesEntityExist(vehEntity) then
                local plate = GetVehicleNumberPlateText(vehEntity)

                for j = 1, #vehicles do  -- Utilisation de `j` au lieu de `i` pour éviter les conflits
                    local data = vehicles[j]

                    if data.owner == charId and data.calle == '1' and data.plate == plate then
                        local position = GetEntityCoords(vehEntity)
                        local heading = GetEntityHeading(vehEntity)
                        local doorLockStatus = GetVehicleDoorLockStatus(vehEntity)

                        local posTable = {
                            x = position.x,
                            y = position.y,
                            z = position.z,
                            h = heading,
                            doors = doorLockStatus,
                        }
                        local posStr = json.encode(posTable)

                        MySQL.Async.execute(
                            'UPDATE owned_vehicles SET lastposition = @lastposition, stored = @stored WHERE plate = @plate',
                            {
                                ['@lastposition'] = posStr,
                                ['@plate'] = plate,
                                ['@stored'] = 1,
                            }, function(rowsChanged)
                                vehiclesSpawned[plate] = false

                                if Garage.Debug then
                                    print('\027[1mSAVE VEHICLE\027[0m ( "\027[33m' ..
                                        plate ..
                                        '"\027[0m - \027[36mvector4(' ..
                                        position.x .. ',' ..
                                        position.y .. ',' ..
                                        position.z .. ',' ..
                                        heading .. ') \027[0m Doors: ' ..
                                        doorLockStatus ..
                                        ', ( 0 = Open / 2 Close))')

                                    print('\027[1mVEHICLE DELETED\027[0m ( "\027[33m' .. plate .. '"\027[0m )')
                                end

                                DeleteEntity(vehEntity)
                            end
                        )
                    end
                end
            end
        end
    end)
end  -- Fermeture de l'if Garage.Persistent.Persitent





if Garage.AutoImpound.AutoImpound then
    CreateThread(function()
        while true do
            local vehicles = MySQL.Sync.fetchAll("SELECT * FROM `owned_vehicles`")
            for i = 1, #vehicles do
                local data = vehicles[i]
                local allVehicles = GetAllVehicles()
                local vehicleFound = false
                local xPlayer = ESX.GetPlayerFromIdentifier(data.owner)

                for j = 1, #allVehicles do
                    local vehicle = allVehicles[j]
                    if DoesEntityExist(vehicle) then
                        local plate = GetVehicleNumberPlateText(vehicle)
                        if plate == data.plate then
                            vehicleFound = true
                            local ped = GetPedInVehicleSeat(vehicle, -1)
                            if ped == 0 then
                                if data.stored == 0 then
                                    if Garage.Debug then
                                        print('^0Plate: ' .. data.plate .. ', ^1Fuera sin jugador.')
                                    end
                                end
                            else
                                if Garage.Debug then
                                    print('^0Plate: ' .. data.plate .. ', ^2Fuera con jugador.')
                                end
                            end
                        end
                    end
                end
                if not vehicleFound and data.stored == 0 then
                    MySQL.Async.execute(
                        "UPDATE `owned_vehicles` SET `parking` = @impo, `calle` = @calle, `pound` = 1 WHERE  `plate` = @plate",
                        {
                            ['@plate'] = data.plate,
                            ['@impo'] = Garage.AutoImpound.ImpoundIn,
                            --  ['@calle'] = nil,
                        }, function(rowsChanged)
                            if rowsChanged > 0 then
                                if Garage.Debug then
                                    print('El vehiculo con la matricula ' ..
                                        data.plate .. ' fue depositado en ' .. Garage.AutoImpound.ImpoundIn)
                                end
                            else
                                if Garage.Debug then
                                    print('error')
                                end
                            end
                        end)
                end
            end
            Wait(Garage.AutoImpound.TimeCheck)
        end
    end)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
