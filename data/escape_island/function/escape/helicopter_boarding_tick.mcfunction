scoreboard players add $game heli_countdown 1
scoreboard players operation $display heli_countdown = $game heli_countdown
scoreboard players operation $display heli_countdown *= $const_minus1 heli_countdown
execute store result bossbar escape_island:heli value run scoreboard players get $display heli_countdown

execute if score $game heli_countdown matches 0 run function escape_island:escape/_helicopter_depart
