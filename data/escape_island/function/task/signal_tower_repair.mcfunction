# escape_island:task/signal_tower_repair  —  called when player starts repairing signal tower
# Context: @s = repairing player, at signal_tower marker

# Require cable in hand
execute unless items entity @s weapon.mainhand minecraft:string[minecraft:custom_data~{item:"cable"}] run return 0

# Require phase 3+
execute if score $game cur_phase matches ..2 run tellraw @s {"text":"§c信号塔还没通电。等到夜晚开始再修复。","color":"red"}
execute if score $game cur_phase matches ..2 run return 0

# Increment progress (1 per 5-second hold, checked by advancement)
scoreboard players add $game signal_progress 1

# Play repair sound
playsound minecraft:block.anvil.use master @a[distance=..15] ~ ~ ~ 1 1

# Check completion
execute if score $game signal_progress matches 5.. run function escape_island:task/_signal_complete
