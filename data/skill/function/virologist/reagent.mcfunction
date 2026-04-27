advancement revoke @s only skill:virologist/reagent
execute if score @s cd_virologist matches 1.. run return 0

scoreboard players set @s cd_virologist 45

execute if entity @a[tag=role.mother,tag=!state.disguised,distance=..6] run function skill:virologist/_reagent_hit
execute if entity @a[tag=role.infected,distance=..6] run function skill:virologist/_reagent_hit
execute if entity @a[tag=state.infected_period,distance=..6] run function skill:virologist/_reagent_hit
