local QBCore = exports['qb-core']:GetCoreObject()
local SellMoonshine = {
    ["m-moonshine"]  =  Config.MoonshineValue ,
}

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

RegisterServerEvent('qb-moonshine:server:GetPotato')
AddEventHandler('qb-moonshine:server:GetPotato', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("m-potato", Config.PotatoHarvestAmount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['m-potato'], "add")
end)

RegisterServerEvent('qb-moonshine:server:GetBarley')
AddEventHandler('qb-moonshine:server:GetBarley', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("m-barley", Config.BarleyHarvestAmount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['m-barley'], "add")
end)

QBCore.Functions.CreateUseableItem("m-potato", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-moonshine:client:GetMash", source, item.name)
end)

RegisterNetEvent('qb-moonshine:server:GetMash', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = Config.MashAmount
    local item = 'm-mash'
    local amount = 1

    Player.Functions.RemoveItem('m-potato', amount)
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

RegisterNetEvent('qb-moonshine:server:HeatWater', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local waterjar = Player.Functions.GetItemByName('m-waterjar')

    if waterjar ~= nil then

        Player.Functions.RemoveItem('m-waterjar', 1)
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
        Player.Functions.RemoveItem('m-barley', Config.BarleyAmountNeeded)
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
        Player.Functions.RemoveItem('m-yeast', Config.YeastAmountNeeded)
        Player.Functions.AddItem('m-heatedmixture', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-heatedmixture'], "add")
    end
end)

RegisterNetEvent('qb-moonshine:server:AddMash', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local heatedmixture = Player.Functions.GetItemByName('m-heatedmixture')
    local potato = Player.Functions.GetItemByName('m-mash')

    if heatedmixture ~= nil and potato ~= nil then

        Player.Functions.RemoveItem('m-heatedmixture', 1)
        Player.Functions.RemoveItem('m-mash', Config.MashAmountNeeded)
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

        Player.Functions.AddItem('m-moonshine', Config.BatchAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-moonshine'], "add")
    end
end)

RegisterNetEvent('qb-moonshine:server:LoseStage2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'm-heatedwater'
    local item2 = 'm-barley'
    Player.Functions.RemoveItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
    Player.Functions.RemoveItem(item2, Config.BarleyAmountNeeded)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], "remove")
end)

RegisterNetEvent('qb-moonshine:server:LoseStage3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'm-heatedbarley'
    local item2 = 'm-yeast'
    Player.Functions.RemoveItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
    Player.Functions.RemoveItem(item2, Config.YeastAmountNeeded)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], "remove")
end)

RegisterNetEvent('qb-moonshine:server:LoseStage4', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'm-heatedmixture'
    local item2 = 'm-mash'
    Player.Functions.RemoveItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
    Player.Functions.RemoveItem(item2, Config.MashAmountNeeded)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], "remove")
end)

RegisterNetEvent('qb-moonshine:server:LoseStage5', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'm-moonshinemix'
    Player.Functions.RemoveItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['m-moonshinemix'], "remove")
end)


--Selling ---
RegisterNetEvent('qb-moonshine:server:SellMoonshine', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    
    local xItem = Player.Functions.GetItemsByName(SellMoonshine)
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if SellMoonshine[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (SellMoonshine[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)

        Player.Functions.AddMoney("cash", price, "sold-moonshine")
            TriggerClientEvent('QBCore:Notify', src, "You sold your Moonshine for $"..price)
            TriggerEvent("qb-log:server:CreateLog", "sellmoonshine", "moonshine", "blue", "**"..GetPlayerName(src) .. "** got $"..price.." for selling the Moonshine")
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You have no Moonshine..")
    end

end)

