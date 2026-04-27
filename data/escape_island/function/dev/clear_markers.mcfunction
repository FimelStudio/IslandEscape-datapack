kill @e[type=minecraft:marker,tag=dev.marker]
scoreboard players set $dev_markers dev_count 0
tellraw @s {"text":"[DEV] 已清理临时 marker。","color":"gray"}
