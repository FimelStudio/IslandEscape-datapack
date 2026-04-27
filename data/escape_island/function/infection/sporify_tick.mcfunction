
gamemode adventure @s
attribute @s minecraft:movement_speed base set 0
scoreboard players remove @s sporify_timer 1
execute at @s run particle minecraft:dust{color:[0.0,0.8,0.25],scale:1.2} ~ ~0.8 ~ 0.8 0.3 0.8 0.01 16 force @a
playsound minecraft:block.sculk_sensor.clicking player @s ~ ~ ~ 0.35 0.7 1

execute if score @s sporify_timer matches ..0 run function escape_island:infection/_sporify_complete
