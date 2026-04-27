# escape_island:game/phase_5_mutate  —  15:00 timeout, force-infect remaining survivors

execute if score $game cur_phase matches 5 run return 0
scoreboard players set $game cur_phase 5

tellraw @a {"text":"[第 5 阶段] §4§l孢子升腾§r — 岛屿孢子浓度临界！所有未撤离者进入感染期。","color":"dark_red"}
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 0.6

# Force all active survivors into infection period
execute as @a[tag=role.survivor,tag=!state.escaped,tag=!state.spectator] run function escape_island:infection/force_infect

# Trigger mutate ending check after 60s (handled in tick via phase_timer check)
