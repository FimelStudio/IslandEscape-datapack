# 手动运行会清理测试玩家；正式对局期间拒绝执行。地图与长期记录保留。
execute if score $game in_game matches 1 run return 0
scoreboard players set $regression ie.test_fail 0
scoreboard players set $regression ie.test_pass 0
function escape_island:game/cleanup
attribute @s minecraft:armor base set 4
attribute @s minecraft:armor_toughness base set 2
attribute @s minecraft:knockback_resistance base set 0.8
tag @s add role.mechanic
function escape_island:player/reset
execute store result score $armor ie.test_value run attribute @s minecraft:armor base get 1000
execute unless score $armor ie.test_value matches 0 run scoreboard players add $regression ie.test_fail 1
execute store result score $knockback ie.test_value run attribute @s minecraft:knockback_resistance base get 1000
execute unless score $knockback ie.test_value matches 0 run scoreboard players add $regression ie.test_fail 1
execute if entity @s[tag=role.mechanic] run scoreboard players add $regression ie.test_fail 1
scoreboard players set $game in_game 1
scoreboard players set $game ie.mode 1
scoreboard players set $game ending_triggered 0
function escape_island:game/end_all_infected_finish
execute unless score $game in_game matches 1 run scoreboard players add $regression ie.test_fail 1
function escape_island:game/cleanup
tag @s add state.infection_resist
scoreboard players set @s ie.resist_left 2
function escape_island:player/tick_timers
execute unless entity @s[tag=state.infection_resist] run scoreboard players add $regression ie.test_fail 1
function escape_island:player/tick_timers
execute if entity @s[tag=state.infection_resist] run scoreboard players add $regression ie.test_fail 1
function escape_island:game/cleanup
execute if score $regression ie.test_fail matches 0 run tellraw @s {"text":"[PASS] 生命周期：母体属性恢复、职业清理、旧结算回调拒绝、个人抗性到期。","color":"green"}
execute if score $regression ie.test_fail matches 1.. run tellraw @s [{"text":"[FAIL] 生命周期回归失败项：","color":"red"},{"score":{"name":"$regression","objective":"ie.test_fail"}}]
