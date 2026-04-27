scoreboard players operation @s skill.adren_sec = @s skill.adren_cd
scoreboard players operation @s skill.adren_sec += #nineteen skill.adren_cfg
scoreboard players operation @s skill.adren_sec /= #twenty skill.adren_cfg
execute store result storage skill:athlete.adrenaline item.sec int 1 run scoreboard players get @s skill.adren_sec
function skill:athlete/adrenaline/item_cooldown with storage skill:athlete.adrenaline item
scoreboard players operation @s skill.adren_last_sec = @s skill.adren_sec
