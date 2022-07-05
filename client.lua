local QBCore = exports['qb-core']:GetCoreObject()
local potatopicking = false

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
    QBCore.Functions.Progressbar('name_here', 'Grabbing some jars...', 5000, false, true, {
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
    QBCore.Functions.Progressbar('name_here', 'Purchasing Yeast...', 5000, false, true, {
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
    QBCore.Functions.Progressbar('name_here', 'Making Mash...', 0, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'idle',
        flags = 16,
    }, {}, {}, function()
        potatoMashing()
        QBCore.Functions.Notify('You Made some Mash', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('qb-moonshine:client:AddYeast', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then

            QBCore.Functions.Progressbar('name_here', 'Adding Yeast...', 10000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'mini@repair',
                anim = 'fixing_a_ped',
                flags = 16,
            }, {}, {}, function()
                TriggerServerEvent('qb-moonshine:server:AddYeast')
                QBCore.Functions.Notify('You Added some yeast', 'primary', 7500)
                ClearPedTasks(PlayerPedId())
            end)
        else
            QBCore.Functions.Notify('You missed a step in the process', 'error', 7500)
        end
    end, 'm-heatedbarley')
end)

RegisterNetEvent('qb-moonshine:client:HeatWater', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then

            QBCore.Functions.Progressbar('name_here', 'Heating Water...', 8000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'mini@repair',
                anim = 'fixing_a_ped',
                flags = 16,
            }, {}, {}, function()
                TriggerServerEvent('qb-moonshine:server:HeatWater')
                QBCore.Functions.Notify('You Heated Some Water', 'primary', 7500)
                ClearPedTasks(PlayerPedId())
            end)
        else
            QBCore.Functions.Notify('You need a water jar to heat water', 'error', 7500)
        end
    end, 'm-waterjar')
end)

RegisterNetEvent('qb-moonshine:client:AddBarley', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then

            QBCore.Functions.Progressbar('name_here', 'Adding Barley...', 10000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'mini@repair',
                anim = 'fixing_a_ped',
                flags = 16,
            }, {}, {}, function()
                TriggerServerEvent('qb-moonshine:server:AddBarley')
                QBCore.Functions.Notify('You Added some Barley', 'primary', 7500)
                ClearPedTasks(PlayerPedId())
            end)
        else
            QBCore.Functions.Notify('You need some Heated Water to Start Moonshine', 'error', 7500)
        end
    end, 'm-heatedwater')
end)

RegisterNetEvent('qb-moonshine:client:AddYeast', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then

            QBCore.Functions.Progressbar('name_here', 'Adding Yeast...', 10000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'mini@repair',
                anim = 'fixing_a_ped',
                flags = 16,
            }, {}, {}, function()
                TriggerServerEvent('qb-moonshine:server:AddYeast')
                QBCore.Functions.Notify('You Added some yeast', 'primary', 7500)
                ClearPedTasks(PlayerPedId())
            end)
        else
            QBCore.Functions.Notify('You missed a step in the process', 'error', 7500)
        end
    end, 'm-heatedbarley')
end)

RegisterNetEvent('qb-moonshine:client:AddMash', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then

            QBCore.Functions.Progressbar('name_here', 'Adding Mash...', 10000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'mini@repair',
                anim = 'fixing_a_ped',
                flags = 16,
            }, {}, {}, function()
                TriggerServerEvent('qb-moonshine:server:AddMash')
                QBCore.Functions.Notify('You add some mash', 'primary', 7500)
                ClearPedTasks(PlayerPedId())
            end)
        else
            QBCore.Functions.Notify('You missed a step. try again', 'error', 7500)
        end
    end, 'm-heatedmixture')
end)

RegisterNetEvent('qb-moonshine:client:FinishMoonshine', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then

            QBCore.Functions.Progressbar('name_here', 'Finishing Up...', 10000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'mini@repair',
                anim = 'fixing_a_ped',
                flags = 16,
            }, {}, {}, function()
                TriggerServerEvent('qb-moonshine:server:FinishMoonshine')
                QBCore.Functions.Notify('You made a batch of moonshine', 'primary', 7500)
                ClearPedTasks(PlayerPedId())
            end)
        else
            QBCore.Functions.Notify('You missed a step, go back', 'error', 7500)
        end
    end, 'm-moonshinemix')
end)

RegisterNetEvent('qb-menu:client:BuyMoonshineIngredients', function(data)
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
end)

CreateThread(function()
    if Config.EnableLocations == "enabled" then
        while true do
            sleep = 100
            local pos = GetEntityCoords(PlayerPedId())
            local PlayerData = QBCore.Functions.GetPlayerData()
            
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
                if #(pos - vector3(v.x, v.y, v.z)) < 20 then
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

            for k, v in pairs(Config.MoonshineLocations["pick-potato2"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 20 then
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
                if #(pos - vector3(v.x, v.y, v.z)) < 20 then
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

            for k, v in pairs(Config.MoonshineLocations["pick-barley2"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 20 then
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
    QBCore.Functions.Progressbar("grind_coke", "Picking Potatos ..", math.random(5000,6000), false, true, {
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
    QBCore.Functions.Progressbar("grind_coke", "Picking Barley ..", math.random(5000,6000), false, true, {
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