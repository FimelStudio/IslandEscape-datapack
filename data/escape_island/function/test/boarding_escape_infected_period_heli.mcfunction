function escape_island:test/reset_state
tag @s add ie.active
scoreboard players operation @s ie.session = $game ie.match_id
schedule clear escape_island:game/end_all_infected_finish

scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 4
scoreboard players set $game ending_triggered 0
scoreboard players set $game heli_countdown -1
scoreboard players set $game escaped_count 0

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
team join survivors @s
scoreboard players set @s spore_load 80
scoreboard players set @s infect_time 30

tellraw @s {"text":"[TEST] 模拟感染期玩家已登机，转化前直升机起飞。预期：撤离成功，感染期清除，escaped_count=1，不出现驱离。","color":"gold"}
function escape_island:escape/_helicopter_depart

execute if entity @s[tag=state.escaped,tag=!state.infected_period,tag=!state.boarding] if score $game escaped_count matches 1 run tellraw @s [{"text":"[TEST PASS] 感染期转化前起飞：撤离成功，escaped_count=","color":"green"},{"score":{"name":"$game","objective":"escaped_count"}}]
execute unless entity @s[tag=state.escaped,tag=!state.infected_period,tag=!state.boarding] run tellraw @s {"text":"[TEST FAIL] 玩家状态不符合预期：需要 state.escaped 且无 state.infected_period/state.boarding。","color":"red"}
execute unless score $game escaped_count matches 1 run tellraw @s [{"text":"[TEST FAIL] escaped_count 应为 1，当前为 ","color":"red"},{"score":{"name":"$game","objective":"escaped_count"}}]
tellraw @s [{"text":"[返回自测菜单]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
