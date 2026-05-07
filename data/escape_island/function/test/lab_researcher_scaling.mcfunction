kill @e[tag=test.lab_researcher_scaling]

scoreboard players set $game player_count 4
function escape_island:util/apply_scaling
execute at @s run summon minecraft:marker ~1 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
execute at @s run summon minecraft:marker ~2 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
execute at @s run summon minecraft:marker ~3 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
execute at @s run summon minecraft:marker ~4 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
execute at @s run summon minecraft:marker ~5 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
function escape_island:task/spawn_lab_zombies
execute at @s run tag @e[type=minecraft:zombie,tag=entity.researcher,distance=..8] add test.lab_researcher_scaling
scoreboard players set $lab_test test_count 0
execute as @e[type=minecraft:zombie,tag=entity.researcher,tag=test.lab_researcher_scaling] run scoreboard players add $lab_test test_count 1
tellraw @s [{"text":"[TEST] 4人局研究员=","color":"gold"},{"score":{"name":"$lab_test","objective":"test_count"}},{"text":"，身份卡需求=","color":"gold"},{"score":{"name":"Tunable","objective":"tunable.lab_card_required"}},{"text":"，预期 3/3。","color":"green"}]
kill @e[tag=test.lab_researcher_scaling]

scoreboard players set $game player_count 8
function escape_island:util/apply_scaling
execute at @s run summon minecraft:marker ~1 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
execute at @s run summon minecraft:marker ~2 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
execute at @s run summon minecraft:marker ~3 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
execute at @s run summon minecraft:marker ~4 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
execute at @s run summon minecraft:marker ~5 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
function escape_island:task/spawn_lab_zombies
execute at @s run tag @e[type=minecraft:zombie,tag=entity.researcher,distance=..8] add test.lab_researcher_scaling
scoreboard players set $lab_test test_count 0
execute as @e[type=minecraft:zombie,tag=entity.researcher,tag=test.lab_researcher_scaling] run scoreboard players add $lab_test test_count 1
tellraw @s [{"text":"[TEST] 8人局研究员=","color":"gold"},{"score":{"name":"$lab_test","objective":"test_count"}},{"text":"，身份卡需求=","color":"gold"},{"score":{"name":"Tunable","objective":"tunable.lab_card_required"}},{"text":"，预期 4/4。","color":"green"}]
kill @e[tag=test.lab_researcher_scaling]

scoreboard players set $game player_count 17
function escape_island:util/apply_scaling
execute at @s run summon minecraft:marker ~1 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
execute at @s run summon minecraft:marker ~2 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
execute at @s run summon minecraft:marker ~3 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
execute at @s run summon minecraft:marker ~4 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
execute at @s run summon minecraft:marker ~5 ~ ~ {Tags:["test.lab_researcher_scaling","marker.mob_lab_researcher"]}
function escape_island:task/spawn_lab_zombies
execute at @s run tag @e[type=minecraft:zombie,tag=entity.researcher,distance=..8] add test.lab_researcher_scaling
scoreboard players set $lab_test test_count 0
execute as @e[type=minecraft:zombie,tag=entity.researcher,tag=test.lab_researcher_scaling] run scoreboard players add $lab_test test_count 1
tellraw @s [{"text":"[TEST] 17人局研究员=","color":"gold"},{"score":{"name":"$lab_test","objective":"test_count"}},{"text":"，身份卡需求=","color":"gold"},{"score":{"name":"Tunable","objective":"tunable.lab_card_required"}},{"text":"，预期 5/5。","color":"green"}]
kill @e[tag=test.lab_researcher_scaling]

tellraw @s [{"text":"[返回自测菜单]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
