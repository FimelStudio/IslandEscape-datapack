execute if score $game in_game matches 1 run function escape_island:game/_make_mother
execute unless score $game in_game matches 1 run tellraw @s {"text":"§c[DEBUG] 游戏未开始。","color":"red"}
