title @s title {"text":"异常生命体征","color":"red","bold":true}
title @s subtitle {"text":"6格内检测到感染信号","color":"dark_red"}
title @s actionbar {"text":"检测到异常","color":"red","bold":true}
effect give @s minecraft:nausea 2 0 true
playsound minecraft:block.bell.use player @s ~ ~ ~ 1 0.5
playsound minecraft:block.beacon.deactivate player @s ~ ~ ~ 0.7 1.8
particle minecraft:dust{color:[1.0,0.0,0.0],scale:1.0} ~ ~1 ~ 0.6 0.4 0.6 0.03 30 force @s
