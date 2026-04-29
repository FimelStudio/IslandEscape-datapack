scoreboard players add #raycast_len skill.pistol_tmp 1
execute positioned ^ ^ ^0.5 run particle minecraft:crit ~ ~ ~ 0.05 0.05 0.05 0 1 force @a[distance=..24]
execute positioned ^ ^ ^0.5 if score #hit skill.pistol_tmp matches 0 as @e[tag=role.mother,tag=!state.dead,distance=..0.85,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother
execute positioned ^ ^ ^0.5 if score #hit skill.pistol_tmp matches 0 as @e[tag=role.secondary_mother,tag=!state.dead,distance=..0.85,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother
execute positioned ^ ^ ^0.5 if score #hit skill.pistol_tmp matches 0 as @e[tag=role.infected,tag=!state.dead,distance=..0.85,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_infected
execute positioned ^ ^ ^0.5 if score #hit skill.pistol_tmp matches 0 if score #raycast_len skill.pistol_tmp matches ..40 unless block ~ ~ ~ #minecraft:impermeable run function skill:weapon/pistol/raycast
