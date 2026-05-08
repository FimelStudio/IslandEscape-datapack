execute if score @s cd_mother_rotsense matches 1.. run scoreboard players remove @s cd_mother_rotsense 1

scoreboard players operation @s skill.rotsense_sec = @s cd_mother_rotsense
scoreboard players operation @s skill.rotsense_sec /= $const_20 cd_mother_rotsense

function skill:mother/rotsense/update_item
