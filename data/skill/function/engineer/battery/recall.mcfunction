tag @s add skill.battery_recalled
execute at @s run particle minecraft:electric_spark ~ ~0.15 ~ 0.25 0.08 0.25 0.03 16 force @a[distance=..16]
execute at @s run playsound minecraft:block.lever.click player @a[distance=..12] ~ ~ ~ 0.6 1.6 1
execute at @s run kill @e[type=minecraft:marker,tag=entity.engineer_battery,distance=..2,sort=nearest,limit=1]
title @s actionbar {"text":"微型电池已回收，冷却继续计时","color":"yellow"}
function skill:engineer/battery/update_item
