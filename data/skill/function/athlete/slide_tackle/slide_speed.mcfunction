execute if entity @s[tag=!adren_active] if score @s skill.slide_time matches 0..4 run function skill:athlete/slide_tackle/move_checked {speed:"0.605"}
execute if entity @s[tag=!adren_active] if score @s skill.slide_time matches 5..11 run function skill:athlete/slide_tackle/move_checked {speed:"0.418"}
execute if entity @s[tag=!adren_active] if score @s skill.slide_time matches 12..16 run function skill:athlete/slide_tackle/move_checked {speed:"0.242"}
execute if entity @s[tag=adren_active] if score @s skill.slide_time matches 0..4 run function skill:athlete/slide_tackle/move_checked with storage skill:athlete.adrenaline slide_speed.fast
execute if entity @s[tag=adren_active] if score @s skill.slide_time matches 5..11 run function skill:athlete/slide_tackle/move_checked with storage skill:athlete.adrenaline slide_speed.mid
execute if entity @s[tag=adren_active] if score @s skill.slide_time matches 12..16 run function skill:athlete/slide_tackle/move_checked with storage skill:athlete.adrenaline slide_speed.slow

execute if score @s skill.slide_time matches 0..4 run particle minecraft:cloud ~ ~0.1 ~ 0.18 0.02 0.18 0.01 2 force @a[distance=..16]
execute if score @s skill.slide_time matches 5..11 run particle minecraft:cloud ~ ~0.1 ~ 0.14 0.02 0.14 0.01 1 force @a[distance=..16]
