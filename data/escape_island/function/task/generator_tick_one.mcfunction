execute if score @s gen_state matches 0 run return 0
execute if score @s gen_state matches 4 run return 0

bossbar set escape_island:gen visible true
bossbar set escape_island:gen players @a

execute if score @s gen_state matches 1 run function escape_island:task/generator_tick_preheat
execute if score @s gen_state matches 2 run function escape_island:task/generator_tick_running
execute if score @s gen_state matches 3 run function escape_island:task/generator_tick_stalled
