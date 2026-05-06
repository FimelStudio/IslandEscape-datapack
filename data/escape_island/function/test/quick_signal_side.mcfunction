scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower,tag=!marker.signal_core,distance=..8,sort=nearest,limit=1] signal_local 99
scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower,tag=!marker.signal_core,distance=..8,sort=nearest,limit=1] signal_repair_acc 0
tellraw @s {"text":"[测试] 最近边塔进度已设到99，再修一段就完成","color":"gold"}
