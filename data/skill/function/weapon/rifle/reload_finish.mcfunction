tag @s remove skill.rifle.reloading
scoreboard players set @s skill.rifle_reload 0
clear @s minecraft:iron_nugget[minecraft:custom_data~{ammo:1}] 30
scoreboard players set @s skill.rifle_mag 30
title @s actionbar {"text":"SR-17 换弹完成 [30/30]","color":"green"}
playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.8 1.4
