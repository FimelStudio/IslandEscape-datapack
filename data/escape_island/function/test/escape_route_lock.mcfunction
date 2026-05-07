scoreboard players set $game in_game 1
scoreboard players set $game player_count 8
function escape_island:util/apply_scaling
scoreboard players set $game ending_triggered 0
scoreboard players set $game escape_route 2
scoreboard players set $game escape_result 0
scoreboard players set $game escaped_count 0
tag @s add state.escaped
function escape_island:escape/_ending_resolve
tellraw @s [{"text":"[TEST] 首个路线=轮船后，ending_triggered=","color":"gold"},{"score":{"name":"$game","objective":"ending_triggered"}},{"text":"，escape_route=","color":"gold"},{"score":{"name":"$game","objective":"escape_route"}},{"text":"。预期 1 / 2。","color":"green"}]

execute unless score $game ending_triggered matches 1.. run scoreboard players set $game escape_route 3
function escape_island:escape/_ending_resolve
tellraw @s [{"text":"[TEST] 模拟潜艇后到，escape_route=","color":"gold"},{"score":{"name":"$game","objective":"escape_route"}},{"text":"，ending_triggered=","color":"gold"},{"score":{"name":"$game","objective":"ending_triggered"}},{"text":"。预期仍为 2 / 1。","color":"green"}]

scoreboard players set $game in_game 0
scoreboard players set $game ending_triggered 0
scoreboard players set $game escape_route 0
scoreboard players set $game escape_result 0
scoreboard players set $game escaped_count 0
tag @s remove state.escaped
tellraw @s [{"text":"[返回自测菜单]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
