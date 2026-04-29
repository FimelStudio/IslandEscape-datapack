clear @s minecraft:mushroom_stew[minecraft:custom_data~{skill:"cook_soup"}]
clear @s minecraft:sugar[minecraft:custom_data~{skill:"cook_soup"}]
scoreboard players operation @s skill.soup_sec = @s skill.soup_cd
scoreboard players operation @s skill.soup_sec /= #twenty skill.soup_cfg
execute store result storage skill:chef.hot_soup item.sec int 1 run scoreboard players get @s skill.soup_sec

execute if score @s skill.soup_cd matches 1.. run scoreboard players set @s skill.soup_state 2
execute if score @s skill.soup_cd matches 1.. run function skill:chef/hot_soup/item_cooldown with storage skill:chef.hot_soup item
execute unless score @s skill.soup_cd matches 1.. run scoreboard players set @s skill.soup_state 1
execute unless score @s skill.soup_cd matches 1.. run function skill:chef/hot_soup/item_ready
