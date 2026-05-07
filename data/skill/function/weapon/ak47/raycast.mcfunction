scoreboard players add #raycast_len skill.ak47_tmp 1
execute positioned ^ ^ ^0.5 run particle minecraft:crit ~ ~ ~ 0.05 0.05 0.05 0 1 force @a[distance=..24]
execute positioned ^ ^ ^0.5 if score #hit skill.ak47_tmp matches 0 run function skill:weapon/ak47/raycast_hitbox
execute positioned ^ ^ ^0.5 if score #hit skill.ak47_tmp matches 0 if score #raycast_len skill.ak47_tmp matches ..40 if block ~ ~ ~ #skill:bullet_passable run function skill:weapon/ak47/raycast
