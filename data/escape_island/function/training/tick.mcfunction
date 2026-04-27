scoreboard players add $training cycle20 1
execute if score $training cycle20 matches 20.. run scoreboard players set $training cycle20 0
execute if score $training cycle20 matches 0 run function escape_island:training/_tick_20

scoreboard players add $training cycle5 1
execute if score $training cycle5 matches 5.. run scoreboard players set $training cycle5 0
execute if score $training cycle5 matches 0 run function escape_island:ui/update_actionbar
