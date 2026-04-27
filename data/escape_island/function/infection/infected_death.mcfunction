
execute if entity @s[tag=state.dead] run return 0
tag @s add state.dead
scoreboard players operation @s mother_respawn = Tunable tunable.spore_respawn_seconds
execute if entity @s[tag=retained.priest] run scoreboard players add @s mother_respawn 10

execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["entity.dead_anchor"]}
gamemode adventure @s
attribute @s minecraft:movement_speed base set 0
effect give @s minecraft:invisibility 999 0 true
effect give @s minecraft:darkness 999 0 true
effect give @s minecraft:resistance 999 255 true
title @s title {"text":"§4倒下","bold":true}
title @s subtitle [{"text":"感染者复活倒计时: ","color":"red"},{"score":{"name":"@s","objective":"mother_respawn"}},{"text":"秒","color":"red"}]
tellraw @s [{"text":"§7倒下了。"},{"score":{"name":"@s","objective":"mother_respawn"}},{"text":"秒后在孢子点复活。","color":"gray"}]
