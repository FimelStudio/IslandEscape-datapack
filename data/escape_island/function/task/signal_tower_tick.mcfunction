execute if score $game cur_phase matches 4.. run bossbar set escape_island:signal visible false
execute if score $game cur_phase matches 4.. run return 0

scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower] signal_players 0
execute as @a[tag=team.human,tag=!state.dead] at @s if entity @e[type=minecraft:marker,tag=marker.signal_tower,tag=!marker.signal_done,distance=..2.5,limit=1] if items entity @s weapon.mainhand minecraft:string[minecraft:custom_data~{item:"cable"}] run scoreboard players add @e[type=minecraft:marker,tag=marker.signal_tower,tag=!marker.signal_done,distance=..2.5,sort=nearest,limit=1] signal_players 1
scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower,tag=!marker.signal_done,scores={signal_players=0}] signal_repair_acc 0

execute as @e[type=minecraft:marker,tag=marker.signal_tower,tag=!marker.signal_done,scores={signal_players=1..}] at @s run function escape_island:task/signal_tower_repair_tick

execute if score $game signal_progress > Tunable tunable.signal_global_target run scoreboard players operation $game signal_progress = Tunable tunable.signal_global_target
execute if score $game signal_progress matches 1.. run bossbar set escape_island:signal visible true
execute if score $game signal_done matches 1.. run bossbar set escape_island:signal visible true
execute if score $game signal_progress matches 1.. run bossbar set escape_island:signal players @a
execute if score $game signal_done matches 1.. run bossbar set escape_island:signal players @a
execute store result bossbar escape_island:signal max run scoreboard players get Tunable tunable.signal_global_target
execute store result bossbar escape_island:signal value run scoreboard players get $game signal_progress
