advancement revoke @s only skill:weapon/pistol/use
function skill:weapon/pistol/sync_used

execute if entity @s[tag=team.infected] run title @s actionbar {"text":"感染者无法使用枪械","color":"red"}
execute if entity @s[tag=team.infected] run function skill:weapon/pistol/update_item
execute if entity @s[tag=team.infected] run return 0

execute if entity @s[tag=skill.pistol.reloading] run function skill:weapon/pistol/update_item
execute if entity @s[tag=skill.pistol.reloading] run return 0

execute if entity @s[tag=role.marine] if predicate skill:is_sneak run function skill:marine/gun_mastery/use
execute if entity @s[tag=role.marine] if predicate skill:is_sneak run clear @s minecraft:paper[minecraft:custom_data~{weapon:"pistol_used"}]
execute if entity @s[tag=role.marine] if predicate skill:is_sneak run function skill:weapon/pistol/update_item
execute if entity @s[tag=role.marine] if predicate skill:is_sneak run return 0

clear @s minecraft:paper[minecraft:custom_data~{weapon:"pistol_used"}]

execute unless entity @s[tag=role.marine] if predicate skill:is_sneak run function skill:weapon/pistol/reload_start
execute unless entity @s[tag=role.marine] if predicate skill:is_sneak run return 0

execute if score @s skill.pistol_mag matches ..0 run function skill:weapon/pistol/reload_start
execute if score @s skill.pistol_mag matches ..0 run return 0

execute if score @s skill.pistol_fire_cd matches 1.. run function skill:weapon/pistol/update_item
execute if score @s skill.pistol_fire_cd matches 1.. run return 0

execute at @s anchored eyes run function skill:weapon/pistol/fire
