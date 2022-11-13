local QBCore = exports['qb-core']:GetCoreObject()
local potatopicking = false
local Selllocation = Config.SellItemLocation 
local sl = Selllocation 

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

RegisterNetEvent('qb-moonshine:client:GetJars', function()
    QBCore.Functions.Progressbar('name_here', 'Grabbing some jars...', 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'idle',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('qb-moonshine:server:GetJars')
        QBCore.Functions.Notify('You Bought some jars', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('qb-moonshine:client:GetYeast', function()
    QBCore.Functions.Progressbar('name_here', 'Purchasing Yeast...', 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'idle',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('qb-moonshine:server:GetYeast')
        QBCore.Functions.Notify('You Bought some Yeast', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('qb-moonshine:client:GetMash', function()
    potatoMashing()
end)

RegisterNetEvent('qb-moonshine:client:HeatWater', function()
    if QBCore.Functions.HasItem('m-waterjar') then
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
                    TriggerServerEvent('qb-moonshine:server:HeatWater')
                    QBCore.Functions.Notify('You Heated Some Water', 'primary', 7500)
                    ClearPedTasks(PlayerPedId())
                end
            else
            TriggerServerEvent('qb-moonshine:server:HeatWater')
            QBCore.Functions.Notify('You Heated Some Water', 'primary', 7500)
            ClearPedTasks(PlayerPedId())
            end
        end)
    else
        QBCore.Functions.Notify('You Forgot to Add Water', 'error')
    end
end)

RegisterNetEvent('qb-moonshine:client:AddBarley', function()
    if QBCore.Functions.HasItem('m-heatedwater') then
        if QBCore.Functions.HasItem('m-barley', Config.BarleyAmountNeeded) then
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
                            TriggerServerEvent('qb-moonshine:server:LoseStage2')
                            QBCore.Functions.Notify('You failed and lost the item', 'error', 2000)
                            ClearPedTasks(PlayerPedId())
                        else
                        QBCore.Functions.Notify('You Failed this step, Try Again', 'error')
                        ClearPedTasks(PlayerPedId())
                        end
                    else
                        TriggerServerEvent('qb-moonshine:server:AddBarley')
                        QBCore.Functions.Notify('You Added some Barley', 'primary', 7500)
                        ClearPedTasks(PlayerPedId())
                    end
                else
                TriggerServerEvent('qb-moonshine:server:AddBarley')
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

RegisterNetEvent('qb-moonshine:client:AddYeast', function()
    if QBCore.Functions.HasItem('m-heatedbarley') then
        if QBCore.Functions.HasItem('m-yeast', Config.YeastAmountNeeded) then
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
                            TriggerServerEvent('qb-moonshine:server:LoseStage3')
                            QBCore.Functions.Notify('You failed and lost the item', 'error', 2000)
                            ClearPedTasks(PlayerPedId())
                        else
                        QBCore.Functions.Notify('You Failed this step, Try Again', 'error')
                        ClearPedTasks(PlayerPedId())
                        end
                    else
                        TriggerServerEvent('qb-moonshine:server:AddYeast')
                        QBCore.Functions.Notify('You Added some yeast', 'primary', 7500)
                        ClearPedTasks(PlayerPedId())
                    end
                else
                TriggerServerEvent('qb-moonshine:server:AddYeast')
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

RegisterNetEvent('qb-moonshine:client:AddMash', function()
    if QBCore.Functions.HasItem('m-heatedmixture') then
        if QBCore.Functions.HasItem('m-mash', Config.MashAmountNeeded) then
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
                            TriggerServerEvent('qb-moonshine:server:LoseStage4')
                            QBCore.Functions.Notify('You failed and lost the item', 'error', 2000)
                            ClearPedTasks(PlayerPedId())
                        else
                            QBCore.Functions.Notify('You Failed this step, Try Again', 'error')
                            ClearPedTasks(PlayerPedId())
                        end
                    else
                        TriggerServerEvent('qb-moonshine:server:AddMash')
                        QBCore.Functions.Notify('You add some mash', 'primary', 7500)
                        ClearPedTasks(PlayerPedId())
                    end
                else
                TriggerServerEvent('qb-moonshine:server:AddMash')
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

RegisterNetEvent('qb-moonshine:client:FinishMoonshine', function()
    if QBCore.Functions.HasItem('m-moonshinemix') then
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
                        TriggerServerEvent('qb-moonshine:server:LoseStage5')
                        QBCore.Functions.Notify('You failed and lost the item', 'error', 2000)
                        ClearPedTasks(PlayerPedId())
                    else
                    QBCore.Functions.Notify('You Failed this step, Try Again', 'error')
                    ClearPedTasks(PlayerPedId())
                    end
                else
                    TriggerServerEvent('qb-moonshine:server:FinishMoonshine')
                    QBCore.Functions.Notify('You made a batch of moonshine', 'primary', 7500)
                    ClearPedTasks(PlayerPedId())
                end
            else
            TriggerServerEvent('qb-moonshine:server:FinishMoonshine')
            QBCore.Functions.Notify('You made a batch of moonshine', 'primary', 7500)
            ClearPedTasks(PlayerPedId())
            end
        end)
    else
        QBCore.Functions.Notify('You missed a step', 'error')
    end
end)

RegisterNetEvent('qb-menu:client:BuyMoonshineIngredients', function(data)
    if Config.JimMenu == true then
        exports['qb-menu']:openMenu({
            {
                
                header = "| Available Products |",
                isMenuHeader = true, 
            },
            {
                
                header = "• Moonshine Jars",
                txt = "Buy Some Large Jugs",
                icon = 'm-waterjar',
                params = {
                    event = "qb-moonshine:client:GetJars"
                }
            },  
            {
                
                header = "• Yeast",
                txt = "Buy Some Yeast",
                icon = 'm-yeast',
                params = {
                    event = "qb-moonshine:client:GetYeast"
                }
            },
            {
                id = 7,
                header = "Close (ESC)",
                isMenuHeader = true,
            },
        })
    else
        exports['qb-menu']:openMenu({
            {
                
                header = "| Available Products |",
                isMenuHeader = true, 
            },
            {
                
                header = "• Moonshine Jars",
                txt = "Buy Some Large Jugs",
                params = {
                    event = "qb-moonshine:client:GetJars"
                }
            },  
            {
                
                header = "• Yeast",
                txt = "Buy Some Yeast",
                params = {
                    event = "qb-moonshine:client:GetYeast"
                }
            },
            {
                id = 7,
                header = "Close (ESC)",
                isMenuHeader = true,
            },
        })
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
                        pickPotato()
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
                        pickBarley()
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
                        TriggerEvent("qb-moonshine:client:HeatWater")
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
                        TriggerEvent("qb-moonshine:client:AddBarley")
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
                        TriggerEvent("qb-moonshine:client:AddYeast")
                    end
                elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                    sleep = 0
                    QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Add Yeast")
                end
            end
            
            for k, v in pairs(Config.MoonshineLocations["add-mash"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                    sleep = 0
                    QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Add Mash")
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("qb-moonshine:client:AddMash")
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
                        TriggerEvent("qb-moonshine:client:FinishMoonshine")
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
    potatopicking = true
    Citizen.CreateThread(function()
        while true do
            local ped = PlayerPedId()

            if potatopicking then

            else
                ClearPedTasksImmediately(ped)
                break
            end

            Citizen.Wait(200)
        end
    end)
end


  function pickPotato()
    QBCore.Functions.Progressbar("grind_coke", "Picking Potatos ..", Config.PickingTime * 1000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-moonshine:server:GetPotato")
        ClearPedTasks(PlayerPedId())
        potatopicking = false
    end, function() -- Cancel
        openingDoor = false
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify("Picking Canceled", "error")
    end)
end

function pickBarley()
    QBCore.Functions.Progressbar("grind_coke", "Picking Barley ..", Config.PickingTime * 1000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-moonshine:server:GetBarley")
        ClearPedTasks(PlayerPedId())
        potatopicking = false
    end, function() -- Cancel
        openingDoor = false
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify("Picking Canceled", "error")
    end)
end

function potatoMashing()
    QBCore.Functions.Progressbar("grind_coke", "Mashing Potato ..", math.random(5000, 6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-moonshine:server:GetMash")
        ClearPedTasks(PlayerPedId())
        potatopicking = false
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
                        TriggerServerEvent('qb-moonshine:server:SellMoonshine')
                    end
                end
            end

        if not InRange then
            Wait(5000)
        end
        Wait(5)
    end
end)

