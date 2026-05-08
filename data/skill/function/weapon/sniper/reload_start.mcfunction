execute if entity @s[tag=skill.sniper.reloading] run return 0
execute if score @s skill.sniper_mag matches 5.. run title @s actionbar {"text":"弹匣已满","color":"gray"}
execute if score @s skill.sniper_mag matches 5.. run return 0

execute store result score #chk skill.sniper_cd run clear @s minecraft:arrow[minecraft:custom_data~{ammo:"sniper_round"}] 0
execute if score #chk skill.sniper_cd matches ..0 run title @s actionbar {"text":"没有狙击弹","color":"red"}
execute if score #chk skill.sniper_cd matches ..0 run playsound minecraft:block.lever.click player @s ~ ~ ~ 0.5 1.6
execute if score #chk skill.sniper_cd matches ..0 run return 0

tag @s add skill.sniper.reloading
scoreboard players set @s skill.sniper_reload 70
title @s actionbar {"text":"SP-1 换弹中","color":"aqua"}
playsound minecraft:item.crossbow.loading_start player @s ~ ~ ~ 0.7 1.4
