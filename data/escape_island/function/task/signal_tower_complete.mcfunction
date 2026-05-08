tag @s add marker.signal_done
clear @a[tag=team.human,distance=..2.5,sort=nearest,limit=1] minecraft:string[minecraft:custom_data~{item:"cable"}] 1
execute if entity @s[tag=marker.signal_core] run scoreboard players operation $game signal_progress += Tunable tunable.signal_core_progress
execute at @s as @a[tag=team.human,tag=!state.dead,distance=..3] run scoreboard players add @s match_repair 10
execute at @s as @a[tag=team.human,tag=!state.dead,distance=..3] run scoreboard players add @s match_objective 20
execute unless entity @s[tag=marker.signal_core] run scoreboard players operation $game signal_progress += Tunable tunable.signal_edge_progress
execute if score $game signal_progress > Tunable tunable.signal_global_target run scoreboard players operation $game signal_progress = Tunable tunable.signal_global_target

tellraw @a [{"text":"[信号塔] 一座信号塔上线！网络进度: ","color":"green"},{"score":{"name":"$game","objective":"signal_progress"}},{"text":"/","color":"green"},{"score":{"name":"Tunable","objective":"tunable.signal_global_target"},"color":"green"}]
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1 0.8
execute at @s run particle minecraft:end_rod ~ ~3 ~ 0.5 0.5 0.5 0.05 40 force @a

execute if score $game signal_progress >= Tunable tunable.signal_global_target run function escape_island:task/_signal_network_done
