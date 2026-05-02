execute if score $ship_part_propeller ship_parts matches 1.. run title @s actionbar {"text":"螺旋桨已经安装过了","color":"yellow"}
execute if score $ship_part_propeller ship_parts matches 1.. run scoreboard players set @s ship_hold_time 0
execute if score $ship_part_propeller ship_parts matches 1.. run return 0
scoreboard players set $ship_part_propeller ship_parts 1
scoreboard players add $game ship_parts 1
clear @s *[custom_data~{item:"ship_part",part:"propeller"}] 1
tellraw @a {"text":"§b[轮船] 螺旋桨已安装。","color":"aqua"}
function escape_island:task/ship_part_submit_common
