# escape_island:dev/check_markers  —  count temporary sandbox markers
scoreboard players set $dev_markers dev_count 0
execute as @e[type=minecraft:marker,tag=dev.marker] run scoreboard players add $dev_markers dev_count 1
tellraw @s [{"text":"[DEV] 临时 marker 数量: ","color":"aqua"},{"score":{"name":"$dev_markers","objective":"dev_count"}}]
