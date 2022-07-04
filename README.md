# qb-moonshine
a simple moonshine making script with configurable locations, prices, amounts etc. 

# Dependencies:
- qb-core - https://github.com/qbcore-framework/qb-core
- qb-target - https://github.com/qbcore-framework/qb-target


# How to Setup:

Add to qb-core/shared/items.lua:
```
	--qb-moonshine
	['m-moonshine'] 			     = {['name'] = 'm-moonshine', 		     	   	['label'] = 'Moonshine', 		    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'm-moonshine.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'a good jug of moonshine'},
    ['m-waterjar'] 		         	 = {['name'] = 'm-waterjar', 			       	['label'] = 'Water Jar', 	    	['weight'] = 400, 		['type'] = 'item', 		['image'] = 'm-waterjar.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'a large water jar'},
    ['m-heatedwater'] 		       	 = {['name'] = 'm-heatedwater', 	        	['label'] = 'Stage 1 Mix', 	     	['weight'] = 300, 		['type'] = 'item', 		['image'] = 'm-heatedwater.png', 	       	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Very Hot Water'},
    ['m-heatedbarley'] 		       	 = {['name'] = 'm-heatedbarley', 	         	['label'] = 'Stage 2 Mix',         	['weight'] = 300, 		['type'] = 'item', 		['image'] = 'm-heatedbarley.png', 	       	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Very Hot Barley Mixture'},
    ['m-heatedmixture']         	 = {['name'] = 'm-heatedmixture', 	         	['label'] = 'Stage 3 Mix', 	       	['weight'] = 300, 		['type'] = 'item', 		['image'] = 'm-heatedmixture.png', 	       	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Hot Mess'},
    ['m-moonshinemix'] 	           	 = {['name'] = 'm-moonshinemix', 	         	['label'] = 'Stage 4 Mix', 	       	['weight'] = 300, 		['type'] = 'item', 		['image'] = 'm-moonshinemix.png', 	       	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Final Mix Stage'},
	['m-yeast'] 	             	 = {['name'] = 'm-yeast', 	                	['label'] = 'Yeast', 	         	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'm-yeast.png', 	            	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Yeast For Mixing Things'},
	['m-barley'] 	              	 = {['name'] = 'm-barley', 	                	['label'] = 'Barley', 	         	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'm-barley.png', 	          	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Barley For Mixing Things'},
	['m-mash'] 	                 	 = {['name'] = 'm-mash', 	                	['label'] = 'Mash', 	         	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'm-mash.png', 	            	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Mashed Potato, Good For Mixing'},

```

Add Images From qb-moonshine/images to qb-inventory/html/images

## Add To Small Resources/Server/Consumable
```
QBCore.Functions.CreateUseableItem("m-moonshine", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)
```

## Add to Small Resources/Config alcohol section
```
 ["m-moonshine"] = math.random(20, 30),
 ```
