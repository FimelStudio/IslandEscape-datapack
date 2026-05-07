schedule clear escape_island:game/end_mutate
schedule clear escape_island:game/end_all_infected_finish
scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 3
scoreboard players set $game phase_timer 0
scoreboard players set $game final_pressure 0
scoreboard players set $game escape_route 0
scoreboard players set $game escape_result 0
scoreboard players set $game signal_done 0
scoreboard players set $game gen_done 0
scoreboard players set $game bomb_armed 0
scoreboard players set $game bomb_countdown 0
scoreboard players set $game mother_dead 0
scoreboard players set $game escaped_count 0
kill @e[type=minecraft:marker,tag=test.boarding_kick_marker]
