# qb-moonshine
a simple moonshine making script with configurable locations, prices, amounts etc. 

# Dependencies:
- qb-core - https://github.com/qbcore-framework/qb-core
- qb-target - https://github.com/qbcore-framework/qb-target


# How to Setup:

Add to qb-core/shared/items.lua:
```
	--qb-moonshine
	['m-moonshine'] 			     = {['name'] = 'm-moonshine', 		     	   	['label'] = 'Moonshine', 		    ['weight'] = 200, 		['type'] = 'item', 		['image'] = 'm-moonshine.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'a good jug of moonshine'},
    ['m-waterjar'] 		         	 = {['name'] = 'm-waterjar', 			       	['label'] = 'Water Jar', 	    	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'm-waterjar.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'a large water jar'},
    ['m-heatedwater'] 		       	 = {['name'] = 'm-heatedwater', 	        	['label'] = 'Stage 1 Mix', 	     	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'm-heatedwater.png', 	       	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Very Hot Water'},
    ['m-heatedbarley'] 		       	 = {['name'] = 'm-heatedbarley', 	         	['label'] = 'Stage 2 Mix',         	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'm-heatedbarley.png', 	       	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Very Hot Barley Mixture'},
    ['m-heatedmixture']         	 = {['name'] = 'm-heatedmixture', 	         	['label'] = 'Stage 3 Mix', 	       	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'm-heatedmixture.png', 	       	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Hot Mess'},
    ['m-moonshinemix'] 	           	 = {['name'] = 'm-moonshinemix', 	         	['label'] = 'Stage 4 Mix', 	       	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'm-moonshinemix.png', 	       	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Final Mix Stage'},

```

Add Images From qb-moonshine/images to qb-inventory/html/images


