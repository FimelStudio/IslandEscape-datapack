tag @s remove state.sporifying

effect clear @s minecraft:slowness
effect clear @s minecraft:darkness
effect clear @s minecraft:resistance
attribute @s minecraft:movement_speed base set 0.1
execute at @s run kill @e[type=minecraft:marker,tag=entity.downed_anchor,distance=..3,sort=nearest,limit=1]

function escape_island:infection/turn

gamemode survival @s

effect give @s minecraft:resistance 100 255 true
execute at @s run particle minecraft:dust{color:[0.0,0.9,0.25],scale:1.4} ~ ~1 ~ 1 0.8 1 0.02 30 force @a
playsound minecraft:entity.warden.emerge master @s ~ ~ ~ 0.8 0.8
