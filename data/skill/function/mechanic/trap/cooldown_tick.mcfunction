scoreboard players operation @s skill.trap_sec = @s skill.trap_cd
scoreboard players operation @s skill.trap_sec /= #twenty skill.trap_cfg
execute if score @s skill.trap_charges matches ..0 unless score @s skill.trap_sec = @s skill.trap_item run function skill:mechanic/trap/update_item
scoreboard players operation @s skill.trap_item = @s skill.trap_sec
