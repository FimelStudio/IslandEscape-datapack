execute if entity @e[tag=entity.helicopter,limit=1] run return 0
execute unless entity @e[type=minecraft:marker,tag=heli.selected_pad,limit=1] run return 0

execute at @e[type=minecraft:marker,tag=heli.selected_pad,limit=1] positioned ~ ~18 ~-80 run function escape_island:escape/_spawn_helicopter
scoreboard players set $game heli_motion 1
playsound minecraft:entity.ender_dragon.flap master @a ~ ~ ~ 1 0.6
