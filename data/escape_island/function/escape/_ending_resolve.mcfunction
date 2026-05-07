execute if score $game ending_triggered matches 1.. run return 0
function escape_island:util/recount_escaped

scoreboard players set $game escape_result 0
execute if score $game escaped_count matches 0 run return 0
scoreboard players set $game escape_result 1
execute if score $game escaped_count >= Tunable tunable.escape_full_win_count run scoreboard players set $game escape_result 2

execute if score $game escape_route matches 1 run function escape_island:game/end_helicopter
execute if score $game escape_route matches 2 run function escape_island:game/end_ship
execute if score $game escape_route matches 3 run function escape_island:game/end_lab
