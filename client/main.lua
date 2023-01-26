local QBCore = exports['qb-core']:GetCoreObject()
local picking = false
local Selllocation = Config.SellItemLocation 
local sl = Selllocation 
local currentFires = {}

Citizen.CreateThread(function()
    if Config.ShopBlip then
        for i = 1, #Config.MoonshineLocations["buy-ingredients"] do
            local blip = AddBlipForCoord(Config.MoonshineLocations["buy-ingredients"][i])

            SetBlipSprite(blip, Config.Shop["Sprite"])
            SetBlipScale(blip, Config.Shop["Size"])
            SetBlipColour(blip, Config.Shop["Colour"])
            SetBlipDisplay(blip, 4)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(Config.Shop["Label"])
            EndTextCommandSetBlipName(blip)	
        end
    end
end)

DrawText3Ds = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('sayer-moonshine:client:GetMash', function()
    potatoMashing()
end)

RegisterNetEvent('sayer-moonshine:client:HeatWater', function()
    if QBCore.Functions.HasItem(Config.Items["Waterjar"]) then
        QBCore.Functions.Progressbar('name_here', 'Heating Water...', Config.ActionTime * 1000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'mini@repair',
            anim = 'fixing_a_ped',
            flags = 16,
        }, {}, {}, function()
            if Config.EnableFailing then
                local chance = math.random(0, 100)
                if chance < Config.FailChance then
                    QBCore.Functions.Notify('You Failed this step, Try Again', 'error')
                    ClearPedTasks(PlayerPedId())
                else
                    TriggerServerEvent('sayer-moonshine:server:HeatWater')
                    QBCore.Functions.Notify('You Heated Some Water', 'primary', 7500)
                    ClearPedTasks(PlayerPedId())
                end
            else
            TriggerServerEvent('sayer-moonshine:server:HeatWater')
            QBCore.Functions.Notify('You Heated Some Water', 'primary', 7500)
            ClearPedTasks(PlayerPedId())
            end
        end)
    else
        QBCore.Functions.Notify('You Forgot to Add Water', 'error')
    end
end)

RegisterNetEvent('sayer-moonshine:client:AddBarley', function()
    if QBCore.Functions.HasItem(Config.Items["HeatedWater"]) then
        if QBCore.Functions.HasItem(Config.Items["Barley"], Config.BarleyAmountNeeded) then
            QBCore.Functions.Progressbar('name_here', 'Adding Barley...', Config.ActionTime * 1000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'mini@repair',
                anim = 'fixing_a_ped',
                flags = 16,
            }, {}, {}, function()
                if Config.EnableFailing then
                    local chance = math.random(0, 100)
                    if chance < Config.FailChance then
                        if Config.LoseOnFail then
                            TriggerServerEvent('sayer-moonshine:server:LoseStage2')
                            QBCore.Functions.Notify('You failed and lost the item', 'error', 2000)   
                            ClearPedTasks(PlayerPedId())
                        else
                        QBCore.Functions.Notify('You Failed this step, Try Again', 'error')
                        ClearPedTasks(PlayerPedId())
                        end
                        if Config.FireOnFail then
                            local firechance = math.random(1, 100)
                            local randTime = math.random(3000,5000)
                            local coords = GetEntityCoords(PlayerPedId())
                            if firechance <= Config.FireChance then
                                FailFire(coords, randTime)
                            end
                        end  
                    else
                        TriggerServerEvent('sayer-moonshine:server:AddBarley')
                        QBCore.Functions.Notify('You Added some Barley', 'primary', 7500)
                        ClearPedTasks(PlayerPedId())
                    end
                else
                TriggerServerEvent('sayer-moonshine:server:AddBarley')
                QBCore.Functions.Notify('You Added some Barley', 'primary', 7500)
                ClearPedTasks(PlayerPedId())
                end
            end)
        else
            QBCore.Functions.Notify('you dont have enough barley', 'error', 2000)
        end
    else
        QBCore.Functions.Notify('You Forgot to Heat The Water', 'error')
    end
end)

RegisterNetEvent('sayer-moonshine:client:AddYeast', function()
    if QBCore.Functions.HasItem(Config.Items["HeatedBarley"]) then
        if QBCore.Functions.HasItem(Config.Items["Yeast"], Config.YeastAmountNeeded) then
            QBCore.Functions.Progressbar('name_here', 'Adding Yeast...', Config.ActionTime * 1000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'mini@repair',
                anim = 'fixing_a_ped',
                flags = 16,
            }, {}, {}, function()
                if Config.EnableFailing then
                    local chance = math.random(0, 100)
                    if chance < Config.FailChance then
                        if Config.LoseOnFail then
                            TriggerServerEvent('sayer-moonshine:server:LoseStage3')
                            QBCore.Functions.Notify('You failed and lost the item', 'error', 2000)
                            ClearPedTasks(PlayerPedId())
                        else
                        QBCore.Functions.Notify('You Failed this step, Try Again', 'error')
                        ClearPedTasks(PlayerPedId())
                        end
                        if Config.FireOnFail then
                            local firechance = math.random(1, 100)
                            local randTime = math.random(3000,5000)
                            local coords = GetEntityCoords(PlayerPedId())
                            if firechance <= Config.FireChance then
                                FailFire(coords, randTime)
                            end
                        end 
                    else
                        TriggerServerEvent('sayer-moonshine:server:AddYeast')
                        QBCore.Functions.Notify('You Added some yeast', 'primary', 7500)
                        ClearPedTasks(PlayerPedId())
                    end
                else
                TriggerServerEvent('sayer-moonshine:server:AddYeast')
                QBCore.Functions.Notify('You Added some yeast', 'primary', 7500)
                ClearPedTasks(PlayerPedId())
                end
            end)
        else
            QBCore.Functions.Notify('you dont have enough yeast', 'error', 2000)
        end
    else
        QBCore.Functions.Notify('You Forgot to Add Barley', 'error')
    end
end)

RegisterNetEvent('sayer-moonshine:client:AddMash', function()
    if QBCore.Functions.HasItem(Config.Items["HeatedMixture"]) then
        if QBCore.Functions.HasItem(Config.Items["Mash"], Config.MashAmountNeeded) then
            QBCore.Functions.Progressbar('name_here', 'Adding Mash...', Config.ActionTime * 1000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'mini@repair',
                anim = 'fixing_a_ped',
                flags = 16,
            }, {}, {}, function()
                if Config.EnableFailing then
                    local chance = math.random(0, 100)
                    if chance < Config.FailChance then
                        if Config.LoseOnFail then
                            TriggerServerEvent('sayer-moonshine:server:LoseStage4')
                            QBCore.Functions.Notify('You failed and lost the item', 'error', 2000)
                            ClearPedTasks(PlayerPedId())
                        else
                            QBCore.Functions.Notify('You Failed this step, Try Again', 'error')
                            ClearPedTasks(PlayerPedId())
                        end
                        if Config.FireOnFail then
                            local firechance = math.random(1, 100)
                            local randTime = math.random(3000,5000)
                            local coords = GetEntityCoords(PlayerPedId())
                            if firechance <= Config.FireChance then
                                FailFire(coords, randTime)
                            end
                        end 
                    else
                        TriggerServerEvent('sayer-moonshine:server:AddMash')
                        QBCore.Functions.Notify('You add some mash', 'primary', 7500)
                        ClearPedTasks(PlayerPedId())
                    end
                else
                TriggerServerEvent('sayer-moonshine:server:AddMash')
                QBCore.Functions.Notify('You add some mash', 'primary', 7500)
                ClearPedTasks(PlayerPedId())
                end
            end)
        else
            QBCore.Functions.Notify('You dont have enough mash', 'error', 2000)
        end
    else
        QBCore.Functions.Notify('You missed a step', 'error', 2000)
    end
end)

RegisterNetEvent('sayer-moonshine:client:FinishMoonshine', function()
    if QBCore.Functions.HasItem(Config.Items["MoonshineMix"]) then
        QBCore.Functions.Progressbar('name_here', 'Finishing Up...', Config.ActionTime * 1000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'mini@repair',
            anim = 'fixing_a_ped',
            flags = 16,
        }, {}, {}, function()
            if Config.EnableFailing then
                local chance = math.random(0, 100)
                if chance < Config.FailChance then
                    if Config.LoseOnFail then
                        TriggerServerEvent('sayer-moonshine:server:LoseStage5')
                        QBCore.Functions.Notify('You failed and lost the item', 'error', 2000)
                        ClearPedTasks(PlayerPedId())
                    else
                    QBCore.Functions.Notify('You Failed this step, Try Again', 'error')
                    ClearPedTasks(PlayerPedId())
                    end
                    if Config.FireOnFail then
                        local firechance = math.random(1, 100)
                        local randTime = math.random(3000,5000)
                        local coords = GetEntityCoords(PlayerPedId())
                        if firechance <= Config.FireChance then
                            FailFire(coords, randTime)
                        end
                    end 
                else
                    TriggerServerEvent('sayer-moonshine:server:FinishMoonshine')
                    QBCore.Functions.Notify('You made a batch of moonshine', 'primary', 7500)
                    ClearPedTasks(PlayerPedId())
                end
            else
            TriggerServerEvent('sayer-moonshine:server:FinishMoonshine')
            QBCore.Functions.Notify('You made a batch of moonshine', 'primary', 7500)
            ClearPedTasks(PlayerPedId())
            end
        end)
    else
        QBCore.Functions.Notify('You missed a step', 'error')
    end
end)

RegisterNetEvent('qb-menu:client:BuyMoonshineIngredients', function(data)
    if Config.JimShops == true then
        TriggerServerEvent("jim-shops:ShopOpen", "shop", "Moonshine Ingredients", Config.IngredientShop)
    else
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "Moonshine Ingredients", Config.IngredientShop) 
    end
end)

CreateThread(function()
    if Config.EnableLocations == "enabled" then
        while true do
            sleep = 100
            local pos = GetEntityCoords(PlayerPedId())
            local PlayerData = QBCore.Functions.GetPlayerData()
            local radius = Config.PickingRadius
                for k, v in pairs(Config.MoonshineLocations["buy-ingredients"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 0.9 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Buy Ingredients")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-menu:client:BuyMoonshineIngredients")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Buy Ingredients")
                    end
                end
                for k, v in pairs(Config.MoonshineLocations["pick-potato1"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < radius then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Pick Potato")
                        if IsControlJustReleased(0, 38) then
                            PrepareAnim()
                            pickCrop("potato")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Pick Potato")
                    end
                end
                for k, v in pairs(Config.MoonshineLocations["pick-barley1"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < radius then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Pick Barley")
                        if IsControlJustReleased(0, 38) then
                            PrepareAnim()
                            pickCrop("barley")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Pick Barley")
                    end
                end
                for k, v in pairs(Config.MoonshineLocations["heat-water"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 0.8 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Heat Water")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("sayer-moonshine:client:HeatWater")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Heat Water")
                    end
                end
                for k, v in pairs(Config.MoonshineLocations["add-barley"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 0.9 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Add Barley")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("sayer-moonshine:client:AddBarley")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Add Barley")
                    end
                end
                for k, v in pairs(Config.MoonshineLocations["add-yeast"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Add Yeast")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("sayer-moonshine:client:AddYeast")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Add Yeast")
                    end
                end
                for k, v in pairs(Config.MoonshineLocations["ferment-mash"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Ferment Mash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("sayer-moonshine:client:AddMash")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Add Mash")
                    end
                end
                for k, v in pairs(Config.MoonshineLocations["finish-moonshine"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Finish Moonshine")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("sayer-moonshine:client:FinishMoonshine")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 0
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Finish Moonshine")
                    end   
                end
            Wait(sleep)
        end
    end
end)


function PrepareAnim()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
    PreparingAnimCheck()
end

function PreparingAnimCheck()
    picking = true
    Citizen.CreateThread(function()
        while true do
            local ped = PlayerPedId()

            if picking then

            else
                ClearPedTasksImmediately(ped)
                break
            end

            Citizen.Wait(200)
        end
    end)
end


function pickCrop(cropType)
    if QBCore.Functions.HasItem(Config.Items["Trowel"]) then
        local eventName = ""
        if cropType == "potato" then
            eventName = "sayer-moonshine:server:GetPotato"
        elseif cropType == "barley" then
            eventName = "sayer-moonshine:server:GetBarley"
        end
        QBCore.Functions.Progressbar("grind_coke", "Picking ".. cropType .." ..", Config.PickingTime * 1000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent(eventName)
            ClearPedTasks(PlayerPedId())
            picking = false
        end, function() -- Cancel
            openingDoor = false
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify("Picking Canceled", "error")
        end)
    else
        QBCore.Functions.Notify("You need a tool for that!", "error")
    end
end


function potatoMashing()
    QBCore.Functions.Progressbar("grind_coke", "Mashing Potato ..", math.random(5000, 6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("sayer-moonshine:server:GetMash")
        ClearPedTasks(PlayerPedId())
        picking = false
    end, function() -- Cancel
        openingDoor = false
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify("Mashing Canceled", "error")
    end)
end

--Selling---

CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)

            local dist = #(PlayerPos - vector3(sl.x, sl.y, sl.z)) 
            if dist < 10 then
                InRange = true
                DrawMarker(2,sl.x, sl.y, sl.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
                if dist < 1 then

                    DrawText3Ds(sl.x, sl.y, sl.z, '~g~E~w~ - Sell Moonshine') 
                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('sayer-moonshine:server:SellMoonshine')
                    end
                end
            end

        if not InRange then
            Wait(5000)
        end
        Wait(5)
    end
end)

RegisterNetEvent('sayer-moonshine:debugpicking', function()
    picking = false
    print(picking)
    QBCore.Functions.Notify('Debug SuccessFul', 'success', 2000)
end)

function FailFire(coords, time)
    for _ = 1, math.random(1, 7), 1 do
        TriggerServerEvent("sayer-moonshine:StartServerFire", coords, 24, false)
    end
    Wait(time)
    TriggerServerEvent("sayer-moonshine:StopFires")
end

RegisterNetEvent('sayer-moonshine:StartFire', function(coords, maxChildren, isGasFire)
    if #(vector3(coords.x, coords.y, coords.z) - GetEntityCoords(PlayerPedId())) < 100 then
        local pos = {
            x = coords.x,
            y = coords.y,
            z = coords.z,
        }
        pos.z = pos.z - 0.9
        local fire = StartScriptFire(pos.x, pos.y, pos.z, maxChildren, isGasFire)
        currentFires[#currentFires+1] = fire
    end
end)

RegisterNetEvent('sayer-moonshine:StopFires', function()
    for i = 1, #currentFires do
        RemoveScriptFire(currentFires[i])
    end
end)