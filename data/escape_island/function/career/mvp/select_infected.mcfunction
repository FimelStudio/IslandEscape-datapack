tag @a remove mvp.infected
scoreboard players set $mvp_infected mvp_score 0
execute as @a[tag=team.infected,tag=!state.dead,tag=!state.spectator] if score @s mvp_score > $mvp_infected mvp_score run scoreboard players operation $mvp_infected mvp_score = @s mvp_score
execute as @a[tag=team.infected,tag=!state.dead,tag=!state.spectator] if score @s mvp_score = $mvp_infected mvp_score if score @s mvp_score matches 1.. run tag @s add mvp.infected
