execute on vehicle if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tag @s add slide_cleanup
execute unless data entity @s RootVehicle run tag @e[type=minecraft:silverfish,tag=slide_vehicle,distance=..2,limit=1,sort=nearest] add slide_cleanup
ride @s dismount
execute as @e[type=minecraft:silverfish,tag=slide_cleanup,distance=..4] at @s run tp @s ~ -512 ~
kill @e[type=minecraft:silverfish,tag=slide_cleanup]

tag @s remove sliding
tag @s remove slide_blocked
tag @s remove slide_falling
tag @s remove slide_falling_small
scoreboard players set @s skill.slide_time 0
scoreboard players set @s skill.slide_cd 8

particle minecraft:cloud ~ ~0.15 ~ 0.3 0.04 0.3 0.01 5 force @a[distance=..16]
