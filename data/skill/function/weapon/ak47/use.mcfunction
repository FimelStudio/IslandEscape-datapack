advancement revoke @s only skill:weapon/ak47/use
function skill:weapon/ak47/sync_used

execute if entity @s[tag=team.infected] run title @s actionbar {"text":"感染者无法使用枪械","color":"red"}
execute if entity @s[tag=team.infected] run function skill:weapon/ak47/update_item
execute if entity @s[tag=team.infected] run return 0

execute if entity @s[tag=skill.ak47.reloading] run function skill:weapon/ak47/update_item
execute if entity @s[tag=skill.ak47.reloading] run return 0

clear @s minecraft:paper[minecraft:custom_data~{weapon:"ak47_used"}]

execute if predicate skill:is_sneak run function skill:weapon/ak47/reload_start
execute if predicate skill:is_sneak run return 0

execute if score @s skill.ak47_mag matches ..0 run function skill:weapon/ak47/reload_start
execute if score @s skill.ak47_mag matches ..0 run return 0

execute if score @s skill.ak47_fire_cd matches 1.. run function skill:weapon/ak47/update_item
execute if score @s skill.ak47_fire_cd matches 1.. run return 0

execute at @s anchored eyes run function skill:weapon/ak47/fire
