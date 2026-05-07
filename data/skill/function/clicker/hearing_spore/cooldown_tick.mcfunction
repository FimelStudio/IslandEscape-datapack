scoreboard players operation @s skill.clicker_sec = @s skill.clicker_cd
scoreboard players operation @s skill.clicker_sec /= #twenty skill.clicker_cfg
execute unless score @s skill.clicker_sec = @s skill.clicker_last_sec run function skill:clicker/hearing_spore/update_item
scoreboard players operation @s skill.clicker_last_sec = @s skill.clicker_sec
