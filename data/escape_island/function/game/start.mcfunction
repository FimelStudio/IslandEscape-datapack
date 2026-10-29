# 已运行时拒绝重复开局；结束演出期间允许安全重开。
execute if score $game in_game matches 1 run return 0
function escape_island:util/recount_players
execute if score $game player_count matches ..3 run tellraw @s {"text":"[海岛逃生] 至少需要 4 名玩家。","color":"red"}
execute if score $game player_count matches ..3 run return 0
function escape_island:game/validate_map
execute unless score $game ie.map_ready matches 1 run return 0
function escape_island:game/initialize
