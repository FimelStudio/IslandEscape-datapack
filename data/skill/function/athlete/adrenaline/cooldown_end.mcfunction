scoreboard players set @s skill.adren_cd 0
scoreboard players set @s skill.adren_sec 0
scoreboard players set @s skill.adren_last_sec 0
clear @s minecraft:sugar[custom_data={skill:"athlete_adrenaline"}]
clear @s minecraft:gray_dye[custom_data={skill:"athlete_adrenaline"}]
function skill:athlete/adrenaline/item_ready
