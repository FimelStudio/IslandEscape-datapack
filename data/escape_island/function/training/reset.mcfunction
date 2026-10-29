execute if score $game ie.mode matches 4 run return 0
execute if score $game gs_active matches 1 run return 0
execute if score $game in_game matches 1 run return 0
function escape_island:player/reset
function escape_island:training/restore_rules_if_idle
tellraw @s {"text":"[训练模式] 已退出并清理临时状态。","color":"gray"}
