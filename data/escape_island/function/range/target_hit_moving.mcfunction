scoreboard players add @a[tag=range.active,distance=..64,limit=1] range_score 20
scoreboard players add @a[tag=range.active,distance=..64,limit=1] range_hits 1
scoreboard players add @a[tag=range.active,distance=..64,limit=1] range_combo 1
particle minecraft:dust{color:[1.0,0.85,0.1],scale:1.0} ~ ~1 ~ 0.25 0.45 0.25 0.02 18 force @a[distance=..32]
playsound minecraft:block.note_block.pling player @a[tag=range.active,distance=..64] ~ ~ ~ 0.9 1.7
kill @s
