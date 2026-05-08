tag @s remove state.hunting
scoreboard players set @s cd_mother_hunt 0
scoreboard players operation @s cd_mother_mutate = Tunable tunable.mutate_cd
execute if score @s mother_phase matches 3.. run scoreboard players set @s cd_mother_mutate 700
effect clear @s minecraft:speed
effect clear @s minecraft:strength
effect clear @s minecraft:resistance
function skill:mother/clear_hunt_items
title @s actionbar {"text":"§4猎手脉冲消退，蓄势待发。","color":"dark_red"}
execute at @s run playsound minecraft:block.sculk_sensor.clicking player @s ~ ~ ~ 0.5 0.7
function skill:mother/mutate/update_item
