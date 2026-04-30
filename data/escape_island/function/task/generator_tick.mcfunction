execute if score $game cur_phase matches 4.. run bossbar set escape_island:gen visible false
execute if score $game cur_phase matches 4.. run return 0

execute as @e[type=minecraft:marker,tag=marker.generator] at @s run function escape_island:task/generator_tick_one
