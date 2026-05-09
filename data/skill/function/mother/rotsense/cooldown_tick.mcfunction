execute if score @s cd_mother_rotsense matches 1.. run scoreboard players remove @s cd_mother_rotsense 1

scoreboard players operation @s skill.rotsense_sec = @s cd_mother_rotsense
scoreboard players operation @s skill.rotsense_sec /= $const_20 cd_mother_rotsense

execute if score @s cd_mother_rotsense matches 1.. unless score @s skill.rotsense_sec = @s skill.rotsense_last run function skill:mother/rotsense/update_item
execute unless score @s cd_mother_rotsense matches 1.. unless score @s skill.rotsense_last matches -1 run function skill:mother/rotsense/update_item
function skill:mother/rotsense/ensure_item
