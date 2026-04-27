scoreboard players operation @s skill.battery_sec = @s skill.battery_cd
scoreboard players operation @s skill.battery_sec /= #twenty skill.battery_cfg
execute unless score @s skill.battery_sec = @s skill.battery_last_sec run function skill:engineer/battery/update_item
scoreboard players operation @s skill.battery_last_sec = @s skill.battery_sec
