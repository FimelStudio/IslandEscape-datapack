advancement revoke @s only skill:athlete/adrenaline/use
execute unless entity @s[tag=adren_active] unless score @s skill.adren_cd matches 1.. run clear @s minecraft:gray_dye[custom_data={skill:"athlete_adrenaline"}]
execute unless entity @s[tag=adren_active] unless score @s skill.adren_cd matches 1.. unless items entity @s hotbar.5 minecraft:sugar[minecraft:custom_data~{skill:"athlete_adrenaline"}] run function skill:athlete/adrenaline/refresh_ready
execute if entity @s[tag=adren_active] run function skill:athlete/adrenaline/ensure_cooldown_item
execute unless entity @s[tag=adren_active] if score @s skill.adren_cd matches 1.. run function skill:athlete/adrenaline/ensure_cooldown_item
