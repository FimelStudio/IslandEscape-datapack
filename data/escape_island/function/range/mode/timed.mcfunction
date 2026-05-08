tag @s add range.active
scoreboard players set @s range_mode 2
scoreboard players set @s range_score 0
scoreboard players set @s range_timer 30
function escape_island:range/reset
tellraw @s {"text":"[限时挑战] 30 秒内尽量得分。","color":"yellow"}
