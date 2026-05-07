scoreboard players set $game player_count 4
function escape_island:util/apply_scaling
tellraw @s [{"text":"[TEST] 4人局轮船登船窗口=","color":"gold"},{"score":{"name":"Tunable","objective":"tunable.ship_boarding_seconds"}},{"text":" 秒，预期 45。","color":"green"}]

scoreboard players set $game player_count 8
function escape_island:util/apply_scaling
tellraw @s [{"text":"[TEST] 8人局轮船登船窗口=","color":"gold"},{"score":{"name":"Tunable","objective":"tunable.ship_boarding_seconds"}},{"text":" 秒，预期 50。","color":"green"}]

scoreboard players set $game player_count 13
function escape_island:util/apply_scaling
tellraw @s [{"text":"[TEST] 13人局轮船登船窗口=","color":"gold"},{"score":{"name":"Tunable","objective":"tunable.ship_boarding_seconds"}},{"text":" 秒，预期 60。","color":"green"}]
tellraw @s [{"text":"[返回自测菜单]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
