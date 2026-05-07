execute if entity @s[tag=state.escaped] run return 0
tag @s add state.escaped
tag @s remove state.boarding
tag @s remove state.infected_period
scoreboard players set @s infect_time 0
function escape_island:ui/spore_bar/clear
scoreboard players add $game escaped_count 1
gamemode spectator @s
title @s title {"text":"§a撤离成功","bold":true}
