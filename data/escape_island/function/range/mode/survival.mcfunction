tag @s add range.active
scoreboard players set @s range_mode 3
scoreboard players set @s range_score 0
scoreboard players set @s range_lives 3
function escape_island:range/reset
tellraw @s {"text":"[生存挑战] 3 次失误前尽量得分。","color":"red"}
