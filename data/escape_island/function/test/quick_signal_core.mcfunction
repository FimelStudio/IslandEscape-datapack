scoreboard players set @e[type=minecraft:marker,tag=marker.signal_core,sort=nearest,limit=1] signal_local 99
scoreboard players set @e[type=minecraft:marker,tag=marker.signal_core,sort=nearest,limit=1] signal_repair_acc 0
tellraw @s {"text":"[测试] 核心塔进度已设到99，再修一段就完成","color":"gold"}
