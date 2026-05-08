tag @s add range.active
scoreboard players set @s range_mode 1
scoreboard players set @s range_score 0
scoreboard players set @s range_timer 10
function escape_island:range/reset
tellraw @s {"text":"[精准挑战] 10 发内尽量得分。","color":"green"}
