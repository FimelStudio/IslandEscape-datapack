
execute unless items entity @s weapon.mainhand minecraft:string[minecraft:custom_data~{item:"cable"}] run return 0

execute if score $game cur_phase matches ..2 run tellraw @s {"text":"§c信号塔还没通电。等到夜晚开始再修复。","color":"red"}
execute if score $game cur_phase matches ..2 run return 0

scoreboard players add $game signal_progress 1

playsound minecraft:block.anvil.use master @a[distance=..15] ~ ~ ~ 1 1

execute if score $game signal_progress matches 5.. run function escape_island:task/_signal_complete
