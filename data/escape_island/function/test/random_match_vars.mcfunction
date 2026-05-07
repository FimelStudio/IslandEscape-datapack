kill @e[type=minecraft:marker,tag=test.random_vars]

execute at @s run summon minecraft:marker ~1 ~ ~ {Tags:["test.random_vars","marker.generator"]}
execute at @s run summon minecraft:marker ~2 ~ ~ {Tags:["test.random_vars","marker.generator"]}
execute at @s run summon minecraft:marker ~3 ~ ~ {Tags:["test.random_vars","marker.loot_basic"]}
execute at @s run summon minecraft:marker ~4 ~ ~ {Tags:["test.random_vars","marker.loot_basic"]}

function escape_island:game/randomize_match

scoreboard players set $rv_gen test_count 0
scoreboard players set $rv_hot test_count 0
execute as @e[type=minecraft:marker,tag=marker.generator,scores={gen_overload=8}] run scoreboard players add $rv_gen test_count 1
execute as @e[type=minecraft:marker,tag=marker.loot_hot,tag=marker.loot_rare] run scoreboard players add $rv_hot test_count 1

tellraw @s [{"text":"[TEST] 隐患发电机数量：","color":"gold"},{"score":{"name":"$rv_gen","objective":"test_count"}},{"text":"。预期 1。","color":"green"}]
tellraw @s [{"text":"[TEST] 热区物资数量：","color":"gold"},{"score":{"name":"$rv_hot","objective":"test_count"}},{"text":"。预期 1。","color":"green"}]
tellraw @s {"text":"[TEST] 开局时会在放置物资箱前执行随机，因此热区普通物资会按稀有物资箱生成。","color":"gray"}

scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_overload 0
tag @e[type=minecraft:marker,tag=gen.hidden_overload] remove gen.hidden_overload
tag @e[type=minecraft:marker,tag=marker.loot_hot] remove marker.loot_rare
tag @e[type=minecraft:marker,tag=marker.loot_hot] remove marker.loot_hot
kill @e[type=minecraft:marker,tag=test.random_vars]
tellraw @s [{"text":"[返回自测菜单]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
