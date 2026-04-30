execute if score $game heli_countdown matches 1.. run function escape_island:escape/helicopter_approach_tick
execute if score $game heli_countdown matches ..-1 run function escape_island:escape/helicopter_boarding_tick
