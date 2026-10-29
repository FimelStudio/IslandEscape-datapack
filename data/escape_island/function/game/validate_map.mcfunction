# 正式开局前验证可运行的 v0.1 最小地图；不允许进入必然无法撤离的对局。
scoreboard players set $game ie.map_ready 1
scoreboard players set $map ie.map_count 0
execute as @e[type=minecraft:marker,tag=marker.lobby_ship] run scoreboard players add $map ie.map_count 1
execute if score $map ie.map_count matches ..0 run scoreboard players set $game ie.map_ready 0
execute if score $map ie.map_count matches ..0 run tellraw @a {"text": "[地图未就绪] marker.lobby_ship 至少需要 1 个已加载点位。", "color": "red"}
scoreboard players set $map ie.map_count 0
execute as @e[type=minecraft:marker,tag=marker.dining_room] run scoreboard players add $map ie.map_count 1
execute if score $map ie.map_count matches ..0 run scoreboard players set $game ie.map_ready 0
execute if score $map ie.map_count matches ..0 run tellraw @a {"text": "[地图未就绪] marker.dining_room 至少需要 1 个已加载点位。", "color": "red"}
scoreboard players set $map ie.map_count 0
execute as @e[type=minecraft:marker,tag=marker.signal_tower] run scoreboard players add $map ie.map_count 1
execute if score $map ie.map_count matches ..4 run scoreboard players set $game ie.map_ready 0
execute if score $map ie.map_count matches ..4 run tellraw @a {"text": "[地图未就绪] marker.signal_tower 至少需要 5 个已加载点位。", "color": "red"}
scoreboard players set $map ie.map_count 0
execute as @e[type=minecraft:marker,tag=marker.heli_pad] run scoreboard players add $map ie.map_count 1
execute if score $map ie.map_count matches ..3 run scoreboard players set $game ie.map_ready 0
execute if score $map ie.map_count matches ..3 run tellraw @a {"text": "[地图未就绪] marker.heli_pad 至少需要 4 个已加载点位。", "color": "red"}
scoreboard players set $map ie.map_count 0
execute as @e[type=minecraft:marker,tag=marker.loot_basic] run scoreboard players add $map ie.map_count 1
execute if score $map ie.map_count matches ..0 run scoreboard players set $game ie.map_ready 0
execute if score $map ie.map_count matches ..0 run tellraw @a {"text": "[地图未就绪] marker.loot_basic 至少需要 1 个已加载点位。", "color": "red"}
scoreboard players set $map ie.map_count 0
execute as @e[type=minecraft:marker,tag=marker.spawn_island] run scoreboard players add $map ie.map_count 1
execute if score $map ie.map_count < $game player_count run scoreboard players set $game ie.map_ready 0
execute if score $map ie.map_count < $game player_count run tellraw @a {"text":"[地图未就绪] 已加载的海岛出生点少于本局人数。","color":"red"}
execute unless entity @e[type=minecraft:marker,tag=marker.signal_tower,tag=marker.signal_core] run scoreboard players set $game ie.map_ready 0
execute unless entity @e[type=minecraft:marker,tag=marker.signal_tower,tag=marker.signal_core] run tellraw @a {"text":"[地图未就绪] 缺少同时带 signal_tower 与 signal_core 的核心塔。","color":"red"}
