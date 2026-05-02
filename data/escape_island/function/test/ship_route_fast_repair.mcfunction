scoreboard players set $game ship_parts 5
scoreboard players set $ship_part_propeller ship_parts 1
scoreboard players set $ship_part_fuel_pump ship_parts 1
scoreboard players set $ship_part_steering_linkage ship_parts 1
scoreboard players set $ship_part_starter_battery ship_parts 1
scoreboard players set $ship_part_anchor_winch ship_parts 1
scoreboard players set $game ship_progress 95
bossbar set escape_island:ship name {"text":"轮船修复进度","color":"aqua"}
bossbar set escape_island:ship visible true
bossbar set escape_island:ship players @a
bossbar set escape_island:ship max 100
bossbar set escape_island:ship value 95
tellraw @s {"text":"[Batch 9A] 已将轮船修复进度设为 95，站在船坞旁约 5 秒应触发离港倒计时。","color":"yellow"}
