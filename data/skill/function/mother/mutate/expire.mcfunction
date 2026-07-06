tag @s remove state.hunting
team join survivors @s
function escape_island:visual/mother_hidden
scoreboard players set @s cd_mother_hunt 0
scoreboard players operation @s cd_mother_mutate = Tunable tunable.mutate_cd
effect clear @s minecraft:speed
effect clear @s minecraft:strength
effect clear @s minecraft:resistance
attribute @s minecraft:attack_damage base set 0
function skill:mother/clear_hunt_items
function skill:mother/rotsense/update_item
function skill:mother/howl/update_item
title @s actionbar {"text":"§4猎手脉冲消退，蓄势待发。","color":"dark_red"}
execute at @s run playsound minecraft:block.sculk_sensor.clicking player @s ~ ~ ~ 0.5 0.7
function skill:mother/mutate/update_item
