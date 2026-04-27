execute as @a[tag=role.survivor,tag=!role.mother] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players add $game ship_progress 1
execute if entity @a[tag=role.sailor] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players add $game ship_progress 0
execute as @a[tag=role.infected] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players remove $game ship_progress 2

execute if score $game ship_progress matches ..-1 run scoreboard players set $game ship_progress 0

execute if score $game ship_progress matches 1.. run bossbar set escape_island:ship visible true
execute if score $game ship_progress matches 1.. run bossbar set escape_island:ship players @a
execute store result bossbar escape_island:ship value run scoreboard players get $game ship_progress

execute if score $game ship_progress matches 100.. run function escape_island:escape/ship_depart
