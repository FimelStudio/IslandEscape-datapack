# 三秒结局演出使用对局本地计时，不再预约一个无归属的全局函数。
execute unless score $game in_game matches 1 run return 0
execute if score $game ending_triggered matches 1.. run return 0
scoreboard players set $game ie.pending_kind 4
scoreboard players set $game escape_result 3
scoreboard players set $game ie.finish_left 60
title @a title {"text":"感染阵营胜利","color":"dark_red","bold":true}
title @a subtitle {"text":"所有幸存者已被转化。","color":"red"}
function escape_island:game/result/accept
