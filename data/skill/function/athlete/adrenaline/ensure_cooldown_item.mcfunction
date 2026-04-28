execute if items entity @s hotbar.5 minecraft:gray_dye[minecraft:custom_data~{skill:"athlete_adrenaline"}] run return 0
clear @s minecraft:sugar[custom_data={skill:"athlete_adrenaline"}]
clear @s minecraft:gray_dye[custom_data={skill:"athlete_adrenaline"}]
function skill:athlete/adrenaline/update_cooldown_item
