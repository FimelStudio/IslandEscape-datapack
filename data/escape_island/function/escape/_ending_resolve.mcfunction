execute if score $game ending_triggered matches 1.. run return 0
function escape_island:util/recount_escaped

scoreboard players set $game escape_result 0
execute if score $game escaped_count matches 0 run return 0
scoreboard players set $game escape_result 1
execute if score $game escaped_count >= Tunable tunable.escape_full_win_count run scoreboard players set $game escape_result 2

scoreboard players set $game ie.evac_ready 1
function escape_island:game/result/check
