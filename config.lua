Config = {}

Config.EnableLocations = "enabled"  --dont change this
Config.MoonshineLocations = {
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


Config.IngredientCost = math.random(100, 150)    --how much it costs for the jars
Config.JarAmount = math.random(10, 20)  --how many jars you purchase for price above
Config.YeastAmount = math.random(10, 20)  --amount of yeast to buy in one purchase
Config.MashAmount = math.random(10, 20)  --amount of mash to buy in one purchase
Config.BarleyAmount = math.random(10, 20) --amount of barley to buy in one purchase
Config.YeastCost = math.random(20, 50)  -- cost of purchasing yeast
Config.MashCost = math.random(15, 30)  --cost of purchasing mash
Config.BarleyCost = math.random(25, 50)   --cost of purchasing barley
Config.BatchAmount = math.random(3, 8)     --how many moonshine you end up with by end of all stages

