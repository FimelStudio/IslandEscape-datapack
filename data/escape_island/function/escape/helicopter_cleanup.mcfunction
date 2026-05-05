kill @e[type=minecraft:interaction,tag=entity.helicopter_door]
kill @e[tag=entity.helicopter_door_hint]
kill @e[type=minecraft:interaction,tag=entity.helicopter_boarding]
kill @e[tag=entity.helicopter_boarding_hint]
execute as @e[tag=aj.helicopter.root,tag=entity.helicopter] run function animated_java:helicopter/remove/this
kill @e[tag=entity.helicopter]
