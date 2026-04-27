# escape_island:task/generator_use  —  insert fuel cell into generator
# Context: @s = player

execute unless items entity @s weapon.mainhand minecraft:redstone[minecraft:custom_data~{item:"fuel_cell"}] run return 0

scoreboard players add $game gen_progress 1
tellraw @s {"text":"§6燃料电池已投入发电机。","color":"gold"}

execute if score $game gen_progress matches 3.. run function escape_island:task/_generator_start
