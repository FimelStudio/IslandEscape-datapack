advancement revoke @s only skill:athlete/adrenaline/use
clear @s minecraft:sugar[custom_data={skill:"athlete_adrenaline_used"}]
execute unless entity @s[tag=role.athlete] run function skill:athlete/adrenaline/cleanup_non_athlete
execute if entity @s[tag=role.athlete,tag=skill.adrenaline.active] run function skill:athlete/adrenaline/update_cooldown_item
execute if entity @s[tag=role.athlete,tag=skill.adrenaline.active] run title @s actionbar {"text":"肾上腺素已激活","color":"gold"}
execute if entity @s[tag=role.athlete,tag=!skill.adrenaline.active] if score @s skill.adren_cd matches 1.. run title @s actionbar {"text":"肾上腺素冷却中","color":"yellow"}
execute if entity @s[tag=role.athlete,tag=!skill.adrenaline.active] if score @s skill.adren_cd matches 1.. run function skill:athlete/adrenaline/update_cooldown_item
execute if entity @s[tag=role.athlete,tag=!skill.adrenaline.active] unless score @s skill.adren_cd matches 1.. run function skill:athlete/adrenaline/start
