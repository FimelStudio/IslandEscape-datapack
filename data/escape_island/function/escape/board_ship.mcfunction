tag @s add state.boarding
tag @s add state.boarding.ship
tag @s remove state.boarding.heli
tag @s remove state.boarding.sub
gamemode spectator @s
title @s title {"text":"已登船","color":"aqua","bold":true}
title @s subtitle {"text":"等待海风号离港","color":"white"}
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 1.5
