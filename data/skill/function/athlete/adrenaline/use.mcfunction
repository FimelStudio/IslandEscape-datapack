advancement revoke @s only skill:athlete/adrenaline/use
execute unless entity @s[tag=role.athlete] run function skill:athlete/adrenaline/cleanup_non_athlete
execute if entity @s[tag=role.athlete,tag=adren_active] run function skill:athlete/adrenaline/update_cooldown_item
execute if entity @s[tag=role.athlete,tag=adren_active] run title @s actionbar {"text":"肾上腺素已激活","color":"gold"}
execute if entity @s[tag=role.athlete,tag=!adren_active] if score @s skill.adren_cd matches 1.. run title @s actionbar {"text":"肾上腺素冷却中","color":"yellow"}
execute if entity @s[tag=role.athlete,tag=!adren_active] if score @s skill.adren_cd matches 1.. run function skill:athlete/adrenaline/update_cooldown_item
execute if entity @s[tag=role.athlete,tag=!adren_active] unless score @s skill.adren_cd matches 1.. run function skill:athlete/adrenaline/start
