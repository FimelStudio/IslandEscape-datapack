execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,limit=1] run tellraw @s {"text":"§c需要站在发电机旁投入燃料。","color":"red"}
execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,limit=1] run return 0
execute if entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,scores={gen_state=1},limit=1] run tellraw @s {"text":"§e发电机正在预热，燃料已经足够。","color":"yellow"}
execute if entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,scores={gen_state=1},limit=1] run return 0
execute if entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,scores={gen_state=2},limit=1] run tellraw @s {"text":"§a发电机正在稳定运行。","color":"green"}
execute if entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,scores={gen_state=2},limit=1] run return 0
execute if entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,scores={gen_state=3},limit=1] run tellraw @s {"text":"§c发电机过载熄火了，对着发电机按住右键维修即可，不会消耗电池。","color":"red"}
execute if entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,scores={gen_state=3},limit=1] run return 0
execute if entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,scores={gen_state=4},limit=1] run tellraw @s {"text":"§a这座发电机已经稳定完成。","color":"green"}
execute if entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,scores={gen_state=4},limit=1] run return 0
execute unless items entity @s weapon.mainhand *[custom_data~{item:"fuel_cell"}] run return 0
tag @e[type=minecraft:marker,tag=marker.generator] remove gen.aimed
execute anchored eyes positioned ^ ^ ^1 positioned ~ ~-1.0 ~ as @e[type=minecraft:marker,tag=marker.generator,distance=..1.25,sort=nearest,limit=1] run tag @s add gen.aimed
execute anchored eyes positioned ^ ^ ^2 positioned ~ ~-1.0 ~ as @e[type=minecraft:marker,tag=marker.generator,distance=..1.25,sort=nearest,limit=1] run tag @s add gen.aimed
execute anchored eyes positioned ^ ^ ^3 positioned ~ ~-1.0 ~ as @e[type=minecraft:marker,tag=marker.generator,distance=..1.25,sort=nearest,limit=1] run tag @s add gen.aimed
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..2.8,limit=1] run tellraw @s {"text":"§e需要面向发电机投入燃料。","color":"yellow"}
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..2.8,limit=1] run return 0

clear @s *[custom_data~{item:"fuel_cell"}] 1
tag @s add gen.user
execute as @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..2.8,sort=nearest,limit=1] at @s run function escape_island:task/generator_add_fuel
tag @s remove gen.user
scoreboard players set @s gen_hold_lock 1
scoreboard players set @s gen_hold_time 0
