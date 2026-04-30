advancement revoke @s only skill:chef/hot_soup/use
clear @s minecraft:mushroom_stew[minecraft:custom_data~{skill:"cook_soup"}]
clear @s minecraft:sugar[minecraft:custom_data~{skill:"cook_soup"}]
clear @s minecraft:sugar[custom_data={skill:"cook_soup_used"}]
scoreboard players set @s skill.soup_cd 0
scoreboard players set @s skill.soup_item 0
scoreboard players set @s skill.soup_state 0
scoreboard players set @s skill.soup_sec 0
scoreboard players set @s skill.soup_last_sec 0
