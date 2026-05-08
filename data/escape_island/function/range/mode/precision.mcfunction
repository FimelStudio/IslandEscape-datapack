execute unless entity @s[tag=range.active] run function escape_island:range/enter
scoreboard players set @s range_mode 1
scoreboard players set @s range_score 0
scoreboard players set @s range_combo 0
scoreboard players set @s range_shots 0
scoreboard players set @s range_hits 0
scoreboard players set @s range_timer 10
scoreboard players set @s range_seq 1
scoreboard players set @s range_wave 1
kill @e[tag=range.target]
function escape_island:range/spawn_targets
bossbar set escape_island:range_timer visible false
tellraw @s {"text":"[精准挑战] 10 次开枪机会内尽量得分；未命中会断连击。","color":"green"}
