kill @e[type=minecraft:marker,tag=test.mother_hit_dummy]
function escape_island:dev/as_survivor
scoreboard players set @s spore_load 0
scoreboard players set $test mother_hit_cd 0
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["test.mother_hit_dummy","infected.mother"]}
scoreboard players set @e[type=minecraft:marker,tag=test.mother_hit_dummy,limit=1] mother_hit_cd 0
function escape_island:interaction/on_hit_by_mother
scoreboard players operation $test mother_hit_cd = @e[type=minecraft:marker,tag=test.mother_hit_dummy,limit=1] mother_hit_cd
tellraw @s [{"text":"[TEST] 隐藏母体命中：","color":"gold"},{"text":"spore=","color":"gray"},{"score":{"name":"@s","objective":"spore_load"}},{"text":"，mother_cd=","color":"gray"},{"score":{"name":"$test","objective":"mother_hit_cd"}},{"text":"。预期 spore=0，mother_cd=0。","color":"green"}]
kill @e[type=minecraft:marker,tag=test.mother_hit_dummy]

scoreboard players set @s spore_load 0
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["test.mother_hit_dummy","infected.mother","state.mutated"]}
scoreboard players set @e[type=minecraft:marker,tag=test.mother_hit_dummy,limit=1] mother_hit_cd 0
function escape_island:interaction/on_hit_by_mother
scoreboard players operation $test mother_hit_cd = @e[type=minecraft:marker,tag=test.mother_hit_dummy,limit=1] mother_hit_cd
tellraw @s [{"text":"[TEST] 猎手母体命中：","color":"gold"},{"text":"spore=","color":"gray"},{"score":{"name":"@s","objective":"spore_load"}},{"text":"，mother_cd=","color":"gray"},{"score":{"name":"$test","objective":"mother_hit_cd"}},{"text":"。预期 spore=40，mother_cd=50。","color":"green"}]
function escape_island:interaction/on_hit_by_mother
scoreboard players operation $test mother_hit_cd = @e[type=minecraft:marker,tag=test.mother_hit_dummy,limit=1] mother_hit_cd
tellraw @s [{"text":"[TEST] 猎手冷却内再命中：","color":"gold"},{"text":"spore=","color":"gray"},{"score":{"name":"@s","objective":"spore_load"}},{"text":"，mother_cd=","color":"gray"},{"score":{"name":"$test","objective":"mother_hit_cd"}},{"text":"。预期 spore 仍为 40。","color":"green"}]
kill @e[type=minecraft:marker,tag=test.mother_hit_dummy]
tellraw @s [{"text":"[返回感染测试菜单]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
