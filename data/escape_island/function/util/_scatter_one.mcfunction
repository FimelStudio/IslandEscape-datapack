# Teleport current player to a random available spawn marker, then mark it used.
tag @s add scatter_target
tag @e[type=minecraft:marker,tag=spawn_chosen] remove spawn_chosen

execute as @e[type=minecraft:marker,tag=spawn_available,sort=random,limit=1] run tag @s add spawn_chosen
execute at @e[type=minecraft:marker,tag=spawn_chosen,limit=1] run tp @a[tag=scatter_target,limit=1] ~ ~ ~
execute unless entity @e[type=minecraft:marker,tag=spawn_chosen,limit=1] at @e[type=minecraft:marker,tag=marker.spawn_beach,limit=1] run tp @a[tag=scatter_target,limit=1] ~ ~ ~

tag @e[type=minecraft:marker,tag=spawn_chosen] remove spawn_available
tag @e[type=minecraft:marker,tag=spawn_chosen] remove spawn_chosen
tag @s remove scatter_target
