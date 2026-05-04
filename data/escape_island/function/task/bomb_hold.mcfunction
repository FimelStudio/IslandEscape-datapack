advancement revoke @s only escape_island:interaction/hold_bomb

execute unless score $game in_game matches 1 run scoreboard players set @s bomb_repair_time 0
execute unless score $game in_game matches 1 run return 0

execute if score $game bomb_armed matches 1 run scoreboard players set @s bomb_repair_time 0
execute if score $game bomb_armed matches 1 run title @s actionbar {"text":"自爆装置已激活","color":"red"}
execute if score $game bomb_armed matches 1 run return 0

execute unless entity @e[type=minecraft:marker,tag=marker.island_bomb,distance=..2.5,limit=1] run scoreboard players set @s bomb_repair_time 0
execute unless entity @e[type=minecraft:marker,tag=marker.island_bomb,distance=..2.5,limit=1] run title @s actionbar {"text":"离自爆装置太远，操作中断","color":"red"}
execute unless entity @e[type=minecraft:marker,tag=marker.island_bomb,distance=..2.5,limit=1] run return 0

execute if score $game signal_done matches 0 run scoreboard players set @s bomb_repair_time 0
execute if score $game signal_done matches 0 run title @s actionbar {"text":"需要先修复信号塔","color":"red"}
execute if score $game signal_done matches 0 run return 0

execute store result score @s bomb_file_count run clear @s minecraft:paper[minecraft:custom_data={item:"prometheus_file"}] 0
execute unless score @s bomb_file_count matches 3.. run scoreboard players set @s bomb_repair_time 0
execute unless score @s bomb_file_count matches 3.. run title @s actionbar [{"text":"需要 3 份普罗米修斯文件","color":"red"},{"text":" (当前: ","color":"gray"},{"score":{"name":"@s","objective":"bomb_file_count"}},{"text":")","color":"gray"}]
execute unless score @s bomb_file_count matches 3.. run return 0

scoreboard players add @s bomb_repair_time 1

execute if entity @s[tag=has_gas_mask] run scoreboard players add @s bomb_repair_time 1

title @s actionbar [{"text":"正在激活自爆装置 ","color":"dark_red"},{"score":{"name":"@s","objective":"bomb_repair_time"}},{"text":"/600","color":"dark_red"}]

execute if score @s bomb_repair_time matches 600.. run function escape_island:task/bomb_activate
