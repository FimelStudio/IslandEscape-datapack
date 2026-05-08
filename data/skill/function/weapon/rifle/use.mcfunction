advancement revoke @s only skill:weapon/rifle/use
clear @s minecraft:paper[minecraft:custom_data~{weapon:"rifle_used"}]
function skill:weapon/rifle/restore

execute if entity @s[tag=team.infected] run title @s actionbar {"text":"感染者无法使用枪械","color":"red"}
execute if entity @s[tag=team.infected] run return 0

execute if entity @s[tag=skill.rifle.reloading] run title @s actionbar {"text":"换弹中...","color":"yellow"}
execute if entity @s[tag=skill.rifle.reloading] run return 0

execute if predicate skill:is_sneak run function skill:weapon/rifle/reload_start
execute if predicate skill:is_sneak run return 0

execute if score @s skill.rifle_mag matches ..0 run function skill:weapon/rifle/reload_start
execute if score @s skill.rifle_mag matches ..0 run return 0

execute if score @s skill.rifle_fire_cd matches 1.. run return 0

execute at @s anchored eyes run function skill:weapon/rifle/fire
