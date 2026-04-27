clear @s minecraft:sugar[custom_data={skill:"athlete_adrenaline"}]
execute store result score @s skill.adren_item run clear @s minecraft:gray_dye[custom_data={skill:"athlete_adrenaline"}] 0
execute if score @s skill.adren_item matches 0 run function skill:athlete/adrenaline/update_cooldown_item
