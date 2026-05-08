kill @e[tag=range.target]
kill @e[tag=range.target.dead]
scoreboard players set @a[tag=range.active] range_score 0
scoreboard players set @a[tag=range.active] range_combo 0
scoreboard players set @a[tag=range.active] range_timer 0
scoreboard players set @a[tag=range.active] range_lives 3
scoreboard players set @a[tag=range.active] range_mode 0
scoreboard players set @a[tag=range.active] range_shots 0
scoreboard players set @a[tag=range.active] range_hits 0
scoreboard players set @a[tag=range.active] range_seq 1
scoreboard players set @a[tag=range.active] range_wave 1
bossbar set escape_island:range_timer visible false
bossbar set escape_island:range_timer players
function escape_island:range/spawn_targets
tellraw @a[tag=range.active] {"text":"[训练场] 靶标和挑战状态已重置。","color":"aqua"}
