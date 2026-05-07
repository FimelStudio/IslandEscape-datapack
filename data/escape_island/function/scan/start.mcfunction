execute if score @s scan_station_cd matches 1.. run return 0
execute if score @s scan_active matches 1.. run return 0

scoreboard players set @s scan_active 1
scoreboard players set @s scan_time 120
scoreboard players set @s scan_result 0

bossbar set escape_island:scan name {"text":"隔离扫描读条","color":"blue"}
bossbar set escape_island:scan visible true
bossbar set escape_island:scan players @a[tag=team.human,tag=!state.dead,distance=..12]
bossbar set escape_island:scan max 120
execute store result bossbar escape_island:scan value run scoreboard players get @s scan_time

execute at @s run tellraw @a[tag=team.human,tag=!state.dead,distance=..12] {"text":"[隔离扫描] 读条开始：需要至少 2 名幸存者协作。","color":"aqua"}
execute at @s run playsound minecraft:block.beacon.power_select master @a[distance=..16] ~ ~ ~ 0.8 1.2
