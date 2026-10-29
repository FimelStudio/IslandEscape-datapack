# 每一发装填都对应消耗一颗 9mm 弹药。
execute unless score @s skill.shotgun_mag matches ..5 run return 0
execute store success score #shotgun_has_ammo skill.shotgun_cd run clear @s minecraft:iron_nugget[minecraft:custom_data~{ammo:1}] 1
execute if score #shotgun_has_ammo skill.shotgun_cd matches 1 run scoreboard players add @s skill.shotgun_mag 1
