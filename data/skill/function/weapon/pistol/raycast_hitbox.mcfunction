execute if score #hit skill.pistol_tmp matches 0 as @e[type=minecraft:marker,tag=entity.clicker_spore,distance=..0.85,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_clicker_spore

execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.25 ~ as @e[tag=infected.mother,tag=!state.dead,distance=..1.05,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.25 ~ as @e[tag=infected.secondary_mother,tag=!state.dead,distance=..1.05,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.25 ~ as @e[tag=infected.common,tag=!state.dead,distance=..1.05,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_infected
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.25 ~ as @e[tag=team.infected,tag=!infected.mother,tag=!infected.secondary_mother,tag=!state.dead,distance=..1.05,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_infected

execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.95 ~ as @e[tag=infected.mother,tag=!state.dead,distance=..1.05,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.95 ~ as @e[tag=infected.secondary_mother,tag=!state.dead,distance=..1.05,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.95 ~ as @e[tag=infected.common,tag=!state.dead,distance=..1.05,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_infected
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.95 ~ as @e[tag=team.infected,tag=!infected.mother,tag=!infected.secondary_mother,tag=!state.dead,distance=..1.05,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_infected

execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-1.55 ~ as @e[tag=infected.mother,tag=!state.dead,distance=..1.05,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-1.55 ~ as @e[tag=infected.secondary_mother,tag=!state.dead,distance=..1.05,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-1.55 ~ as @e[tag=infected.common,tag=!state.dead,distance=..1.05,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_infected
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-1.55 ~ as @e[tag=team.infected,tag=!infected.mother,tag=!infected.secondary_mother,tag=!state.dead,distance=..1.05,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_infected
