team join mother_hidden @s
tag @s remove state.mutated
scoreboard players set @s cd_mother_hunt 0
scoreboard players operation @s cd_mother_mutate = Tunable tunable.mutate_cd
execute if score @s mother_phase matches 3.. run scoreboard players set @s cd_mother_mutate 700
effect clear @s minecraft:speed
effect clear @s minecraft:strength
effect clear @s minecraft:resistance
function skill:mother/clear_hunt_items
title @s actionbar {"text":"§8猎手脉冲消退，伪装恢复。","color":"dark_gray"}
execute at @s run playsound minecraft:block.sculk_sensor.clicking player @s ~ ~ ~ 0.5 0.7
function skill:mother/mutate/update_item
