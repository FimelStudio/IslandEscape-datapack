execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.25 ~ as @e[tag=range.target,tag=!range.reaction.hidden,distance=..1.05,sort=nearest,limit=1] at @s run function escape_island:range/target_hit
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.95 ~ as @e[tag=range.target,tag=!range.reaction.hidden,distance=..1.05,sort=nearest,limit=1] at @s run function escape_island:range/target_hit
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-1.55 ~ as @e[tag=range.target,tag=!range.reaction.hidden,distance=..1.05,sort=nearest,limit=1] at @s run function escape_island:range/target_hit
execute if score #hit skill.pistol_tmp matches 0 as @a[tag=gs.player,tag=!gs.dead,tag=!skill.pistol.shooter,scores={gs_invuln=0},distance=..1.05,sort=nearest,limit=1] at @s run function escape_island:gunfight/on_death
execute if score #hit skill.pistol_tmp matches 0 if entity @a[tag=gs.player,distance=..1.05,limit=1] run scoreboard players set #hit skill.pistol_tmp 1
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
