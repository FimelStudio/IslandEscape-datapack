tellraw @s {"text":"\n[MAPCHECK] 地图标记检查","color":"gold","bold":true}
execute if score $game dev_mode matches 1 run tellraw @s {"text":"[MAPCHECK] 当前使用开发沙盒临时 marker。正式地图完成后请清理沙盒再检查。","color":"aqua"}
execute unless score $game dev_mode matches 1 unless entity @e[type=minecraft:marker,tag=marker.spawn_island,limit=1] run tellraw @s [{"text":"[INFO] 未检测到地图 marker。地图未完成时可先使用开发沙盒。","color":"aqua"},{"text":" [创建开发沙盒]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/start"}}]

scoreboard players set $spawn_island test_count 0
scoreboard players set $spawn_beach test_count 0
scoreboard players set $heli_pad test_count 0
scoreboard players set $generator test_count 0
scoreboard players set $spore_spot test_count 0
scoreboard players set $loot_basic test_count 0
scoreboard players set $loot_rare test_count 0
scoreboard players set $loot_keynote test_count 0
scoreboard players set $researcher test_count 0

execute as @e[type=minecraft:marker,tag=marker.spawn_island] run scoreboard players add $spawn_island test_count 1
execute as @e[type=minecraft:marker,tag=marker.spawn_beach] run scoreboard players add $spawn_beach test_count 1
execute as @e[type=minecraft:marker,tag=marker.heli_pad] run scoreboard players add $heli_pad test_count 1
execute as @e[type=minecraft:marker,tag=marker.generator] run scoreboard players add $generator test_count 1
execute as @e[type=minecraft:marker,tag=marker.spore_spot] run scoreboard players add $spore_spot test_count 1
execute as @e[type=minecraft:marker,tag=marker.loot_basic] run scoreboard players add $loot_basic test_count 1
execute as @e[type=minecraft:marker,tag=marker.loot_rare] run scoreboard players add $loot_rare test_count 1
execute as @e[type=minecraft:marker,tag=marker.loot_keynote] run scoreboard players add $loot_keynote test_count 1
execute as @e[type=minecraft:marker,tag=marker.mob_lab_researcher] run scoreboard players add $researcher test_count 1

execute if entity @e[type=minecraft:marker,tag=marker.lobby_ship,limit=1] run tellraw @s {"text":"[OK] marker.lobby_ship 船上大厅","color":"green"}
execute unless entity @e[type=minecraft:marker,tag=marker.lobby_ship,limit=1] run tellraw @s {"text":"[MISS] marker.lobby_ship 船上大厅","color":"red"}
execute if entity @e[type=minecraft:marker,tag=marker.dining_room,limit=1] run tellraw @s {"text":"[OK] marker.dining_room 餐厅准备区","color":"green"}
execute unless entity @e[type=minecraft:marker,tag=marker.dining_room,limit=1] run tellraw @s {"text":"[MISS] marker.dining_room 餐厅准备区","color":"red"}

execute if score $spawn_island test_count matches 8.. run tellraw @s [{"text":"[OK] marker.spawn_island 分散出生点 x","color":"green"},{"score":{"name":"$spawn_island","objective":"test_count"}}]
execute if score $spawn_island test_count matches 1..7 run tellraw @s [{"text":"[WARN] marker.spawn_island 建议至少 8 个，当前 x","color":"yellow"},{"score":{"name":"$spawn_island","objective":"test_count"}}]
execute if score $spawn_island test_count matches 0 run tellraw @s {"text":"[MISS] marker.spawn_island 分散出生点","color":"red"}
execute if score $spawn_beach test_count matches 1.. run tellraw @s [{"text":"[OK] marker.spawn_beach 备用出生点 x","color":"green"},{"score":{"name":"$spawn_beach","objective":"test_count"}}]
execute if score $spawn_beach test_count matches 0 run tellraw @s {"text":"[WARN] marker.spawn_beach 备用出生点缺失，随机出生无可用点时无法兜底","color":"yellow"}

execute if entity @e[type=minecraft:marker,tag=marker.signal_tower,limit=1] run tellraw @s {"text":"[OK] marker.signal_tower 信号塔","color":"green"}
execute unless entity @e[type=minecraft:marker,tag=marker.signal_tower,limit=1] run tellraw @s {"text":"[MISS] marker.signal_tower 信号塔","color":"red"}
execute if score $generator test_count matches 2.. run tellraw @s [{"text":"[OK] marker.generator 发电机 x","color":"green"},{"score":{"name":"$generator","objective":"test_count"}}]
execute if score $generator test_count matches 1 run tellraw @s {"text":"[WARN] marker.generator 建议至少 2 个，当前 x1","color":"yellow"}
execute if score $generator test_count matches 0 run tellraw @s {"text":"[MISS] marker.generator 发电机","color":"red"}
execute if score $heli_pad test_count matches 4.. run tellraw @s [{"text":"[OK] marker.heli_pad 直升机降落点 x","color":"green"},{"score":{"name":"$heli_pad","objective":"test_count"}}]
execute if score $heli_pad test_count matches 1..3 run tellraw @s [{"text":"[WARN] marker.heli_pad 建议至少 4 个，当前 x","color":"yellow"},{"score":{"name":"$heli_pad","objective":"test_count"}}]
execute if score $heli_pad test_count matches 0 run tellraw @s {"text":"[MISS] marker.heli_pad 直升机降落点","color":"red"}

execute if entity @e[type=minecraft:marker,tag=marker.ship_dock,limit=1] run tellraw @s {"text":"[OK] marker.ship_dock 船坞撤离点","color":"green"}
execute unless entity @e[type=minecraft:marker,tag=marker.ship_dock,limit=1] run tellraw @s {"text":"[MISS] marker.ship_dock 船坞撤离点","color":"red"}
execute if entity @e[type=minecraft:marker,tag=marker.lab_entrance,limit=1] run tellraw @s {"text":"[OK] marker.lab_entrance 实验室入口","color":"green"}
execute unless entity @e[type=minecraft:marker,tag=marker.lab_entrance,limit=1] run tellraw @s {"text":"[MISS] marker.lab_entrance 实验室入口","color":"red"}
execute if entity @e[type=minecraft:marker,tag=marker.lab_terminal,limit=1] run tellraw @s {"text":"[OK] marker.lab_terminal 实验室终端","color":"green"}
execute unless entity @e[type=minecraft:marker,tag=marker.lab_terminal,limit=1] run tellraw @s {"text":"[MISS] marker.lab_terminal 实验室终端","color":"red"}
execute if entity @e[type=minecraft:marker,tag=marker.lab_sub,limit=1] run tellraw @s {"text":"[OK] marker.lab_sub 潜艇撤离点","color":"green"}
execute unless entity @e[type=minecraft:marker,tag=marker.lab_sub,limit=1] run tellraw @s {"text":"[MISS] marker.lab_sub 潜艇撤离点","color":"red"}
execute if entity @e[type=minecraft:marker,tag=marker.lab_disguise,limit=1] run tellraw @s {"text":"[OK] marker.lab_disguise 伪装路线点","color":"green"}
execute unless entity @e[type=minecraft:marker,tag=marker.lab_disguise,limit=1] run tellraw @s {"text":"[MISS] marker.lab_disguise 伪装路线点","color":"red"}
execute if entity @e[type=minecraft:marker,tag=marker.island_bomb,limit=1] run tellraw @s {"text":"[OK] marker.island_bomb 彩蛋自爆点","color":"green"}
execute unless entity @e[type=minecraft:marker,tag=marker.island_bomb,limit=1] run tellraw @s {"text":"[MISS] marker.island_bomb 彩蛋自爆点","color":"red"}

execute if score $spore_spot test_count matches 5.. run tellraw @s [{"text":"[OK] marker.spore_spot 感染者复活点 x","color":"green"},{"score":{"name":"$spore_spot","objective":"test_count"}}]
execute if score $spore_spot test_count matches 1..4 run tellraw @s [{"text":"[WARN] marker.spore_spot 建议至少 5 个，当前 x","color":"yellow"},{"score":{"name":"$spore_spot","objective":"test_count"}}]
execute if score $spore_spot test_count matches 0 run tellraw @s {"text":"[MISS] marker.spore_spot 感染者复活点","color":"red"}
execute if score $loot_basic test_count matches 20.. run tellraw @s [{"text":"[OK] marker.loot_basic 基础物资点 x","color":"green"},{"score":{"name":"$loot_basic","objective":"test_count"}}]
execute if score $loot_basic test_count matches 1..19 run tellraw @s [{"text":"[WARN] marker.loot_basic 建议至少 20 个，当前 x","color":"yellow"},{"score":{"name":"$loot_basic","objective":"test_count"}}]
execute if score $loot_basic test_count matches 0 run tellraw @s {"text":"[WARN] marker.loot_basic 基础物资点缺失","color":"yellow"}
execute if score $loot_rare test_count matches 5.. run tellraw @s [{"text":"[OK] marker.loot_rare 稀有物资点 x","color":"green"},{"score":{"name":"$loot_rare","objective":"test_count"}}]
execute if score $loot_rare test_count matches 1..4 run tellraw @s [{"text":"[WARN] marker.loot_rare 建议至少 5 个，当前 x","color":"yellow"},{"score":{"name":"$loot_rare","objective":"test_count"}}]
execute if score $loot_rare test_count matches 0 run tellraw @s {"text":"[WARN] marker.loot_rare 稀有物资点缺失","color":"yellow"}
execute if score $loot_keynote test_count matches 5.. run tellraw @s [{"text":"[OK] marker.loot_keynote 关键线索点 x","color":"green"},{"score":{"name":"$loot_keynote","objective":"test_count"}}]
execute if score $loot_keynote test_count matches 1..4 run tellraw @s [{"text":"[WARN] marker.loot_keynote 建议至少 5 个，当前 x","color":"yellow"},{"score":{"name":"$loot_keynote","objective":"test_count"}}]
execute if score $loot_keynote test_count matches 0 run tellraw @s {"text":"[WARN] marker.loot_keynote 关键线索点缺失","color":"yellow"}
execute if score $researcher test_count matches 4.. run tellraw @s [{"text":"[OK] marker.mob_lab_researcher 实验室感染研究员 x","color":"green"},{"score":{"name":"$researcher","objective":"test_count"}}]
execute if score $researcher test_count matches 1..3 run tellraw @s [{"text":"[WARN] marker.mob_lab_researcher 建议至少 4 个，当前 x","color":"yellow"},{"score":{"name":"$researcher","objective":"test_count"}}]
execute if score $researcher test_count matches 0 run tellraw @s {"text":"[WARN] marker.mob_lab_researcher 缺失，第三阶段实验室战斗会偏空","color":"yellow"}

execute if entity @e[type=minecraft:marker,tag=marker.event_blackout,limit=1] run tellraw @s {"text":"[OK] marker.event_blackout 随机停电事件点","color":"green"}
execute unless entity @e[type=minecraft:marker,tag=marker.event_blackout,limit=1] run tellraw @s {"text":"[INFO] marker.event_blackout 可选，缺失不影响主流程","color":"gray"}
execute if entity @e[type=minecraft:marker,tag=marker.captain_marlowe,limit=1] run tellraw @s {"text":"[OK] marker.captain_marlowe 彩蛋 NPC","color":"green"}
execute unless entity @e[type=minecraft:marker,tag=marker.captain_marlowe,limit=1] run tellraw @s {"text":"[INFO] marker.captain_marlowe 可选彩蛋","color":"gray"}
execute if entity @e[type=minecraft:marker,tag=marker.dock_npc_korvin,limit=1] run tellraw @s {"text":"[OK] marker.dock_npc_korvin 船坞 NPC","color":"green"}
execute unless entity @e[type=minecraft:marker,tag=marker.dock_npc_korvin,limit=1] run tellraw @s {"text":"[INFO] marker.dock_npc_korvin 可选彩蛋","color":"gray"}

tellraw @s {"text":"[MAPCHECK] 检查结束：红色 MISS 需要补；黄色 WARN 是体验/平衡建议。","color":"gold"}
