scoreboard players set $game player_count 4
scoreboard players set $game dev_mode 1
function escape_island:dev/setup_markers
function escape_island:game/start_test
scoreboard players set $game dev_mode 0

scoreboard players set $ship_slots test_count 0
execute as @e[type=minecraft:marker,tag=marker.ship_part_slot] run scoreboard players add $ship_slots test_count 1

scoreboard players set $loot_basic test_count 0
execute as @e[type=minecraft:marker,tag=marker.loot_basic] run scoreboard players add $loot_basic test_count 1
scoreboard players set $ship_slot_1 test_count 0
execute as @e[type=minecraft:marker,tag=marker.ship_slot_1] run scoreboard players add $ship_slot_1 test_count 1
scoreboard players set $ship_slot_2 test_count 0
execute as @e[type=minecraft:marker,tag=marker.ship_slot_2] run scoreboard players add $ship_slot_2 test_count 1
scoreboard players set $ship_slot_3 test_count 0
execute as @e[type=minecraft:marker,tag=marker.ship_slot_3] run scoreboard players add $ship_slot_3 test_count 1
scoreboard players set $ship_slot_4 test_count 0
execute as @e[type=minecraft:marker,tag=marker.ship_slot_4] run scoreboard players add $ship_slot_4 test_count 1
scoreboard players set $ship_slot_5 test_count 0
execute as @e[type=minecraft:marker,tag=marker.ship_slot_5] run scoreboard players add $ship_slot_5 test_count 1

tellraw @s [{"text":"[TEST] 4人局船舶部件需求：","color":"aqua"},{"score":{"name":"Tunable","objective":"tunable.ship_parts_required"}},{"text":"（预期 3）","color":"gray"}]
tellraw @s [{"text":"[TEST] 全部基础物资点：","color":"aqua"},{"score":{"name":"$loot_basic","objective":"test_count"}},{"text":"（建议 >= 20）","color":"gray"}]
tellraw @s [{"text":"[TEST] 已分散部件点（总）：","color":"aqua"},{"score":{"name":"$ship_slots","objective":"test_count"}},{"text":"（预期 >= 3）","color":"gray"}]
tellraw @s [{"text":"[TEST] 分散槽统计： slot1=","color":"aqua"},{"score":{"name":"$ship_slot_1","objective":"test_count"}},{"text":" slot2=","color":"aqua"},{"score":{"name":"$ship_slot_2","objective":"test_count"}},{"text":" slot3=","color":"aqua"},{"score":{"name":"$ship_slot_3","objective":"test_count"}},{"text":" slot4=","color":"aqua"},{"score":{"name":"$ship_slot_4","objective":"test_count"}},{"text":" slot5=","color":"aqua"},{"score":{"name":"$ship_slot_5","objective":"test_count"}}]
tellraw @s {"text":"[TEST] 现在可分兵开箱搜部件并走轮船线，完成后用 [查看状态] 检查 ship_parts / ship_progress。","color":"yellow"}
tellraw @s [{"text":"[查看状态]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:debug/show_state"}},{"text":" "},{"text":"[返回自测菜单]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
