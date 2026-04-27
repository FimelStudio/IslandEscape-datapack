# escape_island:util/recount_infected  —  count current infected players
scoreboard players set $tmp infected_count 0
execute as @a[tag=role.infected] run scoreboard players add $tmp infected_count 1
