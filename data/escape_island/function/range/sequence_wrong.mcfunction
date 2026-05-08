scoreboard players set #hit skill.pistol_tmp 1
scoreboard players set #hit skill.ak47_tmp 1
scoreboard players set @a[tag=skill.pistol.shooter,tag=range.active,limit=1] range_combo 0
scoreboard players set @a[tag=skill.ak47.shooter,tag=range.active,limit=1] range_combo 0
title @a[tag=skill.pistol.shooter,tag=range.active,limit=1] actionbar {"text":"顺序错误！请先打蓝色序列靶。","color":"red"}
title @a[tag=skill.ak47.shooter,tag=range.active,limit=1] actionbar {"text":"顺序错误！请先打蓝色序列靶。","color":"red"}
playsound minecraft:block.note_block.bass player @a[tag=range.active,distance=..64] ~ ~ ~ 0.8 0.6
