advancement revoke @s only skill:athlete/adrenaline/use
scoreboard players set @s skill.adren_item 0
execute unless entity @s[tag=adren_active] unless score @s skill.adren_cd matches 1.. run clear @s minecraft:gray_dye[custom_data={skill:"athlete_adrenaline"}]
execute unless entity @s[tag=adren_active] unless score @s skill.adren_cd matches 1.. store result score @s skill.adren_item run clear @s minecraft:sugar[custom_data={skill:"athlete_adrenaline"}] 0
execute unless entity @s[tag=adren_active] unless score @s skill.adren_cd matches 1.. if score @s skill.adren_item matches 0 run function skill:athlete/adrenaline/item_ready
execute if entity @s[tag=adren_active] run function skill:athlete/adrenaline/ensure_cooldown_item
execute unless entity @s[tag=adren_active] if score @s skill.adren_cd matches 1.. run function skill:athlete/adrenaline/ensure_cooldown_item
