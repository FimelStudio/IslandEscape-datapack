scoreboard players add @a[tag=range.active,distance=..64,limit=1] range_score 10
scoreboard players add @a[tag=range.active,distance=..64,limit=1] range_hits 1
scoreboard players add @a[tag=range.active,distance=..64,limit=1] range_combo 1
particle minecraft:crit ~ ~1 ~ 0.25 0.45 0.25 0.05 20 force @a[distance=..32]
playsound minecraft:block.note_block.pling player @a[tag=range.active,distance=..64] ~ ~ ~ 0.8 1.4
kill @s
