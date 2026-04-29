scoreboard players operation @s skill.detector_sec = @s skill.detector_cd
scoreboard players operation @s skill.detector_sec /= #twenty skill.detector_cfg
execute unless score @s skill.detector_sec = @s skill.detector_last_sec run function skill:virologist/detector/update_item
scoreboard players operation @s skill.detector_last_sec = @s skill.detector_sec
