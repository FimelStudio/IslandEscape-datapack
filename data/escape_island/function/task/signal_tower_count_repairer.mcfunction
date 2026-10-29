# Both counts use the same nearest tower, even when repair radii overlap.
scoreboard players add @e[type=minecraft:marker,tag=marker.signal_tower,tag=!marker.signal_done,distance=..2.5,sort=nearest,limit=1] signal_players 1
execute if entity @s[tag=role.engineer] run scoreboard players add @e[type=minecraft:marker,tag=marker.signal_tower,tag=!marker.signal_done,distance=..2.5,sort=nearest,limit=1] signal_engineers 1
