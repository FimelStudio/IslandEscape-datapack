execute if score $ship_part_fuel_pump ship_parts matches 1.. run title @s actionbar {"text":"燃油泵已经安装过了","color":"yellow"}
execute if score $ship_part_fuel_pump ship_parts matches 1.. run scoreboard players set @s ship_hold_time 0
execute if score $ship_part_fuel_pump ship_parts matches 1.. run return 0
scoreboard players set $ship_part_fuel_pump ship_parts 1
scoreboard players add $game ship_parts 1
clear @s *[custom_data~{item:"ship_part",part:"fuel_pump"}] 1
tellraw @a {"text":"§b[轮船] 燃油泵已安装。","color":"aqua"}
function escape_island:task/ship_part_submit_common
