execute at @e[tag=marker.spawn_island] run particle minecraft:end_rod ~ ~1 ~ 0 0 0 0 1 force @a
execute at @e[tag=marker.spore_spot] run particle minecraft:dust{color:[0.9,0.0,0.0],scale:4} ~ ~1 ~ 0 0 0 0 1 force @a
execute at @e[tag=marker.signal_tower] run particle minecraft:end_rod ~ ~2 ~ 0 0 0 0 1 force @a
execute at @e[tag=marker.generator] run particle minecraft:dust{color:[1.0,0.8,0.0],scale:4} ~ ~1 ~ 0 0 0 0 1 force @a
execute at @e[tag=marker.heli_pad] run particle minecraft:dust{color:[0.0,0.9,0.9],scale:4} ~ ~1 ~ 0 0 0 0 1 force @a
execute at @e[tag=marker.scan_station] run particle minecraft:dust{color:[0.3,0.7,1.0],scale:4} ~ ~1 ~ 0 0 0 0 1 force @a

execute at @e[tag=marker.loot_basic] run particle minecraft:dust{color:[1.0,1.0,0.0],scale:3} ~ ~1 ~ 0 0 0 0 1 force @a
execute at @e[tag=marker.loot_rare] run particle minecraft:dust{color:[1.0,0.6,0.0],scale:4} ~ ~1 ~ 0 0 0 0 1 force @a
execute at @e[tag=marker.loot_keynote] run particle minecraft:dust{color:[0.5,0.0,0.5],scale:4} ~ ~1 ~ 0 0 0 0 1 force @a

execute at @e[tag=marker.island_bomb] run particle minecraft:dust{color:[0.7,0.0,0.0],scale:4} ~ ~1 ~ 0 0 0 0 1 force @a

execute at @e[tag=marker.lab_sub] run particle minecraft:dust{color:[0.3,0.0,0.5],scale:4} ~ ~1 ~ 0 0 0 0 1 force @a

tellraw @s [{"text":"[DEV] 标记预览：出生白|孢子红|信号白|发电金|直升青|扫描蓝|物资黄|稀有橙|线索紫|炸弹暗红|潜艇深紫","color":"gold"}]
