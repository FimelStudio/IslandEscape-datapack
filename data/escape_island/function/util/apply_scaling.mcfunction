scoreboard players set Tunable tunable.mother_hp 60
scoreboard players set Tunable tunable.mutate_cd 900
scoreboard players set Tunable tunable.rotsense_cd 800

execute if score $game player_count matches 4 run scoreboard players set Tunable tunable.infection_seconds 55
execute if score $game player_count matches 4 run scoreboard players set Tunable tunable.signal_stages 3
execute if score $game player_count matches 4 run scoreboard players set Tunable tunable.mother_hp 70
execute if score $game player_count matches 4 run scoreboard players set Tunable tunable.mutate_cd 600
execute if score $game player_count matches 4 run scoreboard players set Tunable tunable.rotsense_cd 600

execute if score $game player_count matches 5..7 run scoreboard players set Tunable tunable.infection_seconds 50
execute if score $game player_count matches 5..7 run scoreboard players set Tunable tunable.signal_stages 4
execute if score $game player_count matches 5..7 run scoreboard players set Tunable tunable.mother_hp 70
execute if score $game player_count matches 5..7 run scoreboard players set Tunable tunable.mutate_cd 600
execute if score $game player_count matches 5..7 run scoreboard players set Tunable tunable.rotsense_cd 600

execute if score $game player_count matches 8..10 run scoreboard players set Tunable tunable.infection_seconds 45
execute if score $game player_count matches 8..10 run scoreboard players set Tunable tunable.signal_stages 5

execute if score $game player_count matches 11..12 run scoreboard players set Tunable tunable.infection_seconds 45
execute if score $game player_count matches 11..12 run scoreboard players set Tunable tunable.signal_stages 5

execute if score $game player_count matches 13..16 run scoreboard players set Tunable tunable.infection_seconds 40
execute if score $game player_count matches 13..16 run scoreboard players set Tunable tunable.signal_stages 6

execute if score $game player_count matches 17.. run scoreboard players set Tunable tunable.infection_seconds 40
execute if score $game player_count matches 17.. run scoreboard players set Tunable tunable.signal_stages 7
