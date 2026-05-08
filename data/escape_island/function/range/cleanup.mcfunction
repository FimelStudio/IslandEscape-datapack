kill @e[tag=range.target]
kill @e[tag=range.target.dead]
tag @a remove range.active
scoreboard players set @a range_mode 0
scoreboard players set @a range_timer 0
scoreboard players set @a range_lives 0
scoreboard players set @a range_combo 0
scoreboard players set @a range_shots 0
scoreboard players set @a range_hits 0
scoreboard players set @a range_seq 0
scoreboard players set @a range_wave 0
bossbar set escape_island:range_timer visible false
bossbar set escape_island:range_timer players
