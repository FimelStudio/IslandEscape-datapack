execute if items entity @s weapon.mainhand minecraft:sugar[minecraft:custom_data~{weapon:"ak47"}] run function skill:weapon/ak47/sync_held
execute if score @s skill.ak47_mag matches 30.. run title @s actionbar {"text":"弹匣已满","color":"gray"}
execute if score @s skill.ak47_mag matches 30.. run function skill:weapon/ak47/update_item
execute if score @s skill.ak47_mag matches 30.. run return 0

execute store result score #ammo skill.ak47_tmp run clear @s minecraft:iron_nugget[minecraft:custom_data~{ammo:"7.62"}] 0
execute if score #ammo skill.ak47_tmp matches ..0 run title @s actionbar {"text":"没有 7.62 弹药","color":"red"}
execute if score #ammo skill.ak47_tmp matches ..0 run playsound minecraft:block.lever.click player @s ~ ~ ~ 0.5 1.6
execute if score #ammo skill.ak47_tmp matches ..0 run function skill:weapon/ak47/update_item
execute if score #ammo skill.ak47_tmp matches ..0 run return 0

tag @s add skill.ak47.reloading
scoreboard players set @s skill.ak47_reload 40
function skill:weapon/ak47/update_item
title @s actionbar {"text":"开始换弹","color":"yellow"}
playsound minecraft:item.crossbow.loading_start player @s ~ ~ ~ 0.7 1.4
