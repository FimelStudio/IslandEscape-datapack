# --- Headshot Hitboxes (Strict small radius near top) ---
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-1.55 ~ as @a[tag=gs.player,tag=!gs.dead,tag=!skill.pistol.shooter,scores={gs_invuln=0},distance=..0.55,sort=nearest,limit=1] at @s run function escape_island:gunfight/on_death_head

execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-1.55 ~ as @e[tag=infected.mother,tag=!state.dead,distance=..0.55,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother_head
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-1.55 ~ as @e[tag=infected.secondary_mother,tag=!state.dead,distance=..0.55,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother_head
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-1.55 ~ as @e[tag=infected.common,tag=!state.dead,distance=..0.55,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_infected_head
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-1.55 ~ as @e[tag=team.infected,tag=!infected.mother,tag=!infected.secondary_mother,tag=!state.dead,distance=..0.55,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_infected_head

execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-1.55 ~ as @e[tag=range.target,tag=!range.reaction.hidden,distance=..0.55,sort=nearest,limit=1] at @s run function escape_island:range/target_hit_head

# --- Normal Body Hitboxes ---
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.25 ~ as @e[tag=range.target,tag=!range.reaction.hidden,distance=..0.7,sort=nearest,limit=1] at @s run function escape_island:range/target_hit
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.9 ~ as @e[tag=range.target,tag=!range.reaction.hidden,distance=..0.7,sort=nearest,limit=1] at @s run function escape_island:range/target_hit
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.25 ~ as @a[tag=gs.player,tag=!gs.dead,tag=!skill.pistol.shooter,scores={gs_invuln=0},distance=..0.7,sort=nearest,limit=1] at @s run function escape_island:gunfight/on_death
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.9 ~ as @a[tag=gs.player,tag=!gs.dead,tag=!skill.pistol.shooter,scores={gs_invuln=0},distance=..0.7,sort=nearest,limit=1] at @s run function escape_island:gunfight/on_death
execute if score #hit skill.pistol_tmp matches 0 as @e[type=minecraft:marker,tag=entity.clicker_spore,distance=..0.85,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_clicker_spore

execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.25 ~ as @e[tag=infected.mother,tag=!state.dead,distance=..0.7,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.25 ~ as @e[tag=infected.secondary_mother,tag=!state.dead,distance=..0.7,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.25 ~ as @e[tag=infected.common,tag=!state.dead,distance=..0.7,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_infected
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.25 ~ as @e[tag=team.infected,tag=!infected.mother,tag=!infected.secondary_mother,tag=!state.dead,distance=..0.7,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_infected

execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.9 ~ as @e[tag=infected.mother,tag=!state.dead,distance=..0.7,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.9 ~ as @e[tag=infected.secondary_mother,tag=!state.dead,distance=..0.7,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_mother
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.9 ~ as @e[tag=infected.common,tag=!state.dead,distance=..0.7,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_infected
execute if score #hit skill.pistol_tmp matches 0 positioned ~ ~-0.9 ~ as @e[tag=team.infected,tag=!infected.mother,tag=!infected.secondary_mother,tag=!state.dead,distance=..0.7,sort=nearest,limit=1] at @s run function skill:weapon/pistol/hit_infected
