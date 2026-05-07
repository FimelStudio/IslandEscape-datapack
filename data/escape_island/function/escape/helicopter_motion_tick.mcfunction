execute unless entity @e[tag=entity.helicopter,limit=1] run scoreboard players set $game heli_motion 0
execute unless entity @e[tag=entity.helicopter,limit=1] run return 0

execute if score $game heli_motion matches 1..50 as @e[tag=entity.helicopter] at @s run tp @s ~ ~ ~1.6 180 0
execute if score $game heli_motion matches 51..90 as @e[tag=entity.helicopter] at @s run tp @s ~ ~-0.45 ~ 180 0
execute if score $game heli_motion matches 1..90 run scoreboard players add $game heli_motion 1
execute if score $game heli_motion matches 91 at @e[type=minecraft:marker,tag=heli.selected_pad,limit=1] as @e[tag=entity.helicopter] run tp @s ~ ~4.0 ~ 180 0
execute if score $game heli_motion matches 91 run scoreboard players set $game heli_motion 0

execute if score $game heli_motion matches 201..240 as @e[tag=entity.helicopter] at @s run tp @s ~ ~0.35 ~ 180 0
execute if score $game heli_motion matches 241..300 as @e[tag=entity.helicopter] at @s run tp @s ~ ~ ~1.6 180 0
execute if score $game heli_motion matches 201..300 run scoreboard players add $game heli_motion 1
execute if score $game heli_motion matches 301 run function escape_island:escape/helicopter_cleanup
execute if score $game heli_motion matches 301 unless score $game ending_triggered matches 1.. run scoreboard players set $game escape_route 1
execute if score $game heli_motion matches 301 run function escape_island:escape/_ending_resolve
execute if score $game heli_motion matches 301 run scoreboard players set $game heli_motion 0
