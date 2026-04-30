function escape_island:test/signal_tower_setup
tag @s add team.human
tag @s remove team.infected
tag @s add state.infected_period
scoreboard players set @s infect_time 30
tellraw @s {"text":"[Batch 7A] 感染期减速测试：接线速度应约为普通的一半。","color":"red"}
