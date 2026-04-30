execute on vehicle if entity @s[type=minecraft:silverfish,tag=skill.slide.vehicle] run tag @s add skill.slide.cleanup
execute unless data entity @s RootVehicle run tag @e[type=minecraft:silverfish,tag=skill.slide.vehicle,distance=..8,limit=1,sort=nearest] add skill.slide.cleanup
ride @s dismount
execute as @e[type=minecraft:silverfish,tag=skill.slide.cleanup] at @s run tp @s ~ -512 ~
kill @e[type=minecraft:silverfish,tag=skill.slide.cleanup]

tag @s remove skill.slide.active
tag @s remove skill.slide.blocked
tag @s remove skill.slide.falling
tag @s remove skill.slide.falling_small
tag @s remove skill.slide.moved
tag @s remove skill.slide.drop_113
tag @s remove skill.slide.drop_100
tag @s remove skill.slide.drop_083
tag @s remove skill.slide.drop_064
tag @s remove skill.slide.drop_044
tag @s remove skill.slide.drop_030
tag @s remove skill.slide.drop_015
tag @s remove skill.slide.drop_008
scoreboard players set @s skill.slide_time 0
scoreboard players set @s skill.slide_fall 0
scoreboard players operation @s skill.slide_cost = #cost skill.stamina_cfg
scoreboard players set @s skill.slide_cd 8

particle minecraft:cloud ~ ~0.15 ~ 0.3 0.04 0.3 0.01 5 force @a[distance=..16]
