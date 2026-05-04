scoreboard players set #hit skill.pistol_tmp 1
damage @s 4 minecraft:generic
particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.25 0.2 0 3 force @a[distance=..16]
playsound minecraft:entity.player.attack.crit master @a[distance=..12] ~ ~ ~ 0.7 1.2
playsound minecraft:entity.arrow.hit_player master @a[distance=..16] ~ ~ ~ 0.8 1 0
execute as @a[tag=skill.pistol.shooter,limit=1] run title @s times 0 5 5
execute as @a[tag=skill.pistol.shooter,limit=1] run title @s title {text:"\uE001",font:"ie:hud",shadow_color:0}
