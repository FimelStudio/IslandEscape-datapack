scoreboard players add @a[tag=range.active,distance=..64,limit=1] range_score 20
scoreboard players add @a[tag=range.active,distance=..64,limit=1] range_hits 1
scoreboard players add @a[tag=range.active,distance=..64,limit=1] range_combo 1
particle minecraft:dust{color:[1.0,0.2,0.1],scale:1.2} ~ ~1 ~ 0.3 0.5 0.3 0.03 22 force @a[distance=..32]
playsound minecraft:block.note_block.pling player @a[tag=range.active,distance=..64] ~ ~ ~ 0.9 2.0
kill @s
