execute unless score $game ie.rules_saved matches 1 run return 0
execute if score $game ie.prev_regen matches 1 run gamerule natural_health_regeneration true
execute if score $game ie.prev_regen matches 0 run gamerule natural_health_regeneration false
execute if score $game ie.prev_respawn matches 1 run gamerule immediate_respawn true
execute if score $game ie.prev_respawn matches 0 run gamerule immediate_respawn false
scoreboard players set $game ie.rules_saved 0
