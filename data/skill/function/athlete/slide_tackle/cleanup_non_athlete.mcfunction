execute if entity @s[tag=skill.slide.stamina.showing] run title @s actionbar {"text":""}
tag @s remove skill.slide.cleanup_rider
execute on vehicle if entity @s[type=minecraft:silverfish,tag=skill.slide.vehicle] run tag @s add skill.slide.cleanup
execute on vehicle if entity @s[type=minecraft:silverfish,tag=skill.slide.cleanup] on passengers if entity @s[type=minecraft:player] run tag @s add skill.slide.cleanup_rider
execute if entity @s[tag=skill.slide.cleanup_rider] run ride @s dismount
execute as @e[type=minecraft:silverfish,tag=skill.slide.cleanup] at @s run tp @s ~ -512 ~
kill @e[type=minecraft:silverfish,tag=skill.slide.cleanup]

tag @s remove skill.slide.active
tag @s remove skill.slide.locked
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
tag @s remove skill.slide.stamina.init
tag @s remove skill.slide.stamina.showing
tag @s remove skill.slide.cleanup_rider

scoreboard players set @s skill.slide_time 0
scoreboard players set @s skill.slide_fall 0
scoreboard players set @s skill.slide_cd 0
scoreboard players set @s skill.slide_cost 0
scoreboard players set @s skill.slide_sprint 0
scoreboard players set @s skill.stamina_warn 0
