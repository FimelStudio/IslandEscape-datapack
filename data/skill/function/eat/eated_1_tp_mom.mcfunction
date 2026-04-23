
execute as @a[tag=eated_zombie,limit=1] at @s unless entity @a[tag=zombie_mom,distance=..1] facing entity @a[tag=zombie_mom] feet run tp @s ^ ^ ^0.75 ~ ~

execute as @a[tag=eated_zombie,limit=1] at @s unless entity @a[tag=zombie_mom,distance=..1] run schedule function skill:eat/eated_1_tp_mom 1t

execute as @a[tag=eated_zombie,limit=1] at @s if entity @a[tag=zombie_mom,distance=..1] run function skill:eat/eated_2