scoreboard players operation @s skill.antidote_sec = @s skill.antidote_cd
scoreboard players operation @s skill.antidote_sec /= #twenty skill.antidote_cfg
execute unless score @s skill.antidote_sec = @s skill.antidote_last_sec run function skill:doctor/antidote/update_item
scoreboard players operation @s skill.antidote_last_sec = @s skill.antidote_sec
