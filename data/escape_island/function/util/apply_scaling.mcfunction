scoreboard players set Tunable tunable.mother_hp 60
scoreboard players set Tunable tunable.mutate_cd 900
scoreboard players set Tunable tunable.rotsense_cd 800
scoreboard players set Tunable tunable.mother_passive_stick_seconds 6
scoreboard players set Tunable tunable.mother_passive_pulse_dmg 10
scoreboard players set Tunable tunable.mother_passive_pulse_seconds 10
scoreboard players set Tunable tunable.infection_seconds 45

# 信号网络 v0.2：全人数共用 5 塔冗余结构，目标 100。
scoreboard players set Tunable tunable.signal_stages 100
scoreboard players set Tunable tunable.signal_global_target 100
scoreboard players set Tunable tunable.signal_edge_progress 25
scoreboard players set Tunable tunable.signal_core_progress 25
# 秒数用 0.1 秒为单位：边塔 20 = 2.0s，核心 15 = 1.5s。
scoreboard players set Tunable tunable.signal_side_tick_seconds 20
scoreboard players set Tunable tunable.signal_core_tick_seconds 15
scoreboard players set Tunable tunable.signal_team_cap_1p 100
scoreboard players set Tunable tunable.signal_team_cap_2p 125
scoreboard players set Tunable tunable.signal_team_cap_3p 140
scoreboard players set Tunable tunable.signal_team_cap_4p 150

execute if score $game player_count matches 4 run scoreboard players set Tunable tunable.infection_seconds 55
execute if score $game player_count matches 4 run scoreboard players set Tunable tunable.mother_hp 70
execute if score $game player_count matches 4 run scoreboard players set Tunable tunable.mutate_cd 600
execute if score $game player_count matches 4 run scoreboard players set Tunable tunable.rotsense_cd 600

execute if score $game player_count matches 5..7 run scoreboard players set Tunable tunable.infection_seconds 50
execute if score $game player_count matches 5..7 run scoreboard players set Tunable tunable.mother_hp 70
execute if score $game player_count matches 5..7 run scoreboard players set Tunable tunable.mutate_cd 600
execute if score $game player_count matches 5..7 run scoreboard players set Tunable tunable.rotsense_cd 600

execute if score $game player_count matches 8..10 run scoreboard players set Tunable tunable.infection_seconds 45

execute if score $game player_count matches 11..12 run scoreboard players set Tunable tunable.infection_seconds 45

execute if score $game player_count matches 13..16 run scoreboard players set Tunable tunable.infection_seconds 40

execute if score $game player_count matches 17.. run scoreboard players set Tunable tunable.infection_seconds 40
