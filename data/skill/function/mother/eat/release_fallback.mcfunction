execute if entity @a[tag=eaten_zombie,limit=1] run tp @a[tag=eaten_zombie,limit=1] ~ ~ ~
execute if entity @a[tag=eaten_zombie,limit=1] at @a[tag=eaten_zombie,limit=1] run function skill:mother/eat/release_common
