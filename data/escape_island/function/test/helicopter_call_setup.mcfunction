function escape_island:dev/start

scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 3
scoreboard players set $game phase_timer 0
scoreboard players set $tick cycle20 0
scoreboard players set $tick cycle5 0
scoreboard players set $game signal_done 1
scoreboard players set $game gen_done 1
scoreboard players set $game heli_countdown 0
scoreboard players set Tunable tunable.helicopter_countdown 90

gamemode adventure @s
tag @s add team.human
tag @s remove team.infected
tag @s remove infected.common
tag @s remove infected.mother

bossbar set escape_island:heli visible false
kill @e[tag=entity.helicopter]

tellraw @s {"text":"[Batch 7C] 直升机呼叫测试已准备：信号塔与发电机已设为完成，下一跳应自动进入撤离阶段并呼叫直升机。","color":"gold"}
tellraw @s [{"text":"[重置 7C 测试]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/helicopter_call_setup"}},{"text":" "},{"text":"[快速登机测试]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/helicopter_boarding_setup"}},{"text":" "},{"text":"[查看状态]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:debug/show_state"}}]
