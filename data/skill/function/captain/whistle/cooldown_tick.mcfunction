scoreboard players operation @s skill.whistle_sec = @s skill.whistle_cd
scoreboard players operation @s skill.whistle_sec /= #twenty skill.whistle_cfg
execute unless score @s skill.whistle_sec = @s skill.whistle_last_sec run function skill:captain/whistle/update_item
scoreboard players operation @s skill.whistle_last_sec = @s skill.whistle_sec
