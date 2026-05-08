advancement revoke @s only skill:weapon/shotgun/use
clear @s minecraft:sugar[minecraft:custom_data~{weapon:"shotgun_used"}]
function skill:weapon/shotgun/restore

execute if entity @s[tag=team.infected] run title @s actionbar {"text":"感染者无法使用枪械","color":"red"}
execute if entity @s[tag=team.infected] run return 0

execute if entity @s[tag=skill.shotgun.reloading] run title @s actionbar {"text":"装填中...","color":"gold"}
execute if entity @s[tag=skill.shotgun.reloading] run return 0

execute if score @s skill.shotgun_cd matches 1.. run return 0
execute if predicate skill:is_sneak run function skill:weapon/shotgun/reload_start
execute unless predicate skill:is_sneak run function skill:weapon/shotgun/fire
