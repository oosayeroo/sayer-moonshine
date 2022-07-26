Config = {}

Config.EnableLocations = "enabled"  --dont change this
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

--harvest--
--POTATO--
Config.MinPotatoHarvestAmount = 2  --amount of potato to harvest each time
Config.MaxPotatoHarvestAmount = 4

--BARLEY--
Config.BarleyHarvestAmount = 2  -- amont of barley to harvest each time
Config.MaxBarleyHarvestAmount = 4

--shop--
Config.MinIngredientCost = 100  --how much it costs for the jars MINIMUM
Config.MaxIngredientCost = 150  --how much it cost for the jars MAXIMUM

--JAR--
Config.MinJarAmount = 10  --how many jars you purchase for price above MINIMUM
Config.MaxJarAmount = 20  --how many jars you purchase for price above MAXIMUM

--MASH--
Config.MinMashAmount = 1  --amount of mash to get from 1 potato
Config.MaxMashAmount = 3

--YEAST--
Config.MinYeastCost = 20  -- cost of purchasing yeast
Config.MaxYeastCost = 50

--YEAST PRICE--
Config.MinYeastAmount = 10 --amount of yeast to buy in one purchase
Config.MaxYeastAmount = 20

--PRODUCT--
Config.MinBatchAmount = 3    --how much moonshine you end up with by end of all stages
Config.MaxBatchAmount = 10

--selling--
Config.SellItemLocation = vector3(1538.85, 6322.41, 24.61)  --location to sell moonshine
Config.MoonshineValue = 100  --how much 1 moonshine sells for at sell location
