execute if entity @s[tag=slide_stamina_showing] run title @s actionbar {"text":""}
tag @s remove athlete_cleanup_rider
execute on vehicle if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tag @s add slide_cleanup
execute on vehicle if entity @s[type=minecraft:silverfish,tag=slide_cleanup] on passengers if entity @s[type=minecraft:player] run tag @s add athlete_cleanup_rider
execute if entity @s[tag=athlete_cleanup_rider] run ride @s dismount
execute as @e[type=minecraft:silverfish,tag=slide_cleanup] at @s run tp @s ~ -512 ~
kill @e[type=minecraft:silverfish,tag=slide_cleanup]

tag @s remove sliding
tag @s remove slide_locked
tag @s remove slide_blocked
tag @s remove slide_falling
tag @s remove slide_falling_small
tag @s remove slide_moved
tag @s remove slide_drop_113
tag @s remove slide_drop_100
tag @s remove slide_drop_083
tag @s remove slide_drop_064
tag @s remove slide_drop_044
tag @s remove slide_drop_030
tag @s remove slide_drop_015
tag @s remove slide_drop_008
tag @s remove slide_stamina_init
tag @s remove slide_stamina_showing
tag @s remove athlete_cleanup_rider

scoreboard players set @s skill.slide_time 0
scoreboard players set @s skill.slide_fall 0
scoreboard players set @s skill.slide_cd 0
scoreboard players set @s skill.slide_cost 0
scoreboard players set @s skill.slide_sprint 0
scoreboard players set @s skill.stamina_warn 0
