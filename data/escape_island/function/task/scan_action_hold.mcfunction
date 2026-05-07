advancement revoke @s only escape_island:interaction/hold_scan_action

execute unless score $game in_game matches 1 run title @s actionbar {"text":"游戏未开始","color":"red"}
execute unless score $game in_game matches 1 run return 0
execute unless score $game cur_phase matches 3..4 run title @s actionbar {"text":"当前阶段不可用隔离扫描","color":"red"}
execute unless score $game cur_phase matches 3..4 run return 0

execute unless items entity @s weapon.mainhand *[custom_data~{item:"scan_action"}] unless items entity @s weapon.offhand *[custom_data~{item:"scan_action"}] run title @s actionbar {"text":"需要扫描交互器","color":"red"}
execute unless items entity @s weapon.mainhand *[custom_data~{item:"scan_action"}] unless items entity @s weapon.offhand *[custom_data~{item:"scan_action"}] run return 0

tag @e[type=minecraft:marker,tag=scan.target] remove scan.target
execute at @s as @e[type=minecraft:marker,tag=scan.station,distance=..3,sort=nearest,limit=1] run tag @s add scan.target

execute unless entity @e[type=minecraft:marker,tag=scan.target,limit=1] run title @s actionbar {"text":"请靠近隔离扫描站","color":"yellow"}
execute unless entity @e[type=minecraft:marker,tag=scan.target,limit=1] run return 0

execute as @e[type=minecraft:marker,tag=scan.target,scores={scan_station_cd=1..},limit=1] run scoreboard players operation $scan_cd_show scan_result = @s scan_station_cd
execute if entity @e[type=minecraft:marker,tag=scan.target,scores={scan_station_cd=1..},limit=1] run title @s actionbar [{"text":"扫描站冷却中 ","color":"yellow"},{"score":{"name":"$scan_cd_show","objective":"scan_result"}},{"text":"秒","color":"yellow"}]
execute if entity @e[type=minecraft:marker,tag=scan.target,scores={scan_station_cd=1..},limit=1] run tag @e[type=minecraft:marker,tag=scan.target] remove scan.target
execute if entity @e[type=minecraft:marker,tag=scan.target,scores={scan_station_cd=1..},limit=1] run return 0

execute as @e[type=minecraft:marker,tag=scan.target,scores={scan_active=0},limit=1] run function escape_island:scan/start

execute as @e[type=minecraft:marker,tag=scan.target,limit=1] at @s run scoreboard players set $scan_readers scan_result 0
execute as @e[type=minecraft:marker,tag=scan.target,limit=1] at @s as @a[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,distance=..3] run scoreboard players add $scan_readers scan_result 1

execute if score $scan_readers scan_result matches ..1 run title @s actionbar {"text":"隔离扫描需要至少2名幸存者","color":"yellow"}

execute if score $scan_readers scan_result matches 2.. as @e[type=minecraft:marker,tag=scan.target,limit=1] run scoreboard players set @s scan_result 1
execute if score $scan_readers scan_result matches 2.. as @e[type=minecraft:marker,tag=scan.target,scores={scan_time=120},limit=1] at @s if entity @a[tag=role.virologist,tag=team.human,tag=!state.dead,distance=..3,limit=1] run scoreboard players set @s scan_time 80
execute if score $scan_readers scan_result matches 2.. as @e[type=minecraft:marker,tag=scan.target,limit=1] run scoreboard players remove @s scan_time 1

execute if score $scan_readers scan_result matches 2.. as @e[type=minecraft:marker,tag=scan.target,limit=1] run scoreboard players operation $scan_sec scan_result = @s scan_time
execute if score $scan_readers scan_result matches 2.. run scoreboard players operation $scan_sec scan_result /= $const_20 cd_mother_rotsense
execute if score $scan_readers scan_result matches 2.. run execute at @s run title @a[tag=team.human,tag=!state.dead,distance=..6] actionbar [{"text":"隔离扫描中 ","color":"aqua"},{"score":{"name":"$scan_sec","objective":"scan_result"}},{"text":"秒","color":"aqua"}]

execute as @e[type=minecraft:marker,tag=scan.target,scores={scan_time=..0},limit=1] run function escape_island:scan/resolve

tag @e[type=minecraft:marker,tag=scan.target] remove scan.target
