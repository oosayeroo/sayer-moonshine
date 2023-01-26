local QBCore = exports['qb-core']:GetCoreObject()
local SellMoonshine = {
    [Config.Items["Moonshine"]]  =  Config.MoonshineValue ,
}
local MoneyType = Config.MoneyType

RegisterServerEvent('qb-moonshine:server:GetPotato')
AddEventHandler('qb-moonshine:server:GetPotato', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item = Config.Items["Potato"]
    Player.Functions.AddItem(item, Config.PotatoHarvestAmount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
end)

RegisterServerEvent('qb-moonshine:server:GetBarley')
AddEventHandler('qb-moonshine:server:GetBarley', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item = Config.Items["Barley"]
    Player.Functions.AddItem(item, Config.BarleyHarvestAmount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
end)

QBCore.Functions.CreateUseableItem(Config.Items["Potato"], function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-moonshine:client:GetMash", source, item.name)
end)

RegisterNetEvent('qb-moonshine:server:GetMash', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = Config.MashAmount
    local item = Config.Items["Mash"]
    local amount = 1

    Player.Functions.RemoveItem(Config.Items["Potato"], amount)
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

RegisterNetEvent('qb-moonshine:server:HeatWater', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local waterjar = Player.Functions.GetItemByName(Config.Items["Waterjar"])

    if waterjar ~= nil then

        Player.Functions.RemoveItem(Config.Items["Waterjar"], 1)
        Player.Functions.AddItem(Config.Items["HeatedWater"], 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Items["HeatedWater"]], "add")
    end
end)

RegisterNetEvent('qb-moonshine:server:AddBarley', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local heatedwater = Player.Functions.GetItemByName(Config.Items["HeatedWater"])
    local barley = Player.Functions.GetItemByName(Config.Items["Barley"])

    if heatedwater ~= nil and barley ~= nil then

        Player.Functions.RemoveItem(Config.Items["HeatedWater"], 1)
        Player.Functions.RemoveItem(Config.Items["Barley"], Config.BarleyAmountNeeded)
        Player.Functions.AddItem(Config.Items["HeatedBarley"], 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Items["HeatedBarley"]], "add")
    end
end)

RegisterNetEvent('qb-moonshine:server:AddYeast', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local heatedbarley = Player.Functions.GetItemByName(Config.Items["HeatedBarley"])
    local yeast = Player.Functions.GetItemByName('m-yeast')

    if heatedbarley ~= nil and yeast ~= nil then

        Player.Functions.RemoveItem(Config.Items["HeatedBarley"], 1)
        Player.Functions.RemoveItem(Config.Items["Yeast"], Config.YeastAmountNeeded)
        Player.Functions.AddItem(Config.Items["HeatedMixture"], 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Items["HeatedMixture"]], "add")
    end
end)

RegisterNetEvent('qb-moonshine:server:AddMash', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local heatedmixture = Player.Functions.GetItemByName(Config.Items["HeatedMixture"])
    local potato = Player.Functions.GetItemByName(Config.Items["Mash"])

    if heatedmixture ~= nil and potato ~= nil then

        Player.Functions.RemoveItem(Config.Items["HeatedMixture"], 1)
        Player.Functions.RemoveItem(Config.Items["Mash"], Config.MashAmountNeeded)
        Player.Functions.AddItem(Config.Items["MoonshineMix"], 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Items["MoonshineMix"]], "add")
    end
end)

RegisterNetEvent('qb-moonshine:server:FinishMoonshine', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local moonshinemix = Player.Functions.GetItemByName(Config.Items["MoonshineMix"])

    if moonshinemix ~= nil then

        Player.Functions.RemoveItem(Config.Items["MoonshineMix"], 1)

        Player.Functions.AddItem(Config.Items["Moonshine"], Config.BatchAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Items["Moonshine"]], "add")
    end
end)

RegisterNetEvent('qb-moonshine:server:LoseStage2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.Items["HeatedWater"]
    local item2 = Config.Items["Barley"]
    Player.Functions.RemoveItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
    Player.Functions.RemoveItem(item2, Config.BarleyAmountNeeded)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], "remove")
end)

RegisterNetEvent('qb-moonshine:server:LoseStage3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.Items["HeatedBarley"]
    local item2 = Config.Items["Yeast"]
    Player.Functions.RemoveItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
    Player.Functions.RemoveItem(item2, Config.YeastAmountNeeded)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], "remove")
end)

RegisterNetEvent('qb-moonshine:server:LoseStage4', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.Items["HeatedMixture"]
    local item2 = Config.Items["Mash"]
    Player.Functions.RemoveItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
    Player.Functions.RemoveItem(item2, Config.MashAmountNeeded)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], "remove")
end)

RegisterNetEvent('qb-moonshine:server:LoseStage5', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.Items["MoonshineMix"]
    Player.Functions.RemoveItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Items["MoonshineMix"]], "remove")
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

QBCore.Commands.Add("debugpicking", "fixed any picking issues", {}, false, function(source) 
    TriggerClientEvent("qb-moonshine:debugpicking", source, false) 
end)

RegisterNetEvent('qb-moonshine:StartServerFire', function(coords, maxChildren, isGasFire)
    local src = source
    local ped = GetPlayerPed(src)
    local coords2 = GetEntityCoords(ped)
    TriggerClientEvent("qb-moonshine:StartFire", -1, coords, maxChildren, isGasFire)
end)

RegisterNetEvent('qb-moonshine:StopFires', function()
    TriggerClientEvent("qb-moonshine:StopFires", -1)
end)