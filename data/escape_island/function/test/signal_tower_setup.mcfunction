execute unless entity @e[type=minecraft:marker,tag=marker.signal_tower,limit=1] run function escape_island:dev/start

scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 3
scoreboard players set $game signal_progress 0
scoreboard players set $game signal_done 0
scoreboard players set $game gen_done 0
scoreboard players set Tunable tunable.signal_stages 5
scoreboard players set @s signal_repair_time 0
scoreboard players set @s signal_repair_seen 0
tag @s remove engineer
tag @s remove role.engineer
tag @s remove state.infected_period
kill @e[type=minecraft:marker,tag=entity.engineer_battery,distance=..8]

bossbar set escape_island:signal visible false
execute store result bossbar escape_island:signal max run scoreboard players get Tunable tunable.signal_stages
bossbar set escape_island:signal value 0

clear @s minecraft:string[minecraft:custom_data~{item:"cable"}]
function escape_island:task/give_cable
function escape_island:task/give_cable
function escape_island:task/give_cable
function escape_island:task/give_cable
function escape_island:task/give_cable

execute at @e[type=minecraft:marker,tag=marker.signal_tower,sort=nearest,limit=1] run tp @s ~ ~ ~
execute at @e[type=minecraft:marker,tag=dev.marker,tag=marker.signal_tower,sort=nearest,limit=1] run setblock ~ ~1 ~ minecraft:air

tellraw @s {"text":"[Batch 7A] 信号塔测试已准备：手持线缆，在当前位置长按右键，看 actionbar 接线进度；重复 5 次应完成信号塔。","color":"green"}
tellraw @s [{"text":"[普通]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/signal_tower_setup"}},{"text":" "},{"text":"[工程师]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/signal_tower_setup_engineer"}},{"text":" "},{"text":"[电池范围]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/signal_tower_setup_battery"}},{"text":" "},{"text":"[感染期]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/signal_tower_setup_infected"}}]
