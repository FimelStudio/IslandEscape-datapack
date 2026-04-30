function escape_island:test/signal_tower_setup
tag @s add state.infected_period
tellraw @s {"text":"[Batch 7A] 感染期减速测试：接线速度应约为普通的一半。","color":"red"}
