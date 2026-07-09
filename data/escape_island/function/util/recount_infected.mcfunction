scoreboard players set $tmp infected_count 0
execute as @a[tag=infected.common,tag=!state.dead,tag=!state.spectator] run scoreboard players add $tmp infected_count 1
