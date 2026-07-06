scoreboard players set $game in_game 1
scoreboard players set $game player_count 8
function escape_island:util/apply_scaling
scoreboard players set $game ending_triggered 0
scoreboard players set $game escape_route 2
scoreboard players set $game escaped_count 0
tag @s add state.escaped
function escape_island:escape/_ending_resolve
tellraw @s [{"text":"[TEST] 8人局1人撤离结果=","color":"gold"},{"score":{"name":"$game","objective":"escape_result"}},{"text":"，预期 1（部分撤离）。","color":"green"}]

scoreboard players set $game in_game 1
scoreboard players set $game ending_triggered 0
scoreboard players set $game escape_route 2
scoreboard players set $game escaped_count 2
scoreboard players set $game escape_result 1
execute if score $game escaped_count >= Tunable tunable.escape_full_win_count run scoreboard players set $game escape_result 2
tellraw @s [{"text":"[TEST] 8人局2人撤离结果=","color":"gold"},{"score":{"name":"$game","objective":"escape_result"}},{"text":"，预期 2（完整撤离）。","color":"green"}]

scoreboard players set $game player_count 4
function escape_island:util/apply_scaling
scoreboard players set $game escaped_count 1
scoreboard players set $game escape_result 1
execute if score $game escaped_count >= Tunable tunable.escape_full_win_count run scoreboard players set $game escape_result 2
tellraw @s [{"text":"[TEST] 4人局1人撤离结果=","color":"gold"},{"score":{"name":"$game","objective":"escape_result"}},{"text":"，预期 2（完整撤离）。","color":"green"}]

scoreboard players set $game in_game 0
scoreboard players set $game ending_triggered 0
scoreboard players set $game escape_route 0
scoreboard players set $game escape_result 0
scoreboard players set $game escaped_count 0
tag @s remove state.escaped
tellraw @s [{"text":"[返回自测菜单]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
