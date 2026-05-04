execute at @e[tag=marker.loot_basic] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=marker.loot_basic] run setblock ~ ~ ~ minecraft:chest
execute at @e[tag=marker.loot_basic] run loot insert ~ ~ ~ loot escape_island:world/basic_supply

execute at @e[tag=marker.loot_rare] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=marker.loot_rare] run setblock ~ ~ ~ minecraft:chest
execute at @e[tag=marker.loot_rare] run loot insert ~ ~ ~ loot escape_island:world/rare_supply

execute at @e[tag=marker.loot_keynote] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=marker.loot_keynote] run setblock ~ ~ ~ minecraft:chest
execute at @e[tag=marker.loot_keynote] run loot insert ~ ~ ~ loot escape_island:world/keynote

tellraw @a {"text":"[物资] 物资箱已放置完毕。","color":"gold"}
