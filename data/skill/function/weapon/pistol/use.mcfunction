advancement revoke @s only skill:weapon/pistol/use

execute if entity @s[tag=infected.common] run title @s actionbar {"text":"感染者无法使用枪械","color":"red"}
execute if entity @s[tag=infected.common] run function skill:weapon/pistol/update_item
execute if entity @s[tag=infected.common] run return 0
execute if entity @s[tag=infected.mother] run title @s actionbar {"text":"母体无法使用枪械","color":"red"}
execute if entity @s[tag=infected.mother] run function skill:weapon/pistol/update_item
execute if entity @s[tag=infected.mother] run return 0

execute if entity @s[tag=skill.pistol.reloading] run function skill:weapon/pistol/update_item
execute if entity @s[tag=skill.pistol.reloading] run return 0

execute if entity @s[tag=role.marine] if predicate skill:is_sneak run function skill:marine/gun_mastery/use
execute if entity @s[tag=role.marine] if predicate skill:is_sneak run function skill:weapon/pistol/update_item
execute if entity @s[tag=role.marine] if predicate skill:is_sneak run return 0

execute if score @s skill.pistol_mag matches ..0 run function skill:weapon/pistol/reload_start
execute if score @s skill.pistol_mag matches ..0 run return 0

execute if score @s skill.pistol_fire_cd matches 1.. run function skill:weapon/pistol/update_item
execute if score @s skill.pistol_fire_cd matches 1.. run return 0

execute at @s anchored eyes run function skill:weapon/pistol/fire
