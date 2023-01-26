Config = {}

Config.JimShops = false --set true if using jims menu found here https://github.com/jimathy/qb-menu
Config.MoneyType = 'cash' --what account you wanna use / cash/bank/blackmoney etc
Config.Items = { --these are items you require so if you want to change them to an existing item in your server change the second variable so ["Trowel"] = changeme,
--DO NOT CHANGE THE FIRST VARIABLE THAT IS NEEDED!!!
    ["Trowel"] = "trowel",
    ["Waterjar"] = "m-waterjar",
    ["Yeast"] = "m-yeast",
    ["Potato"] = "m-potato",
    ["Barley"] = "m-barley",
    ["Mash"] = "m-mash",
    ["HeatedWater"] = "m-heatedwater",
    ["HeatedBarley"] = "m-heatedbarley",
    ["HeatedMixture"] = "m-heatedmixture",
    ["MoonshineMix"] = "m-moonshinemix",
    ["Moonshine"] = "m-moonshine"
}

Config.ShopBlip = true
Config.Shop = {
    ["Sprite"] = 52,
    ["Colour"] = 1,
    ["Size"] = 0.5,
    ["Label"] = "Moonshine Ingredients",
}
Config.IngredientShop = {
    label = "Moonshine Ingredients",
        slots = 6,  --make sure this number is the same as the amount of items you have in this list or it wont work
        items = {
            [1] = {
                name = "m-waterjar",
                price = 5,
                amount = 50,
                info = {},
                type = "item",
                slot = 1,
            },
            [2] = {
                name = "m-yeast",
                price = 5,
                amount = 50,
                info = {},
                type = "item",
                slot = 2,
            },
        }
}
Config.EnableLocations = "enabled"  --dont change this as third eye not setup
Config.MoonshineLocations = {
    ["pick-potato1"] = {    --picking locations have a 20 metre radius. so best not to put them too close together. i designed it to work in a field
        [1] = vector3(2265.37, 5046.59, 44.35),
        [2] = vector3(2251.11, 5061.73, 45.61),
    },
    ["pick-barley1"] = {
        [1] = vector3(2224.25, 5088.56, 49.33),
        [2] = vector3(2205.49, 5107.97, 50.74),
    },
    ["buy-ingredients"] = {
        [1] = vector3(1697.43, 4872.3, 42.03),
    },
    ["heat-water"] = {  --stage 1
        [1] = vector3(1389.68, 3603.35, 38.94),
    },
    ["add-barley"] = {  --stage 2
        [1] = vector3(1391.84, 3606.03, 38.94),
    },
    ["add-yeast"] = {  --stage 3
        [1] = vector3(1394.57, 3601.86, 38.94),
    },
    ["ferment-mash"] = {   --stage 4
        [1] = vector3(1396.66, 3605.12, 38.94),
    },
    ["finish-moonshine"] = {   --stage 5
        [1] = vector3(1389.71, 3608.76, 38.94),
    },
}

--TIMINGS--
Config.ActionTime = 10 --in seconds (10 = 10 seconds)
Config.PickingTime = 10

--harvest--
Config.PickingRadius = 20 --how big the area you can pick at picking locations (20 is the default i left it at but change to whatever you like)
Config.PotatoHarvestAmount = math.random(1, 4)  --amount of potato to harvest each time
Config.BarleyHarvestAmount = math.random(1, 4)  -- amont of barley to harvest each time

--amounts --
Config.MashAmountNeeded = 1 --amount of mash you need to add to make next step
Config.YeastAmountNeeded = 1
Config.BarleyAmountNeeded = 1
Config.MashAmount = math.random(1, 3)  --amount of mash to get from 1 potato
Config.BatchAmount = math.random(3, 8)     --how many moonshine you end up with by end of all stages

--selling--
Config.SellItemLocation = vector3(1538.85, 6322.41, 24.61)  --location to sell moonshine
Config.MoonshineValue = 100  --how much 1 moonshine sells for at sell location

--BREAK/FAIL SYSTEM--
Config.EnableFailing = true --can fail a process
Config.LoseOnFail = false --makes it so you lose the item upon failing if you have enablefailing = true
Config.FireOnFail = true --[VERY FUN] [BOOM]
Config.FailChance = 20 --in % chance that you fail a step.
Config.FireChance = 5 --in % out of 100 