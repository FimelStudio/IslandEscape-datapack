scoreboard players set #hit skill.pistol_tmp 1
damage @s 6 minecraft:generic
particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.25 0.2 0 4 force @a[distance=..16]
playsound minecraft:entity.player.attack.crit master @a[distance=..12] ~ ~ ~ 0.7 1.35
playsound minecraft:entity.arrow.hit_player master @a[distance=..16] ~ ~ ~ 0.8 1 0
title @p[distance=..16] times 0 5 5
title @p[distance=..16] title {"text":"\uE001","font":"ie:hud"}
