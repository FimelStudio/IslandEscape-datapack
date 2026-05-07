execute unless entity @e[type=minecraft:marker,tag=marker.signal_tower,limit=1] run function escape_island:dev/start

scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 3
scoreboard players set $game phase_timer 0
scoreboard players set $tick cycle20 0
scoreboard players set $tick cycle5 0
scoreboard players set $game signal_progress 0
scoreboard players set $game signal_done 0
scoreboard players set $game signal_progress 0
scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower] signal_local 0
scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower] signal_repair_acc 0
tag @e[tag=marker.signal_done] remove marker.signal_done
gamemode adventure @s
tag @s remove role.engineer
tag @s remove state.infected_period
kill @e[type=minecraft:marker,tag=entity.engineer_battery,distance=..8]

bossbar set escape_island:signal visible false
bossbar set escape_island:signal max 100
bossbar set escape_island:signal value 0

clear @s minecraft:string[minecraft:custom_data~{item:"cable"}]
function escape_island:task/give_cable
function escape_island:task/give_cable
function escape_island:task/give_cable
function escape_island:task/give_cable
function escape_island:task/give_cable

execute at @e[type=minecraft:marker,tag=marker.signal_tower,sort=nearest,limit=1] run tp @s ~ ~ ~
execute at @e[type=minecraft:marker,tag=dev.marker,tag=marker.signal_tower,sort=nearest,limit=1] run setblock ~ ~1 ~ minecraft:air

tellraw @s {"text":"[Batch 17A] 信号塔测试：边塔单人约200秒，核心单人约150秒；完成均为+25全局进度","color":"green"}
tellraw @s [{"text":"[普通]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/signal_tower_setup"}},{"text":" "},{"text":"[工程师]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/signal_tower_setup_engineer"}},{"text":" "},{"text":"[电池范围]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/signal_tower_setup_battery"}},{"text":" "},{"text":"[感染期]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/signal_tower_setup_infected"}}]
