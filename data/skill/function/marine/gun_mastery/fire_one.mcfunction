scoreboard players remove @s skill.gm_burst 1
scoreboard players set @s skill.gm_delay 2
scoreboard players set #hit skill.pistol_tmp 0
scoreboard players set #raycast_len skill.pistol_tmp 0

playsound ie:glock_gun.shot master @a[distance=..28] ~ ~ ~ 1 1
execute anchored eyes positioned ^ ^-0.06 ^0.65 run particle minecraft:smoke ~ ~ ~ 0.03 0.03 0.03 0 5 force @a[distance=..24]

tag @s add skill.pistol.shooter
execute anchored eyes run function skill:weapon/pistol/raycast
tag @s remove skill.pistol.shooter
