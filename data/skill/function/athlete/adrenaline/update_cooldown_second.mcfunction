scoreboard players operation @s skill.adren_sec = @s skill.adren_cd
scoreboard players operation @s skill.adren_sec += #nineteen skill.adren_cfg
scoreboard players operation @s skill.adren_sec /= #twenty skill.adren_cfg
execute unless score @s skill.adren_sec = @s skill.adren_last_sec run function skill:athlete/adrenaline/update_cooldown_item
