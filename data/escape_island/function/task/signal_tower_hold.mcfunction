advancement revoke @s only escape_island:interaction/repair_signal
scoreboard players set @s signal_repair_seen 2

execute unless score $game in_game matches 1 run scoreboard players set @s signal_repair_time 0
execute unless score $game in_game matches 1 run title @s actionbar {"text":"游戏未开始，无法接线","color":"red"}
execute unless score $game in_game matches 1 run return 0

execute if score $game signal_done matches 1.. run scoreboard players set @s signal_repair_time 0
execute if score $game signal_done matches 1.. run title @s actionbar {"text":"信号塔已修复完成","color":"green"}
execute if score $game signal_done matches 1.. run return 0

execute if score $game cur_phase matches ..2 run scoreboard players set @s signal_repair_time 0
execute if score $game cur_phase matches ..2 run title @s actionbar {"text":"信号塔还没通电，等到夜晚开始再修复","color":"red"}
execute if score $game cur_phase matches ..2 run return 0

execute unless entity @e[type=minecraft:marker,tag=marker.signal_tower,distance=..2.5,limit=1] run scoreboard players set @s signal_repair_time 0
execute unless entity @e[type=minecraft:marker,tag=marker.signal_tower,distance=..2.5,limit=1] run title @s actionbar {"text":"离信号塔太远，接线中断","color":"red"}
execute unless entity @e[type=minecraft:marker,tag=marker.signal_tower,distance=..2.5,limit=1] run return 0

execute unless items entity @s weapon.mainhand minecraft:string[minecraft:custom_data~{item:"cable"}] run scoreboard players set @s signal_repair_time 0
execute unless items entity @s weapon.mainhand minecraft:string[minecraft:custom_data~{item:"cable"}] run title @s actionbar {"text":"需要手持线缆","color":"red"}
execute unless items entity @s weapon.mainhand minecraft:string[minecraft:custom_data~{item:"cable"}] run return 0

scoreboard players add @s signal_repair_time 1
execute if entity @s[tag=engineer] if score $tick cycle20 matches 0 run scoreboard players add @s signal_repair_time 1
execute if entity @s[tag=engineer] if score $tick cycle20 matches 2 run scoreboard players add @s signal_repair_time 1
execute if entity @s[tag=engineer] if score $tick cycle20 matches 4 run scoreboard players add @s signal_repair_time 1
execute if entity @s[tag=engineer] if score $tick cycle20 matches 6 run scoreboard players add @s signal_repair_time 1
execute if entity @s[tag=engineer] if score $tick cycle20 matches 8 run scoreboard players add @s signal_repair_time 1
execute if entity @s[tag=engineer] if score $tick cycle20 matches 10 run scoreboard players add @s signal_repair_time 1
execute if entity @s[tag=engineer] if score $tick cycle20 matches 12 run scoreboard players add @s signal_repair_time 1
execute if entity @s[tag=engineer] if score $tick cycle20 matches 14 run scoreboard players add @s signal_repair_time 1
execute if entity @s[tag=engineer] if score $tick cycle20 matches 16 run scoreboard players add @s signal_repair_time 1
execute if entity @s[tag=engineer] if score $tick cycle20 matches 18 run scoreboard players add @s signal_repair_time 1
execute if entity @e[type=minecraft:marker,tag=entity.engineer_battery,distance=..4,limit=1] run scoreboard players add @s signal_repair_time 1
execute if entity @s[tag=state.infected_period] if score $tick cycle20 matches 0 run scoreboard players remove @s signal_repair_time 1
execute if entity @s[tag=state.infected_period] if score $tick cycle20 matches 2 run scoreboard players remove @s signal_repair_time 1
execute if entity @s[tag=state.infected_period] if score $tick cycle20 matches 4 run scoreboard players remove @s signal_repair_time 1
execute if entity @s[tag=state.infected_period] if score $tick cycle20 matches 6 run scoreboard players remove @s signal_repair_time 1
execute if entity @s[tag=state.infected_period] if score $tick cycle20 matches 8 run scoreboard players remove @s signal_repair_time 1
execute if entity @s[tag=state.infected_period] if score $tick cycle20 matches 10 run scoreboard players remove @s signal_repair_time 1
execute if entity @s[tag=state.infected_period] if score $tick cycle20 matches 12 run scoreboard players remove @s signal_repair_time 1
execute if entity @s[tag=state.infected_period] if score $tick cycle20 matches 14 run scoreboard players remove @s signal_repair_time 1
execute if entity @s[tag=state.infected_period] if score $tick cycle20 matches 16 run scoreboard players remove @s signal_repair_time 1
execute if entity @s[tag=state.infected_period] if score $tick cycle20 matches 18 run scoreboard players remove @s signal_repair_time 1
execute at @s if score @s signal_repair_time matches 1 run playsound minecraft:block.lever.click master @s ~ ~ ~ 0.6 1.5
execute at @s if score @s signal_repair_time matches 20 run playsound minecraft:block.lever.click master @s ~ ~ ~ 0.6 1.4
execute at @s if score @s signal_repair_time matches 40 run playsound minecraft:block.lever.click master @s ~ ~ ~ 0.6 1.3
execute at @s if score @s signal_repair_time matches 60 run playsound minecraft:block.lever.click master @s ~ ~ ~ 0.6 1.2
execute at @s if score @s signal_repair_time matches 80 run playsound minecraft:block.lever.click master @s ~ ~ ~ 0.6 1.1
execute at @e[type=minecraft:marker,tag=marker.signal_tower,sort=nearest,limit=1] if score @s signal_repair_time matches 20 run particle minecraft:electric_spark ~ ~1 ~ 0.25 0.25 0.25 0.02 8 force
execute at @e[type=minecraft:marker,tag=marker.signal_tower,sort=nearest,limit=1] if score @s signal_repair_time matches 40 run particle minecraft:electric_spark ~ ~1 ~ 0.25 0.25 0.25 0.02 8 force
execute at @e[type=minecraft:marker,tag=marker.signal_tower,sort=nearest,limit=1] if score @s signal_repair_time matches 60 run particle minecraft:electric_spark ~ ~1 ~ 0.25 0.25 0.25 0.02 8 force
execute at @e[type=minecraft:marker,tag=marker.signal_tower,sort=nearest,limit=1] if score @s signal_repair_time matches 80 run particle minecraft:electric_spark ~ ~1 ~ 0.25 0.25 0.25 0.02 8 force
title @s actionbar [{"text":"接线中 ","color":"yellow"},{"score":{"name":"@s","objective":"signal_repair_time"}},{"text":"/100","color":"yellow"}]

execute if score @s signal_repair_time matches 100.. run function escape_island:task/signal_tower_repair
