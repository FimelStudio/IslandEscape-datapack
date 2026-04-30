tag @e[type=minecraft:marker,tag=marker.heli_pad] remove heli.selected_pad
execute as @e[type=minecraft:marker,tag=marker.heli_pad,sort=random,limit=1] at @s run function escape_island:escape/_select_helicopter_landing
