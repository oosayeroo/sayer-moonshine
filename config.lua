Config = {}

Config.JimMenu = false --set true if using jims menu found here https://github.com/jimathy/qb-menu

Config.EnableLocations = "enabled"  --dont change this as third eye not setup
Config.MoonshineLocations = {
    ["pick-potato1"] = {    --picking locations have a 20 metre radius. so best not to put them too close together. i designed it to work in a field
        [1] = vector3(2265.37, 5046.59, 44.35),
    },
    ["pick-potato2"] = {
        [1] = vector3(2251.11, 5061.73, 45.61),
    },
    ["pick-barley1"] = {
        [1] = vector3(2224.25, 5088.56, 49.33),
    },
    ["pick-barley2"] = {
        [1] = vector3(2205.49, 5107.97, 50.74),
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
    ["add-mash"] = {   --stage 4
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
Config.PotatoHarvestAmount = math.random(1, 4)  --amount of potato to harvest each time
Config.BarleyHarvestAmount = math.random(1, 4)  -- amont of barley to harvest each time

--shop--
Config.IngredientCost = math.random(100, 150)    --how much it costs for the jars
Config.JarAmount = math.random(10, 20)  --how many jars you purchase for price above
Config.YeastAmount = math.random(10, 20)  --amount of yeast to buy in one purchase
Config.MashAmount = math.random(1, 3)  --amount of mash to get from 1 potato
Config.YeastCost = math.random(20, 50)  -- cost of purchasing yeast
Config.BatchAmount = math.random(3, 8)     --how many moonshine you end up with by end of all stages

--selling--
Config.SellItemLocation = vector3(1538.85, 6322.41, 24.61)  --location to sell moonshine
Config.MoonshineValue = 100  --how much 1 moonshine sells for at sell location

--BREAK/FAIL SYSTEM--
Config.EnableFailing = true --can fail a process
Config.FailChance = 10 --in % chance that you fail a step.


