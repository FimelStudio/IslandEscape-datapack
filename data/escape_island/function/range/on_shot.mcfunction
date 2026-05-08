scoreboard players add @s range_shots 1
execute if score #hit skill.pistol_tmp matches 0 run scoreboard players set @s range_combo 0
execute if score #hit skill.pistol_tmp matches 0 if score @s range_mode matches 3 run scoreboard players remove @s range_lives 1
execute if score #hit skill.pistol_tmp matches 0 if score @s range_mode matches 3 run title @s actionbar [{"text":"未命中！剩余生命 ","color":"red"},{"score":{"name":"@s","objective":"range_lives"}}]
execute if score @s range_mode matches 1 run scoreboard players remove @s range_timer 1
execute if score @s range_mode matches 1 if score @s range_timer matches ..0 run function escape_island:range/finish
execute if score @s range_mode matches 3 if score @s range_lives matches ..0 run function escape_island:range/finish
