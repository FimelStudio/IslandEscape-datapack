function escape_island:test/reset_state
schedule clear escape_island:game/end_all_infected_finish
kill @e[type=minecraft:marker,tag=test.boarding_kick_marker]
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["test.boarding_kick_marker","heli.selected_pad"]}

scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 4
scoreboard players set $game ending_triggered 0
scoreboard players set $game heli_countdown -8
scoreboard players set $game ship_countdown 0
scoreboard players set $game sub_countdown 0

gamemode spectator @s
tag @s add team.human
tag @s add state.infected_period
tag @s add state.boarding
tag @s add state.boarding.heli
tag @s remove team.infected
tag @s remove infected.common
tag @s remove infected.mother
tag @s remove state.escaped
tag @s remove state.dead
tag @s remove state.sporifying
team join infected_period @s
scoreboard players set @s spore_load 200
scoreboard players set @s infect_time 3

title @s title {"text":"测试：登载转化驱离","color":"gold","bold":true}
title @s subtitle {"text":"3 秒后应转化并拉回起点附近","color":"yellow"}
tellraw @s {"text":"[TEST] 你已被放入直升机登载窗口并进入感染期。可以先用观察者飞远；预期倒计时归零后会被拉回起点附近，转为 adventure，并显示“感染爆发——你被驱离”。","color":"gold"}
