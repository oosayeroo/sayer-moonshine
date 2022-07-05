local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-moonshine:server:GetJars', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = Config.JarAmount
    local item = 'm-waterjar'
    local price = Config.IngredientCost

    Player.Functions.RemoveMoney('cash', price)
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

RegisterNetEvent('qb-moonshine:server:GetBarley', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = Config.BarleyAmount
    local item = 'm-barley'
    local price = Config.BarleyCost

    Player.Functions.RemoveMoney('cash', price)
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

RegisterNetEvent('qb-moonshine:server:GetYeast', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = Config.YeastAmount
    local item = 'm-yeast'
    local price = Config.YeastCost

    Player.Functions.RemoveMoney('cash', price)
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

RegisterNetEvent('qb-moonshine:server:GetMash', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = Config.MashAmount
    local item = 'm-mash'
    local price = Config.MashCost

    Player.Functions.RemoveMoney('cash', price)
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

RegisterNetEvent('qb-moonshine:server:HeatWater', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local waterjar = Player.Functions.GetItemByName('m-waterjar')

    if waterjar ~= nil then

        Player.Functions.RemoveItem('m-waterjar', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-waterjar'], "remove")

        Player.Functions.AddItem('m-heatedwater', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-heatedwater'], "add")
    end
end)

RegisterNetEvent('qb-moonshine:server:AddBarley', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local heatedwater = Player.Functions.GetItemByName('m-heatedwater')
    local barley = Player.Functions.GetItemByName('m-barley')

    if heatedwater ~= nil and barley ~= nil then

        Player.Functions.RemoveItem('m-heatedwater', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-heatedwater'], "remove")

        Player.Functions.RemoveItem('m-barley', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-barley'], "remove")

        Player.Functions.AddItem('m-heatedbarley', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-heatedbarley'], "add")
    end
end)

RegisterNetEvent('qb-moonshine:server:AddYeast', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local heatedbarley = Player.Functions.GetItemByName('m-heatedbarley')
    local yeast = Player.Functions.GetItemByName('m-yeast')

    if heatedbarley ~= nil and yeast ~= nil then

        Player.Functions.RemoveItem('m-heatedbarley', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-heatedbarley'], "remove")

        Player.Functions.RemoveItem('m-yeast', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-yeast'], "remove")

        Player.Functions.AddItem('m-heatedmixture', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-heatedmixture'], "add")
    end
end)

RegisterNetEvent('qb-moonshine:server:AddMash', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local heatedmixture = Player.Functions.GetItemByName('m-heatedmixture')
    local mash = Player.Functions.GetItemByName('m-mash')

    if heatedmixture ~= nil and mash ~= nil then

        Player.Functions.RemoveItem('m-heatedmixture', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-heatedmixture'], "remove")

        Player.Functions.RemoveItem('m-mash', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-mash'], "remove")

        Player.Functions.AddItem('m-moonshinemix', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-moonshinemix'], "add")
    end
end)

RegisterNetEvent('qb-moonshine:server:FinishMoonshine', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local moonshinemix = Player.Functions.GetItemByName('m-moonshinemix')

    if moonshinemix ~= nil then

        Player.Functions.RemoveItem('m-moonshinemix', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-moonshinemix'], "remove")

        Player.Functions.AddItem('m-moonshine', Config.BatchAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-moonshine'], "add")
    end
end)
