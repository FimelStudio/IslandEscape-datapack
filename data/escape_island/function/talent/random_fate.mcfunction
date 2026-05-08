scoreboard players random @s talent_fate 1 4
tag @s remove talent.fate.cabin_memory
tag @s remove talent.fate.radio_echo
tag @s remove talent.fate.cold_room
tag @s remove talent.fate.old_wound
execute if score @s talent_fate matches 1 run tag @s add talent.fate.cabin_memory
execute if score @s talent_fate matches 2 run tag @s add talent.fate.radio_echo
execute if score @s talent_fate matches 3 run tag @s add talent.fate.cold_room
execute if score @s talent_fate matches 4 run tag @s add talent.fate.old_wound
function escape_island:talent/show
