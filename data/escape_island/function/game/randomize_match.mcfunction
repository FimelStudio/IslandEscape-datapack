tag @e[type=minecraft:marker,tag=marker.loot_hot] remove marker.loot_rare
tag @e[type=minecraft:marker,tag=marker.loot_hot] remove marker.loot_hot
tag @e[type=minecraft:marker,tag=gen.hidden_overload] remove gen.hidden_overload
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_overload 0

execute as @e[type=minecraft:marker,tag=marker.generator,sort=random,limit=1] run scoreboard players set @s gen_overload 8
execute as @e[type=minecraft:marker,tag=marker.generator,scores={gen_overload=8},sort=random,limit=1] run tag @s add gen.hidden_overload

execute as @e[type=minecraft:marker,tag=marker.loot_basic,sort=random,limit=1] run tag @s add marker.loot_hot
execute as @e[type=minecraft:marker,tag=marker.loot_hot] run tag @s add marker.loot_rare
