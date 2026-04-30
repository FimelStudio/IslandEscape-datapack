function escape_island:dev/start

scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 3
scoreboard players set $game phase_timer 0
scoreboard players set $tick cycle20 0
scoreboard players set $tick cycle5 0
scoreboard players set $game signal_done 1
scoreboard players set $game gen_done 1
scoreboard players set $game ship_progress 0
scoreboard players set $game ship_countdown 0
scoreboard players set Tunable tunable.helicopter_countdown 5

gamemode adventure @s
tag @s add team.human
tag @s remove team.infected
tag @s remove infected.common
tag @s remove infected.mother
tag @s remove state.boarding
tag @s remove state.escaped

function escape_island:escape/helicopter_call

tellraw @s {"text":"[Batch 8A] 快速登机测试已准备：直升机约 5 秒后降落，降落后右键“右键登机”提示处。","color":"gold"}
