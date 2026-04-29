scoreboard players set #hit skill.gm_runtime 1
damage @s 4 minecraft:generic
particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.25 0.2 0 3 force @a[distance=..16]
playsound minecraft:entity.player.attack.crit player @a[distance=..12] ~ ~ ~ 0.7 1.2
