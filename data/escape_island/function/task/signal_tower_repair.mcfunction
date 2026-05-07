advancement revoke @s only escape_island:interaction/repair_signal
scoreboard players set @s signal_repair_time 0
scoreboard players set @s signal_repair_seen 0

execute unless score $game in_game matches 1 run tellraw @s {"text":"§c游戏还未开始，无法接入线缆。","color":"red"}
execute unless score $game in_game matches 1 run return 0

execute if score $game signal_done matches 1.. run tellraw @s {"text":"§a信号塔已经修复完成。","color":"green"}
execute if score $game signal_done matches 1.. run return 0

execute if score $game cur_phase matches ..2 run tellraw @s {"text":"§c信号塔还没通电。等到夜晚开始再修复。","color":"red"}
execute if score $game cur_phase matches ..2 run return 0

execute unless entity @e[type=minecraft:marker,tag=marker.signal_tower,distance=..2.5,limit=1] run tellraw @s {"text":"§c需要站在信号塔维修面板旁完成接线。","color":"red"}
execute unless entity @e[type=minecraft:marker,tag=marker.signal_tower,distance=..2.5,limit=1] run return 0
execute unless items entity @s weapon.mainhand minecraft:string[minecraft:custom_data~{item:"cable"}] run tellraw @s {"text":"§c需要手持线缆。","color":"red"}
execute unless items entity @s weapon.mainhand minecraft:string[minecraft:custom_data~{item:"cable"}] run return 0

clear @s minecraft:string[minecraft:custom_data~{item:"cable"}] 1
scoreboard players add $game signal_progress 1
scoreboard players operation $signal_remaining signal_progress = $game signal_progress
scoreboard players operation $signal_remaining signal_progress -= Tunable tunable.signal_global_target

tellraw @a [{"text":"§a[信号塔] 接线进度 ","color":"green"},{"score":{"name":"$game","objective":"signal_progress"}},{"text":"/","color":"green"},{"score":{"name":"Tunable","objective":"tunable.signal_global_target"}}]
execute at @s run playsound minecraft:block.anvil.use master @a[distance=..15] ~ ~ ~ 1 1
execute at @e[type=minecraft:marker,tag=marker.signal_tower,sort=nearest,limit=1] run particle minecraft:electric_spark ~ ~1 ~ 0.35 0.35 0.35 0.02 16 force

execute if score $signal_remaining signal_progress matches 0.. run function escape_island:task/_signal_complete
