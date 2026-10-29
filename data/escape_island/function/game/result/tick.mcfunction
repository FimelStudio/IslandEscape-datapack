execute unless score $game ie.mode matches 4 run return 0
execute unless score $game ie.pending_id = $game ie.match_id run return 0
execute if score $game ie.finish_left matches 1.. run scoreboard players remove $game ie.finish_left 1
execute if score $game ie.finish_left matches 0 run function escape_island:game/result/finish
