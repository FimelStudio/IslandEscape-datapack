# escape_island:skill/virologist_reagent  —  detect infected/mother in 6 blocks
advancement revoke @s only escape_island:skill/virologist_reagent
execute if score @s cd_virologist matches 1.. run return 0

scoreboard players set @s cd_virologist 45

# Check for any threat within 6 blocks
execute if entity @a[tag=role.mother,tag=!state.disguised,distance=..6] run function escape_island:skill/_reagent_hit
execute if entity @a[tag=role.infected,distance=..6] run function escape_island:skill/_reagent_hit
execute if entity @a[tag=state.infected_period,distance=..6] run function escape_island:skill/_reagent_hit
