scoreboard players add $gunfight cycle20 1
execute if score $gunfight cycle20 matches 20.. run scoreboard players set $gunfight cycle20 0
execute if score $gunfight cycle20 matches 0 run function escape_island:gunfight/combat_tick
execute if score $gunfight cycle20 matches 0 if score $game gs_active matches 1 run function escape_island:gunfight/supply_tick
