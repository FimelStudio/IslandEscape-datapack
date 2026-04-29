scoreboard players operation @s skill.soup_sec = @s skill.soup_cd
scoreboard players operation @s skill.soup_sec /= #twenty skill.soup_cfg
execute unless score @s skill.soup_sec = @s skill.soup_last_sec run function skill:chef/hot_soup/update_item
scoreboard players operation @s skill.soup_last_sec = @s skill.soup_sec
