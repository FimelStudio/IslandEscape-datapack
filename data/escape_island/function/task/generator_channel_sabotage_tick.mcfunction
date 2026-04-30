function escape_island:task/generator_channel_mark_aimed
execute unless score $game in_game matches 1 run function escape_island:task/generator_reset_hold
execute unless score $game in_game matches 1 run return 0
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2},limit=1] run function escape_island:task/generator_reset_hold
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=1},limit=1] run title @s actionbar {"text":"发电机预热中，暂不能破坏","color":"gold"}
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=1},limit=1] run return 0
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2},limit=1] run return 0

scoreboard players add @s gen_hold_time 1
execute as @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,sort=nearest,limit=1] run tag @s add gen.sabotaged
title @s actionbar [{"text":"破坏发电机 ","color":"red"},{"score":{"name":"@s","objective":"gen_hold_time"}},{"text":"/40 | 过载 ","color":"red"},{"score":{"name":"@e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,sort=nearest,limit=1]","objective":"gen_overload"}},{"text":"/20","color":"red"}]
execute if score @s gen_hold_time matches 40.. as @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,sort=nearest,limit=1] run scoreboard players add @s gen_overload 4
execute if score @s gen_hold_time matches 40.. as @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,sort=nearest,limit=1] if score @s gen_overload matches 21.. run scoreboard players set @s gen_overload 20
execute if score @s gen_hold_time matches 40.. at @s run playsound minecraft:block.respawn_anchor.deplete master @s ~ ~ ~ 0.5 0.8
execute if score @s gen_hold_time matches 40.. run scoreboard players set @s gen_hold_time 0
