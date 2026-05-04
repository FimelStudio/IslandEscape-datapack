
advancement revoke @s only escape_island:interaction/hit_by_mother
advancement revoke @s only escape_island:interaction/hit_by_secondary_mother

execute if entity @s[tag=team.human] at @s as @e[tag=infected.mother,tag=!flag.first_attack,distance=..8,sort=nearest,limit=1] run function escape_island:interaction/_mother_first_attack

execute if entity @s[tag=team.human,tag=!state.infected_period] at @s if entity @e[tag=infected.mother,tag=!state.dead,distance=..8,sort=nearest,limit=1,scores={mother_hit_cd=..0}] run function escape_island:infection/add_spore_load {amount:40}
execute if entity @s[tag=team.human,tag=!state.infected_period] at @s as @e[tag=infected.mother,tag=!state.dead,distance=..8,sort=nearest,limit=1,scores={mother_hit_cd=..0}] run scoreboard players set @s mother_hit_cd 50
execute if entity @s[tag=team.human,tag=!state.infected_period] at @s as @e[tag=infected.mother,tag=!state.dead,distance=..8,sort=nearest,limit=1,scores={mother_hit_cd=..0}] run attribute @s minecraft:attack_speed base set 0.4
execute if entity @s[tag=team.human,tag=!state.infected_period] at @s as @e[tag=infected.mother,tag=!state.dead,distance=..8,sort=nearest,limit=1,scores={mother_hit_cd=..0}] run tag @s add state.attack_slowed

execute if entity @s[tag=team.human] at @s if entity @e[tag=infected.mother,tag=!state.dead,distance=..8,sort=nearest,limit=1,scores={mother_hit_cd=1..}] run playsound minecraft:entity.player.attack.weak master @a[distance=..16] ~ ~ ~ 1 1.3
execute if entity @s[tag=team.human] at @s as @e[tag=infected.mother,tag=!state.dead,distance=..8,sort=nearest,limit=1,scores={mother_hit_cd=1..}] run attribute @s minecraft:attack_speed base set 0.1
execute if entity @s[tag=team.human] at @s as @e[tag=infected.mother,tag=!state.dead,distance=..8,sort=nearest,limit=1,scores={mother_hit_cd=1..}] run effect give @s minecraft:slowness 2 2 true
