execute if entity @s[tag=skill.shotgun.reloading] run return 0
execute if score @s skill.shotgun_mag matches 6.. run title @s actionbar {"text":"弹匣已满","color":"gray"}
execute if score @s skill.shotgun_mag matches 6.. run return 0
execute store result score #shotgun_ammo skill.shotgun_cd run clear @s minecraft:iron_nugget[minecraft:custom_data~{ammo:1}] 0
execute if score #shotgun_ammo skill.shotgun_cd matches ..0 run title @s actionbar {"text":"没有 9mm 弹药","color":"red"}
execute if score #shotgun_ammo skill.shotgun_cd matches ..0 run return 0
scoreboard players set @s skill.shotgun_reload 40
tag @s add skill.shotgun.reloading
title @s actionbar {"text":"SG-5 装填中","color":"gold"}
