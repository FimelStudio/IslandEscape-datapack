execute if score @s skill.pistol_mag matches 8.. run title @s actionbar {"text":"弹匣已满","color":"gray"}
execute if score @s skill.pistol_mag matches 8.. run function skill:weapon/pistol/update_item
execute if score @s skill.pistol_mag matches 8.. run return 0

execute store result score #ammo skill.pistol_tmp run clear @s minecraft:iron_nugget[minecraft:custom_data~{ammo:1}] 0
execute if score #ammo skill.pistol_tmp matches ..0 run title @s actionbar {"text":"没有 9mm 弹药","color":"red"}
execute if score #ammo skill.pistol_tmp matches ..0 run playsound minecraft:block.lever.click player @s ~ ~ ~ 0.5 1.6
execute if score #ammo skill.pistol_tmp matches ..0 run function skill:weapon/pistol/update_item
execute if score #ammo skill.pistol_tmp matches ..0 run return 0

tag @s add skill.pistol.reloading
scoreboard players set @s skill.pistol_reload 40
function skill:weapon/pistol/update_item
title @s actionbar {"text":"开始换弹","color":"yellow"}
playsound minecraft:item.crossbow.loading_start player @s ~ ~ ~ 0.7 1.4
