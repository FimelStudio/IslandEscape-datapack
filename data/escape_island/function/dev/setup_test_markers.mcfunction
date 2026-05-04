summon minecraft:marker ~ ~ ~ {Tags:["marker.spawn_island"]}
summon minecraft:marker ~2 ~ ~ {Tags:["marker.spawn_island"]}
summon minecraft:marker ~4 ~ ~ {Tags:["marker.spawn_island"]}
summon minecraft:marker ~6 ~ ~ {Tags:["marker.spawn_island"]}
summon minecraft:marker ~8 ~ ~ {Tags:["marker.spawn_island"]}
summon minecraft:marker ~ ~ ~4 {Tags:["marker.spore_spot"]}
summon minecraft:marker ~ ~ ~6 {Tags:["marker.spore_spot"]}
summon minecraft:marker ~ ~ ~8 {Tags:["marker.spore_spot"]}
summon minecraft:marker ~ ~ ~10 {Tags:["marker.spore_spot"]}
summon minecraft:marker ~ ~ ~12 {Tags:["marker.spore_spot"]}
tellraw @s {"text":"[DEV] 已在此处生成测试 marker：spawn_island×5, spore_spot×5","color":"gray"}
tellraw @s [{"text":"请在信号塔、发电机、直升机位置分别点击下面的按钮","color":"gold"}]
