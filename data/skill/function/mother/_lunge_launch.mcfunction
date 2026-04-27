tp @s ^ ^ ^8

execute as @a[tag=role.survivor,distance=..2] run damage @s 4 minecraft:generic
execute as @a[tag=role.survivor,distance=..2] run effect give @s minecraft:slowness 10 0 true

execute as @a[tag=role.survivor,distance=..2] run function escape_island:infection/add_spore_load {amount:35}

playsound minecraft:entity.phantom.flap master @a ~ ~ ~ 1 0.5
