scoreboard players set $game signal_done 1
scoreboard players operation $game signal_progress = Tunable tunable.signal_stages
bossbar set escape_island:signal visible true
execute store result bossbar escape_island:signal max run scoreboard players get Tunable tunable.signal_stages
execute store result bossbar escape_island:signal value run scoreboard players get $game signal_progress
tellraw @a {"text":"§a[信号塔] 修复完成！求救信号已经上线，还需要稳定电力。","color":"green"}
execute at @e[type=minecraft:marker,tag=marker.signal_tower,limit=1,sort=nearest] run setblock ~ ~1 ~ minecraft:redstone_lamp
execute at @e[type=minecraft:marker,tag=marker.signal_tower,limit=1,sort=nearest] run playsound minecraft:block.beacon.activate master @a[distance=..32] ~ ~ ~ 1 1
