scoreboard players remove @s[scores={cd_mother_rotsense=1..}] cd_mother_rotsense 1

scoreboard players operation @s skill.rotsense_sec = @s cd_mother_rotsense
scoreboard players operation @s skill.rotsense_sec /= $const_20 cd_mother_rotsense

function skill:mother/rotsense/update_item
