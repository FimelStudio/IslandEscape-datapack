scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower,distance=..5,sort=nearest,limit=1] signal_local 99
tellraw @s {"text":"[测试] 最近信号塔进度已设到99，再摸1秒就完成","color":"gold"}
