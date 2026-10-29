# 兼容旧结局入口；不自行清理或重开结果锁。
execute unless score $game in_game matches 1 run return 0
execute if score $game ending_triggered matches 1.. run return 0
scoreboard players set $game ie.pending_kind 2
scoreboard players set $game ie.finish_left 0
function escape_island:game/result/accept
