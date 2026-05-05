execute if entity @a[tag=infected.common,tag=!state.dead,distance=..2.5,limit=1] run title @a[tag=team.human,distance=..2.5] actionbar {"text":"感染者压制中……","color":"red"}
execute if entity @a[tag=infected.common,tag=!state.dead,distance=..2.5,limit=1] run return 0
execute if entity @a[tag=infected.mother,tag=!state.dead,tag=state.mutated,distance=..2.5,limit=1] run title @a[tag=team.human,distance=..2.5] actionbar {"text":"母体压制中……","color":"dark_red"}
execute if entity @a[tag=infected.mother,tag=!state.dead,tag=state.mutated,distance=..2.5,limit=1] run return 0

scoreboard players operation $sig_p signal_progress = @s signal_players

scoreboard players add @s signal_local 1
execute if score $sig_p signal_progress matches 2 if score $tick sig_bonus matches 0..1 run scoreboard players add @s signal_local 1
execute if score $sig_p signal_progress matches 3.. run scoreboard players add @s signal_local 1
execute if score $sig_p signal_progress matches 3 if score $tick sig_bonus matches 0 run scoreboard players add @s signal_local 1
execute if score $sig_p signal_progress matches 4.. if score $tick sig_bonus matches 0..1 run scoreboard players add @s signal_local 1

execute if entity @a[tag=role.engineer,distance=..2.5,limit=1] if score $tick sig_bonus matches 0 run scoreboard players add @s signal_local 1
execute if entity @e[type=minecraft:marker,tag=entity.engineer_battery,distance=..4,limit=1] if score $tick sig_bonus matches 1 run scoreboard players add @s signal_local 1
execute if score $game gen_done matches 1 if score $tick sig_bonus matches 2 run scoreboard players add @s signal_local 1

execute if entity @a[tag=state.infected_period,distance=..2.5,limit=1] if score $tick sig_bonus matches 0..1 run scoreboard players remove @s signal_local 1

scoreboard players operation $signal_show signal_progress = @s signal_local
execute if entity @s[tag=marker.signal_core] run title @a[tag=team.human,distance=..2.5] actionbar [{"text":"修复核心塔中 ","color":"gold"},{"score":{"name":"$signal_show","objective":"signal_progress"}},{"text":"/150","color":"gold"}]
execute unless entity @s[tag=marker.signal_core] run title @a[tag=team.human,distance=..2.5] actionbar [{"text":"修复中 ","color":"yellow"},{"score":{"name":"$signal_show","objective":"signal_progress"}},{"text":"/100","color":"yellow"}]

execute if entity @s[tag=marker.signal_core,scores={signal_local=150..}] run function escape_island:task/signal_tower_complete
execute unless entity @s[tag=marker.signal_core] if score @s signal_local matches 100.. run function escape_island:task/signal_tower_complete
