scoreboard players set #hit skill.pistol_tmp 1
scoreboard players set #hit skill.ak47_tmp 1
scoreboard players set @a[tag=range.active,distance=..64,limit=1] range_combo 0
title @a[tag=range.active,distance=..64,limit=1] actionbar {"text":"顺序错误！请先打蓝色序列靶。","color":"red"}
playsound minecraft:block.note_block.bass player @a[tag=range.active,distance=..64] ~ ~ ~ 0.8 0.6
