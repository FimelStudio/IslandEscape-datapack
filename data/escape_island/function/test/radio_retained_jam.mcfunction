scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 3

kill @e[type=minecraft:marker,tag=test.radio_jam]
execute at @s run summon minecraft:marker ~3 ~ ~ {Tags:["test.radio_jam","marker.scan_station"]}

tag @s add team.infected
tag @s add infected.common
tag @s add retained.radio
tag @s remove role.radio
tag @s remove state.dead

scoreboard players set @e[type=minecraft:marker,tag=test.radio_jam,limit=1,sort=nearest] scan_station_cd 0
scoreboard players set @e[type=minecraft:marker,tag=test.radio_jam,limit=1,sort=nearest] scan_active 0
scoreboard players set @e[type=minecraft:marker,tag=test.radio_jam,limit=1,sort=nearest] scan_time 0
scoreboard players set @e[type=minecraft:marker,tag=test.radio_jam,limit=1,sort=nearest] scan_result 0

scoreboard players set @s skill.radio_jam_cd 0
function skill:radio/jam/update_item

tellraw @s {"text":"[TEST] 通讯员转化保留：已授予污染干扰器。","color":"dark_purple"}
tellraw @s {"text":"[TEST] 右键后预期：附近幸存者收到公共噪声提示，扫描站冷却增加。","color":"yellow"}
tellraw @s [{"text":"[查看状态]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:debug/show_state"}},{"text":" 观察 scan_station_cd 与 skill.radio_jam_cd","color":"gray"}]
tellraw @s [{"text":"[返回自测菜单]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
