advancement revoke @s only skill:athlete/adrenaline/use
execute unless entity @s[tag=athlete] run function skill:athlete/adrenaline/cleanup_non_athlete
execute if entity @s[tag=athlete,tag=adren_active] run function skill:athlete/adrenaline/update_cooldown_item
execute if entity @s[tag=athlete,tag=!adren_active] if score @s skill.adren_cd matches 1.. run function skill:athlete/adrenaline/update_cooldown_item
execute if entity @s[tag=athlete,tag=!adren_active] unless score @s skill.adren_cd matches 1.. run function skill:athlete/adrenaline/start
