scoreboard players remove @s skill.ak47_mag 1
scoreboard players set @s skill.ak47_fire_cd 2
scoreboard players set #hit skill.ak47_tmp 0
scoreboard players set #raycast_len skill.ak47_tmp 0

function skill:weapon/ak47/update_item

playsound ie:ak47.shot master @a[distance=..28] ~ ~ ~ 1 1
execute anchored eyes positioned ^ ^-0.06 ^0.65 run particle minecraft:smoke ~ ~ ~ 0.03 0.03 0.03 0 5 force @a[distance=..24]

tag @s add skill.ak47.shooter
execute anchored eyes run function skill:weapon/ak47/raycast
tag @s remove skill.ak47.shooter
