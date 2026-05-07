tag @s add state.boarding
tag @s add state.boarding.heli
tag @s remove state.boarding.ship
tag @s remove state.boarding.sub
gamemode spectator @s
title @s title {"text":"已登机","color":"gold","bold":true}
title @s subtitle {"text":"等待直升机起飞","color":"yellow"}
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 1.5
