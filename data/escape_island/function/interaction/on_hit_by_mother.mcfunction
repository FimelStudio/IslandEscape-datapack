
advancement revoke @s only escape_island:interaction/hit_by_mother
advancement revoke @s only escape_island:interaction/hit_by_secondary_mother

execute if entity @s[tag=team.human] at @s as @e[tag=infected.mother,tag=state.hunting,tag=!flag.first_attack,distance=..8,sort=nearest,limit=1] run function escape_island:interaction/_mother_first_attack

execute store result storage escape_island:tmp amount int 1 run scoreboard players get Tunable tunable.mother_spore_hit
execute if entity @s[tag=team.human,tag=!state.infected_period] at @s if entity @e[tag=infected.mother,tag=!state.dead,tag=state.hunting,distance=..8,sort=nearest,limit=1,scores={mother_hit_cd=..0}] run function escape_island:infection/add_spore_load with storage escape_island:tmp
execute if entity @s[tag=team.human,tag=!state.infected_period] at @s as @e[tag=infected.mother,tag=!state.dead,tag=state.hunting,distance=..8,sort=nearest,limit=1,scores={mother_hit_cd=..0}] run scoreboard players set @s mother_hit_cd 50
execute if entity @s[tag=team.human,tag=!state.infected_period] at @s as @e[tag=infected.mother,tag=!state.dead,tag=state.hunting,distance=..8,sort=nearest,limit=1,scores={mother_hit_cd=..0}] run attribute @s minecraft:attack_speed base set 1.6
execute if entity @s[tag=team.human,tag=!state.infected_period] at @s as @e[tag=infected.mother,tag=!state.dead,tag=state.hunting,distance=..8,sort=nearest,limit=1,scores={mother_hit_cd=..0}] run tag @s add state.attack_slowed

execute if entity @s[tag=team.human] at @s if entity @e[tag=infected.mother,tag=!state.dead,tag=state.hunting,distance=..8,sort=nearest,limit=1,scores={mother_hit_cd=1..}] run playsound minecraft:entity.player.attack.weak master @a[distance=..16] ~ ~ ~ 1 1.3
