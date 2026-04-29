effect give @s minecraft:instant_health 1 3 true
effect give @s minecraft:saturation 2 1 true
playsound minecraft:entity.generic.drink player @s ~ ~ ~ 0.9 1.2 1
particle minecraft:heart ~ ~1.2 ~ 0.35 0.35 0.35 0.02 8 force @s
particle minecraft:happy_villager ~ ~1 ~ 0.45 0.35 0.45 0.04 18 force @s
tellraw @s {"text":"§a热汤下肚，回复4心。","color":"green"}

scoreboard players operation @s skill.soup_cd = #cooldown skill.soup_cfg
function skill:chef/hot_soup/update_item
