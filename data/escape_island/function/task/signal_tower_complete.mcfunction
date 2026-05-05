tag @s add marker.signal_done
clear @a[tag=team.human,distance=..2.5,sort=nearest,limit=1] minecraft:string[minecraft:custom_data~{item:"cable"}] 1
scoreboard players add $game signal_progress 25
execute if entity @s[tag=marker.signal_core] run scoreboard players add $game signal_progress 25

tellraw @a [{"text":"[信号塔] 一座信号塔上线！网络进度: ","color":"green"},{"score":{"name":"$game","objective":"signal_progress"}},{"text":"/100","color":"green"}]
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1 0.8
execute at @s run particle minecraft:end_rod ~ ~3 ~ 0.5 0.5 0.5 0.05 40 force @a

execute if score $game signal_progress matches 100.. run function escape_island:task/_signal_network_done
