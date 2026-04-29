scoreboard players operation @s skill.suppress_sec = @s skill.suppress_cd
scoreboard players operation @s skill.suppress_sec /= #twenty skill.suppress_cfg
execute unless score @s skill.suppress_sec = @s skill.suppress_last_sec run function skill:marine/suppress/update_item
scoreboard players operation @s skill.suppress_last_sec = @s skill.suppress_sec
