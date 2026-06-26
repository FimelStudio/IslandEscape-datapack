advancement revoke @s only escape_island:interaction/generator_interact
scoreboard players set @s gen_hold_seen 2

execute unless score $game in_game matches 1 run title @s actionbar {"text":"游戏未开始","color":"red"}
execute unless score $game in_game matches 1 run return 0

tag @e[type=minecraft:marker,tag=marker.generator] remove gen.aimed
execute at @s as @e[type=minecraft:marker,tag=marker.generator,distance=..3,sort=nearest,limit=1] run tag @s add gen.aimed
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,limit=1] run title @s actionbar {"text":"离发电机太远","color":"red"}
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,limit=1] run return 0

execute if items entity @s weapon.mainhand *[custom_data~{item:"fuel_cell"}] run function escape_island:task/generator_interact_fuel
execute if items entity @s weapon.mainhand *[custom_data~{item:"fuel_cell"}] run return 0

execute if entity @s[tag=infected.mother,tag=!state.hunting] run title @s actionbar {"text":"伪装状态无法直接操作发电机","color":"gray"}
execute if entity @s[tag=infected.mother,tag=!state.hunting] run return 0
execute if entity @s[tag=team.infected,tag=!infected.mother] run function escape_island:task/generator_interact_sabotage
execute if entity @s[tag=infected.mother,tag=state.hunting] run function escape_island:task/generator_interact_sabotage
execute if entity @s[tag=team.human] run function escape_island:task/generator_interact_repair
