function escape_island:test/signal_tower_setup
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["entity.engineer_battery","skill.battery_marker","skill.battery_active"],CustomName:{"text":"微型电池","color":"yellow"}}
tellraw @s {"text":"[Batch 7A] 电池范围测试：脚下已放置微型电池，接线速度应明显加快。","color":"aqua"}
