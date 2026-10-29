execute if entity @s[tag=state.dead] run return 0
tag @s add state.dead
execute if score $game mother_dead matches 1 run function escape_island:infection/permadeath_spectator
execute if score $game mother_dead matches 1 run title @s title {"text":"§8永久倒下","bold":true}
execute if score $game mother_dead matches 1 run title @s subtitle {"text":"§7母体已消亡，你进入旁观。","italic":true}
execute if score $game mother_dead matches 1 run return 0
# 训练环境无母体时保留原有的结束方式。
execute unless score $game in_game matches 1 unless entity @e[tag=infected.mother,tag=!state.dead,tag=!state.spectator] run function escape_island:infection/permadeath_spectator
execute unless score $game in_game matches 1 unless entity @e[tag=infected.mother,tag=!state.dead,tag=!state.spectator] run return 0
# 母体暂时不在线时仍进入倒下状态；只有明确记录死亡才永久淘汰。
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["entity.dead_anchor","ie.new"]}
function escape_island:player/claim_entities
gamemode adventure @s
attribute @s minecraft:movement_speed base set 0
effect give @s minecraft:invisibility 999 0 true
effect give @s minecraft:darkness 999 0 true
effect give @s minecraft:resistance 999 255 true
function escape_island:visual/clear_head

scoreboard players operation @s mother_respawn = Tunable tunable.spore_respawn_seconds
execute if entity @s[tag=retained.priest] run scoreboard players add @s mother_respawn 10
title @s title {"text":"§4倒下","bold":true}
title @s subtitle [{"text":"感染者复活倒计时: ","color":"red"},{"score":{"name":"@s","objective":"mother_respawn"}},{"text":"秒","color":"red"}]
