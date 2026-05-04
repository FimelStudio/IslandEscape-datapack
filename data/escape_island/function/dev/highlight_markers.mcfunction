execute at @e[tag=marker.spawn_island] run particle minecraft:end_rod ~ ~1 ~ 0 0 0 0 1 force @a
execute at @e[tag=marker.spore_spot] run particle minecraft:dust{color:[0.9,0.0,0.0],scale:4} ~ ~1 ~ 0 0 0 0 1 force @a
execute at @e[tag=marker.signal_tower] run particle minecraft:end_rod ~ ~2 ~ 0 0 0 0 1 force @a
execute at @e[tag=marker.generator] run particle minecraft:dust{color:[1.0,0.8,0.0],scale:4} ~ ~1 ~ 0 0 0 0 1 force @a
execute at @e[tag=marker.heli_pad] run particle minecraft:dust{color:[0.0,0.9,0.9],scale:4} ~ ~1 ~ 0 0 0 0 1 force @a

tellraw @s [{"text":"[DEV] 标记位置预览：出生点=白 | 孢子=红 | 信号塔=白 | 发电机=金 | 直升机=青","color":"gold"}]
