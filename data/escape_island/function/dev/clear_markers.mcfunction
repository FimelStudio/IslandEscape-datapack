kill @e[type=minecraft:marker,tag=dev.marker]
kill @e[type=armor_stand,tag=dev.marker]
kill @e[type=armor_stand,tag=dev_gen_vis]
kill @e[type=minecraft:interaction,tag=entity.generator_interaction]
kill @e[type=minecraft:interaction,tag=entity.ship_door]
kill @e[tag=entity.ship_door_hint]
scoreboard players set $dev_markers dev_count 0
tellraw @s {"text":"[DEV] 已清理临时 marker。","color":"gray"}
