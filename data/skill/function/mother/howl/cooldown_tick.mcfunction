execute if score @s cd_mother_howl matches 1.. run scoreboard players remove @s cd_mother_howl 1

scoreboard players operation @s skill.howl_sec = @s cd_mother_howl
scoreboard players operation @s skill.howl_sec /= $const_20 cd_mother_rotsense

function skill:mother/howl/update_item
