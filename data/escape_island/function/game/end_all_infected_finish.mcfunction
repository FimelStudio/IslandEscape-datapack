# 旧预约兼容入口：只能结束当前已接受的演出，不解除锁。
execute unless score $game ie.mode matches 4 run return 0
execute unless score $game ie.pending_id = $game ie.match_id run return 0
execute unless score $game ie.finish_left matches 0 run return 0
function escape_island:game/result/finish
