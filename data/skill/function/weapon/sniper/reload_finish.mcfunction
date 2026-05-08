tag @s remove skill.sniper.reloading
scoreboard players set @s skill.sniper_reload 0
clear @s minecraft:arrow[minecraft:custom_data~{ammo:"sniper_round"}] 5
scoreboard players set @s skill.sniper_mag 5
title @s actionbar {"text":"SP-1 换弹完成 [5/5]","color":"aqua"}
playsound minecraft:item.spyglass.stop_using player @s ~ ~ ~ 0.8 1.2
