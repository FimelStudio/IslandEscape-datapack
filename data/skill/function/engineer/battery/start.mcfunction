execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["entity.engineer_battery","skill.battery.marker","skill.battery.active"],CustomName:{"text":"微型电池","color":"yellow"}}
execute at @s as @e[type=minecraft:marker,tag=entity.engineer_battery,distance=..0.2,sort=nearest,limit=1] run scoreboard players operation @s skill.battery_timer = #duration skill.battery_cfg
execute at @s run particle minecraft:electric_spark ~ ~0.15 ~ 0.25 0.08 0.25 0.03 24 force @a[distance=..16]
execute at @s run playsound minecraft:block.beacon.activate player @a[distance=..16] ~ ~ ~ 0.65 1.5 1
title @s actionbar {"text":"微型电池已部署：4格内修复速度提升60秒","color":"gold"}

scoreboard players operation @s skill.battery_cd = #cooldown skill.battery_cfg
function skill:engineer/battery/update_item
