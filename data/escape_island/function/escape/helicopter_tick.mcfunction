scoreboard players remove $game heli_countdown 1
execute store result bossbar escape_island:heli value run scoreboard players get $game heli_countdown

execute if score $game heli_countdown matches ..0 run function escape_island:escape/helicopter_arrive
