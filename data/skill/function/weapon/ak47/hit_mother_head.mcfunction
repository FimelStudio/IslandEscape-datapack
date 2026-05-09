scoreboard players set #hit skill.ak47_tmp 1
damage @s 9 minecraft:generic
particle minecraft:damage_indicator ~ ~1.5 ~ 0.2 0.25 0.2 0 4 force @a[distance=..16]
playsound minecraft:entity.experience_orb.pickup master @a[distance=..16] ~ ~ ~ 0.7 0.8
playsound minecraft:entity.arrow.hit_player master @a[distance=..16] ~ ~ ~ 1.0 1.5 0
execute as @a[tag=skill.ak47.shooter,limit=1] run title @s times 0 5 5
execute as @a[tag=skill.ak47.shooter,limit=1] run title @s title {"text":"\uE001","font":"ie:hud","color":"red","shadow_color":0}