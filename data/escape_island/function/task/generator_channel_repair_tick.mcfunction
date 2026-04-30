function escape_island:task/generator_channel_mark_aimed
execute unless score $game in_game matches 1 run function escape_island:task/generator_reset_hold
execute unless score $game in_game matches 1 run return 0
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2..3},limit=1] run function escape_island:task/generator_reset_hold
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=1},limit=1] run title @s actionbar {"text":"发电机正在预热","color":"gold"}
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=1},limit=1] run return 0
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2..3},limit=1] run return 0
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2,gen_overload=0},limit=1] run scoreboard players set @s gen_hold_time 0
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2,gen_overload=0},limit=1] run scoreboard players set @s gen_hold_lock 0
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2,gen_overload=0},limit=1] run title @s actionbar {"text":"发电机运行正常","color":"green"}
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2,gen_overload=0},limit=1] run return 0

scoreboard players add @s gen_hold_time 1
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2},limit=1] run title @s actionbar [{"text":"维修发电机 ","color":"green"},{"score":{"name":"@s","objective":"gen_hold_time"}},{"text":"/40 | 过载 ","color":"green"},{"score":{"name":"@e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,sort=nearest,limit=1]","objective":"gen_overload"}},{"text":"/20","color":"green"}]
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=3},limit=1] run title @s actionbar [{"text":"故障维修中 ","color":"yellow"},{"score":{"name":"@s","objective":"gen_hold_time"}},{"text":"/60","color":"yellow"}]

execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2},limit=1] if score @s gen_hold_time matches 40.. as @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,sort=nearest,limit=1] run scoreboard players remove @s gen_overload 6
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2},limit=1] if score @s gen_hold_time matches 40.. as @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,sort=nearest,limit=1] if score @s gen_overload matches ..0 run scoreboard players set @s gen_overload 0
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2},limit=1] if score @s gen_hold_time matches 40.. at @s run playsound minecraft:block.copper_bulb.turn_on master @s ~ ~ ~ 0.5 1.4
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2},limit=1] if score @s gen_hold_time matches 40.. run scoreboard players set @s gen_hold_time 0

execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=3},limit=1] if score @s gen_hold_time matches 60.. as @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,sort=nearest,limit=1] run scoreboard players set @s gen_overload 0
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=3},limit=1] if score @s gen_hold_time matches 60.. as @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,sort=nearest,limit=1] run function escape_island:task/generator_restart
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=3},limit=1] if score @s gen_hold_time matches 60.. run scoreboard players set @s gen_hold_time 0
