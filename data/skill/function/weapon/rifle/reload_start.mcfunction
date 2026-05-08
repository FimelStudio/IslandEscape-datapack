execute if score @s skill.rifle_mag matches 30.. run title @s actionbar {"text":"弹匣已满","color":"gray"}
execute if score @s skill.rifle_mag matches 30.. run return 0

execute store result score #ammo skill.rifle_tmp run clear @s minecraft:iron_nugget[minecraft:custom_data~{ammo:1}] 0
execute if score #ammo skill.rifle_tmp matches ..0 run title @s actionbar {"text":"没有 9mm 弹药","color":"red"}
execute if score #ammo skill.rifle_tmp matches ..0 run playsound minecraft:block.lever.click player @s ~ ~ ~ 0.5 1.6
execute if score #ammo skill.rifle_tmp matches ..0 run return 0

tag @s add skill.rifle.reloading
scoreboard players set @s skill.rifle_reload 50
title @s actionbar {"text":"SR-17 换弹中...","color":"green"}
playsound minecraft:item.crossbow.loading_start player @s ~ ~ ~ 0.7 1.4
