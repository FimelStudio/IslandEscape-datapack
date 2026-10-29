
tag @s remove state.dead
gamemode adventure @s
attribute @s minecraft:movement_speed base set 0.1
execute if entity @s[tag=infected.clicker] run attribute @s minecraft:movement_speed base set 0.26
effect clear @s
effect give @s minecraft:saturation 1 20 true
function escape_island:infection/anchor/remove {kind:"dead"}

clear @s
function escape_island:visual/infected_common

execute at @a[tag=infected.mother,tag=!state.dead,tag=!state.spectator,sort=nearest,limit=1] run spreadplayers ~ ~ 8 16 false @s
execute unless entity @a[tag=infected.mother,tag=!state.dead,tag=!state.spectator,limit=1] at @e[type=minecraft:marker,tag=marker.spore_spot,sort=random,limit=1] run tp @s ~ ~ ~

effect give @s minecraft:resistance 100 255 true
execute at @s run particle minecraft:dust{color:[0.0,0.9,0.25],scale:1.4} ~ ~1 ~ 1 0.8 1 0.02 30 force @a
playsound minecraft:entity.warden.emerge master @s ~ ~ ~ 0.8 0.8

execute if entity @s[tag=retained.mechanic] run function skill:mechanic/trap/update_item

execute if entity @s[tag=retained.priest] run effect give @s minecraft:resistance 200 1 true
execute if entity @s[tag=retained.priest] run effect give @s minecraft:speed 200 0 true

tellraw @s {"text":"§c复活。继续感染！","color":"red"}
