scoreboard players set #hit skill.pistol_tmp 1
damage @s 4 minecraft:generic
particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.25 0.2 0 3 force @a[distance=..16]
playsound minecraft:entity.player.attack.crit master @a[distance=..12] ~ ~ ~ 0.7 1.2
playsound minecraft:entity.arrow.hit_player player @a[distance=..16] ~ ~ ~ 0.8 1
title @p[distance=..16] times 0 5 5
title @p[distance=..16] title {"text":"\uE002","font":"ie:hud"}