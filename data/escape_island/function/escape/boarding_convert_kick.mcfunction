execute unless entity @s[tag=state.boarding,tag=infected.common] run return 0

execute if entity @s[tag=state.boarding.heli] at @e[type=minecraft:marker,tag=heli.selected_pad,limit=1] run tp @s ~4 ~1 ~
execute if entity @s[tag=state.boarding.heli] unless entity @e[type=minecraft:marker,tag=heli.selected_pad,limit=1] at @e[tag=entity.helicopter,limit=1] run tp @s ~4 ~1 ~
execute if entity @s[tag=state.boarding.ship] at @e[type=minecraft:marker,tag=marker.ship_dock,sort=nearest,limit=1] run tp @s ~4 ~1 ~
execute if entity @s[tag=state.boarding.sub] at @e[type=minecraft:marker,tag=marker.lab_sub,sort=nearest,limit=1] run tp @s ~4 ~1 ~

tag @s remove state.boarding
tag @s remove state.boarding.heli
tag @s remove state.boarding.ship
tag @s remove state.boarding.sub
tag @s remove state.escaped
tag @s remove state.spectator
tag @s remove team.human
tag @s add team.infected
team join infected @s
function escape_island:visual/infected_common
gamemode adventure @s
effect clear @s
effect give @s minecraft:resistance 3 1 true
title @s title {"text":"感染爆发","color":"dark_red","bold":true}
title @s subtitle {"text":"你被驱离撤离载具","color":"red"}
title @s actionbar {"text":"感染爆发——你被驱离","color":"red"}
playsound minecraft:entity.player.hurt player @s ~ ~ ~ 1 0.6
particle minecraft:dust{color:[0.8,0.0,0.0],scale:1.2} ~ ~1 ~ 0.35 0.45 0.35 0.02 18 force @s
