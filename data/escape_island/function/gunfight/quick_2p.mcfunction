execute if score $game in_game matches 1 run return 0
execute if score $game ie.mode matches 4 run return 0
tag @s add gs.ready
function escape_island:gunfight/start
tellraw @s {"text":"[TEST] 单人快速枪战已启动；多人时让另一名玩家先点枪战大厅。","color":"gold"}
