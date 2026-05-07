scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 3

kill @e[type=minecraft:marker,tag=test.scan]
execute at @s run summon minecraft:marker ~2 ~ ~ {Tags:["test.scan","marker.scan_station"]}

scoreboard players set @e[type=minecraft:marker,tag=test.scan,limit=1,sort=nearest] scan_station_cd 0
scoreboard players set @e[type=minecraft:marker,tag=test.scan,limit=1,sort=nearest] scan_active 0
scoreboard players set @e[type=minecraft:marker,tag=test.scan,limit=1,sort=nearest] scan_time 0
scoreboard players set @e[type=minecraft:marker,tag=test.scan,limit=1,sort=nearest] scan_result 0

function escape_island:task/scan_station_tick
function escape_island:task/give_scan_action

tellraw @s {"text":"[TEST] 隔离扫描-正常：扫描站已生成，需两名幸存者在3格内按住右键。","color":"aqua"}
tellraw @s {"text":"[TEST] 预期结果：正常。","color":"green"}
tellraw @s [{"text":"[返回自测菜单]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
