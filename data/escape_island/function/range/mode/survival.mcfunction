execute unless entity @s[tag=range.active] run function escape_island:range/enter
scoreboard players set @s range_mode 3
scoreboard players set @s range_score 0
scoreboard players set @s range_combo 0
scoreboard players set @s range_shots 0
scoreboard players set @s range_hits 0
scoreboard players set @s range_lives 3
scoreboard players set @s range_timer 600
scoreboard players set @s range_seq 1
scoreboard players set @s range_wave 1
kill @e[tag=range.target]
function escape_island:range/spawn_targets
bossbar set escape_island:range_timer visible false
tellraw @s {"text":"[生存挑战] 3 次未命中前尽量得分；每 30 秒提高移动靶速度。","color":"red"}
