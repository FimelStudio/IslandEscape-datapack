# 兼容旧调试入口；世界与玩家状态一并安全退出。
function escape_island:game/cleanup
scoreboard players set $game ending_triggered 0
