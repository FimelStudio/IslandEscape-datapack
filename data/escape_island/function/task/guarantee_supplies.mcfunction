execute at @e[tag=marker.signal_tower,limit=1] run setblock ~ ~-1 ~ minecraft:chest
execute at @e[tag=marker.signal_tower,limit=1] run loot insert ~ ~-1 ~ loot escape_island:world/guarantee

execute at @e[tag=marker.generator,sort=nearest,limit=1] run setblock ~ ~-1 ~ minecraft:chest
execute at @e[tag=marker.generator,sort=nearest,limit=1] run loot insert ~ ~-1 ~ loot escape_island:world/guarantee

tellraw @a {"text":"[物资] 保底物资已放置：信号塔和发电机附近各有线缆+燃料电池","color":"gold"}
