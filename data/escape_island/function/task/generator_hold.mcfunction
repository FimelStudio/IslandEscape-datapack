advancement revoke @s only escape_island:interaction/hold_fuel_cell
scoreboard players set @s gen_hold_seen 2

execute unless score $game in_game matches 1 run scoreboard players set @s gen_hold_time 0
execute unless score $game in_game matches 1 run scoreboard players set @s gen_hold_lock 0
execute unless score $game in_game matches 1 run title @s actionbar {"text":"[DEBUG] 游戏未开始","color":"red"}
execute unless score $game in_game matches 1 run return 0

execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,limit=1] run scoreboard players set @s gen_hold_time 0
execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,limit=1] run scoreboard players set @s gen_hold_lock 0
execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,limit=1] run title @s actionbar {"text":"离发电机太远！","color":"red"}
execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,limit=1] run return 0

execute if entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,scores={gen_state=1..4},limit=1] run scoreboard players set @s gen_hold_time 0
execute if entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,scores={gen_state=1..4},limit=1] run scoreboard players set @s gen_hold_lock 0
execute if entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,scores={gen_state=1..4},limit=1] run title @s actionbar {"text":"燃料已投入，对发电机按住右键互动","color":"yellow"}
execute if entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,scores={gen_state=1..4},limit=1] run return 0

execute unless items entity @s weapon.mainhand *[custom_data~{item:"fuel_cell"}] run scoreboard players set @s gen_hold_time 0
execute unless items entity @s weapon.mainhand *[custom_data~{item:"fuel_cell"}] run scoreboard players set @s gen_hold_lock 0
execute unless items entity @s weapon.mainhand *[custom_data~{item:"fuel_cell"}] run title @s actionbar {"text":"需要手持燃料电池","color":"red"}
execute unless items entity @s weapon.mainhand *[custom_data~{item:"fuel_cell"}] run return 0

tag @e[type=minecraft:marker,tag=marker.generator] remove gen.aimed
execute anchored eyes positioned ^ ^ ^1 positioned ~ ~-1.0 ~ as @e[type=minecraft:marker,tag=marker.generator,distance=..1.25,sort=nearest,limit=1] run tag @s add gen.aimed
execute anchored eyes positioned ^ ^ ^2 positioned ~ ~-1.0 ~ as @e[type=minecraft:marker,tag=marker.generator,distance=..1.25,sort=nearest,limit=1] run tag @s add gen.aimed
execute anchored eyes positioned ^ ^ ^3 positioned ~ ~-1.0 ~ as @e[type=minecraft:marker,tag=marker.generator,distance=..1.25,sort=nearest,limit=1] run tag @s add gen.aimed
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..2.8,limit=1] run scoreboard players set @s gen_hold_time 0
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..2.8,limit=1] run scoreboard players set @s gen_hold_lock 0
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..2.8,limit=1] run title @s actionbar {"text":"请面向发电机投入燃料","color":"yellow"}
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..2.8,limit=1] run return 0

execute if score @s gen_hold_lock matches 1 run return 0

scoreboard players add @s gen_hold_time 1
title @s actionbar [{"text":"燃料注入中 ","color":"gold"},{"score":{"name":"@s","objective":"gen_hold_time"}},{"text":"/20","color":"gold"}]
execute if score @s gen_hold_time matches 10 run playsound minecraft:block.piston.extend master @s ~ ~ ~ 0.6 1.6
execute if score @s gen_hold_time matches 20 run function escape_island:task/generator_use
