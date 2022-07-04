local QBCore = exports['qb-core']:GetCoreObject()

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

RegisterNetEvent('qb-moonshine:client:GetBarley', function()
    QBCore.Functions.Progressbar('name_here', 'Purchasing Barley...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'idle',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('qb-moonshine:server:GetBarley')
        QBCore.Functions.Notify('You Bought some Barley', 'primary', 7500)
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
    QBCore.Functions.Progressbar('name_here', 'Purchasing Mash...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'idle',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('qb-moonshine:server:GetMash')
        QBCore.Functions.Notify('You Bought some Mash', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('qb-moonshine:client:HeatWater', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then

            QBCore.Functions.Progressbar('name_here', 'Heating Water...', 5000, false, true, {
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

            QBCore.Functions.Progressbar('name_here', 'Adding Barley...', 5000, false, true, {
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

            QBCore.Functions.Progressbar('name_here', 'Adding Yeast...', 5000, false, true, {
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

            QBCore.Functions.Progressbar('name_here', 'Adding Mash...', 5000, false, true, {
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

            QBCore.Functions.Progressbar('name_here', 'Finishing Up...', 5000, false, true, {
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
            
            header = "• Barley",
            txt = "Buy Some Barley",
            params = {
                event = "qb-moonshine:client:GetBarley"
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
            
            header = "• Mashed Potato",
            txt = "Buy some mash",
            params = {
                event = "qb-moonshine:client:GetMash"
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