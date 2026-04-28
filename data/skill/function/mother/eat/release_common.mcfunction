gamemode survival @a[tag=eaten_zombie,limit=1]
tag @a[tag=eaten_zombie,limit=1] remove mother_eat_absorbing
scoreboard players reset @a[tag=eaten_zombie,limit=1] skill.mother_eat_anim
tag @a[tag=eaten_zombie,limit=1] remove eaten_zombie

execute as @a[tag=mother_eating,limit=1] run clear @s minecraft:structure_void[minecraft:custom_data={skill:"mother/zombie_editor"}] 1
execute as @a[tag=mother_eating,limit=1] run function skill:mother/eat/item_ready
tag @a[tag=mother_eating,limit=1] remove mother_eat_fired
tag @a[tag=mother_eating,limit=1] remove mother_eating
function skill:mother/eat/clear_storage

particle minecraft:dust{color:[0.0,0.9,0.25],scale:1.2} ~ ~0.8 ~ 0.4 0.25 0.4 0.02 18 force @a[distance=..16]
playsound minecraft:entity.zombie_villager.converted player @a[distance=..16] ~ ~ ~ 0.8 0.8
