# 结果锁保持关闭，防止旧回调再次提交。
execute unless score $game ie.mode matches 4 run return 0
execute unless score $game ie.pending_id = $game ie.match_id run return 0
scoreboard players set $game ie.mode 0
scoreboard players add $game ie.settle_count 1
execute if score $game ie.pending_kind matches 1 run function escape_island:game/result/present/end_helicopter
execute if score $game ie.pending_kind matches 2 run function escape_island:game/result/present/end_ship
execute if score $game ie.pending_kind matches 3 run function escape_island:game/result/present/end_lab
execute if score $game ie.pending_kind matches 4 run function escape_island:game/result/present/end_mutate
execute if score $game ie.pending_kind matches 5 run function escape_island:game/result/present/end_purge
execute if score $game ie.pending_kind matches 6 run function escape_island:game/result/present/end_destroy
execute if score $game ie.pending_kind matches 7 run function escape_island:game/result/present/end_disguise
function escape_island:game/settle
