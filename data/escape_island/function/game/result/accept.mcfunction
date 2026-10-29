# 唯一结果接受点；调用方已设置 pending_kind / escape_result / finish_left。
execute unless score $game in_game matches 1 run return 0
execute if score $game ending_triggered matches 1.. run return 0
scoreboard players set $game ending_triggered 1
scoreboard players set $game in_game 0
scoreboard players set $game ie.mode 4
scoreboard players operation $game ie.pending_id = $game ie.match_id
function escape_island:game/cancel_schedules
execute if score $game ie.finish_left matches 0 run function escape_island:game/result/finish
