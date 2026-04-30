advancement revoke @s only escape_island:interaction/hold_fuel_cell
scoreboard players set @s gen_hold_seen 2

execute unless score $game in_game matches 1 run scoreboard players set @s gen_hold_time 0
execute unless score $game in_game matches 1 run scoreboard players set @s gen_hold_lock 0
execute unless score $game in_game matches 1 run title @s actionbar {"text":"[DEBUG] 游戏未开始","color":"red"}
execute unless score $game in_game matches 1 run return 0

execute if score $game gen_state matches 1.. run scoreboard players set @s gen_hold_time 0
execute if score $game gen_state matches 1.. run scoreboard players set @s gen_hold_lock 0
execute if score $game gen_state matches 1.. run return 0

execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,limit=1] run scoreboard players set @s gen_hold_time 0
execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,limit=1] run scoreboard players set @s gen_hold_lock 0
execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,limit=1] run title @s actionbar {"text":"离发电机太远！","color":"red"}
execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,limit=1] run return 0

execute unless items entity @s weapon.mainhand *[custom_data~{item:"fuel_cell"}] run scoreboard players set @s gen_hold_time 0
execute unless items entity @s weapon.mainhand *[custom_data~{item:"fuel_cell"}] run scoreboard players set @s gen_hold_lock 0
execute unless items entity @s weapon.mainhand *[custom_data~{item:"fuel_cell"}] run title @s actionbar {"text":"需要手持燃料电池","color":"red"}
execute unless items entity @s weapon.mainhand *[custom_data~{item:"fuel_cell"}] run return 0

execute if score @s gen_hold_lock matches 1 run return 0

scoreboard players add @s gen_hold_time 1
execute if score @s gen_hold_time matches 10 run tellraw @s {"text":"§6燃料正在注入发电机……","color":"gold"}
execute if score @s gen_hold_time matches 20 run function escape_island:task/generator_use