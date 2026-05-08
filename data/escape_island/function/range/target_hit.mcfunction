scoreboard players add @p[tag=range.active,distance=..64,limit=1] range_score 10
scoreboard players set #hit skill.pistol_tmp 1
scoreboard players add @p[tag=range.active,distance=..64,limit=1] range_combo 1
particle minecraft:crit ~ ~1 ~ 0.2 0.4 0.2 0.05 20 force @a[distance=..32]
playsound minecraft:block.note_block.pling player @p[tag=range.active,distance=..64,limit=1] ~ ~ ~ 0.8 1.6
tp @s ~ ~-64 ~
kill @s
