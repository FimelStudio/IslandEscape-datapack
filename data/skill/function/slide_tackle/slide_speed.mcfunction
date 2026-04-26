execute if score @s skill.slide_time matches 0..4 run function skill:slide_tackle/move_checked {speed:"0.55"}
execute if score @s skill.slide_time matches 5..11 run function skill:slide_tackle/move_checked {speed:"0.38"}
execute if score @s skill.slide_time matches 12..17 run function skill:slide_tackle/move_checked {speed:"0.22"}

execute if score @s skill.slide_time matches 0..4 run particle minecraft:cloud ~ ~0.1 ~ 0.18 0.02 0.18 0.01 2 force @a[distance=..16]
execute if score @s skill.slide_time matches 5..11 run particle minecraft:cloud ~ ~0.1 ~ 0.14 0.02 0.14 0.01 1 force @a[distance=..16]
