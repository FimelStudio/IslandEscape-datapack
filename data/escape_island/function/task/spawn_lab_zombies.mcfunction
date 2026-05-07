tag @e[type=minecraft:marker,tag=marker.mob_lab_researcher] remove lab.spawn_used
scoreboard players operation $lab lab_spawn_left = Tunable tunable.lab_researcher_count
scoreboard players set $lab_spawned test_count 0

execute if score $lab lab_spawn_left matches 1.. as @e[type=minecraft:marker,tag=marker.mob_lab_researcher,tag=!lab.spawn_used,sort=random,limit=1] at @s run function escape_island:task/_spawn_lab_researcher_one
execute if score $lab lab_spawn_left matches 1.. as @e[type=minecraft:marker,tag=marker.mob_lab_researcher,tag=!lab.spawn_used,sort=random,limit=1] at @s run function escape_island:task/_spawn_lab_researcher_one
execute if score $lab lab_spawn_left matches 1.. as @e[type=minecraft:marker,tag=marker.mob_lab_researcher,tag=!lab.spawn_used,sort=random,limit=1] at @s run function escape_island:task/_spawn_lab_researcher_one
execute if score $lab lab_spawn_left matches 1.. as @e[type=minecraft:marker,tag=marker.mob_lab_researcher,tag=!lab.spawn_used,sort=random,limit=1] at @s run function escape_island:task/_spawn_lab_researcher_one
execute if score $lab lab_spawn_left matches 1.. as @e[type=minecraft:marker,tag=marker.mob_lab_researcher,tag=!lab.spawn_used,sort=random,limit=1] at @s run function escape_island:task/_spawn_lab_researcher_one

tag @e[type=minecraft:marker,tag=marker.mob_lab_researcher] remove lab.spawn_used
tellraw @a [{"text":"[系统] 实验室区域出现感染研究员 x","color":"dark_purple","italic":true},{"score":{"name":"$lab_spawned","objective":"test_count"}}]
execute if score $lab lab_spawn_left matches 1.. run tellraw @a [{"text":"[WARN] 实验室研究员 marker 不足，仍缺 ","color":"yellow"},{"score":{"name":"$lab","objective":"lab_spawn_left"}},{"text":" 个候选点。","color":"yellow"}]
