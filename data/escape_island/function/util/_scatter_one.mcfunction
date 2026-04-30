tag @s add state.scatter.target
tag @e[type=minecraft:marker,tag=state.spawn.chosen] remove state.spawn.chosen

execute as @e[type=minecraft:marker,tag=state.spawn.available,sort=random,limit=1] run tag @s add state.spawn.chosen
execute at @e[type=minecraft:marker,tag=state.spawn.chosen,limit=1] run tp @a[tag=state.scatter.target,limit=1] ~ ~ ~
execute unless entity @e[type=minecraft:marker,tag=state.spawn.chosen,limit=1] at @e[type=minecraft:marker,tag=marker.spawn_beach,limit=1] run tp @a[tag=state.scatter.target,limit=1] ~ ~ ~

tag @e[type=minecraft:marker,tag=state.spawn.chosen] remove state.spawn.available
tag @e[type=minecraft:marker,tag=state.spawn.chosen] remove state.spawn.chosen
tag @s remove state.scatter.target
