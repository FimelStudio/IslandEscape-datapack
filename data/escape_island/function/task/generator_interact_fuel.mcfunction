execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=0},limit=1] run scoreboard players set @s gen_hold_time 0
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=0},limit=1] run function escape_island:task/generator_use
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=0},limit=1] run return 0

scoreboard players add @s gen_hold_time 1
title @s actionbar [{"text":"燃料注入中 ","color":"gold"},{"score":{"name":"@s","objective":"gen_hold_time"}},{"text":"/20","color":"gold"}]
execute if score @s gen_hold_time matches 10 run playsound minecraft:block.piston.extend master @s ~ ~ ~ 0.6 1.6
execute if score @s gen_hold_time matches 20.. run function escape_island:task/generator_use
