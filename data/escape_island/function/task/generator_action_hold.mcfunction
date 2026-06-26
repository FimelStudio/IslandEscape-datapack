advancement revoke @s only escape_island:interaction/hold_generator_action
scoreboard players set @s gen_hold_seen 2
tag @s remove gen.channel.sabotage
tag @s remove gen.channel.repair

execute unless score $game in_game matches 1 run scoreboard players set @s gen_hold_time 0
execute unless score $game in_game matches 1 run title @s actionbar {"text":"游戏未开始","color":"red"}
execute unless score $game in_game matches 1 run return 0

execute unless items entity @s weapon.mainhand *[custom_data~{item:"generator_action"}] unless items entity @s weapon.offhand *[custom_data~{item:"generator_action"}] run scoreboard players set @s gen_hold_time 0
execute unless items entity @s weapon.mainhand *[custom_data~{item:"generator_action"}] unless items entity @s weapon.offhand *[custom_data~{item:"generator_action"}] run title @s actionbar {"text":"需要靠近发电机获得交互器","color":"red"}
execute unless items entity @s weapon.mainhand *[custom_data~{item:"generator_action"}] unless items entity @s weapon.offhand *[custom_data~{item:"generator_action"}] run return 0

function escape_island:task/generator_channel_mark_aimed
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,limit=1] run scoreboard players set @s gen_hold_time 0
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,limit=1] run title @s actionbar {"text":"请面向发电机","color":"yellow"}
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,limit=1] run return 0

execute if entity @s[tag=infected.mother,tag=!state.hunting] run scoreboard players set @s gen_hold_time 0
execute if entity @s[tag=infected.mother,tag=!state.hunting] run title @s actionbar {"text":"伪装状态无法直接操作发电机","color":"gray"}
execute if entity @s[tag=infected.mother,tag=!state.hunting] run return 0
execute if entity @s[tag=team.infected,tag=!infected.mother] run function escape_island:task/generator_channel_sabotage_tick
execute if entity @s[tag=infected.mother,tag=state.hunting] run function escape_island:task/generator_channel_sabotage_tick
execute if entity @s[tag=team.human] run function escape_island:task/generator_channel_repair_tick
