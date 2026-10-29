execute unless score $game in_game matches 1 run return 0
function escape_island:player/tick_second
effect give @a[tag=ie.active,tag=!state.dead,tag=!state.spectator] minecraft:regeneration 3 0 true
effect give @a[tag=ie.active,tag=!state.dead,tag=!state.spectator,tag=!state.escaped] minecraft:saturation 3 0 true
function escape_island:talent/tick
function escape_island:task/signal_tower_tick
function escape_island:task/generator_tick
function escape_island:task/scan_station_tick
function escape_island:task/ship_dock_tick
execute if score $game bomb_armed matches 1 run function escape_island:task/bomb_tick
execute if score $game sub_countdown matches 1.. run function escape_island:escape/sub_tick


execute if score $game cur_phase matches 4 run function escape_island:escape/helicopter_tick
execute if score $game cur_phase matches 4 if score $game ship_countdown matches 1.. run function escape_island:escape/ship_boarding_tick

execute if score $game p2_ambient_cd matches 1 run function escape_island:game/p2_ambient_event
execute if score $game p2_ambient_cd matches 1.. run scoreboard players remove $game p2_ambient_cd 1

execute if score $game phase_timer matches 1.. run function escape_island:event/pick_event
execute if score $blackout ie.event matches 1 run effect give @a[tag=ie.active] minecraft:darkness 2 0 true
execute if score $storm ie.event matches 1 as @a[tag=ie.active] at @s run function escape_island:event/storm_tick
function escape_island:game/result/check
