advancement revoke @s only skill:athlete/adrenaline/use
clear @s minecraft:sugar[custom_data={skill:"athlete_adrenaline"}]
clear @s minecraft:gray_dye[custom_data={skill:"athlete_adrenaline"}]
tag @s remove adren_active
scoreboard players set @s skill.adren_time 0
scoreboard players set @s skill.adren_cd 0
scoreboard players set @s skill.adren_item 0
scoreboard players set @s skill.adren_sec 0
scoreboard players set @s skill.adren_last_sec 0
