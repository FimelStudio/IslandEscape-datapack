scoreboard players add @s range_wave 1
scoreboard players set @s range_timer 30
title @s actionbar [{"text":"生存挑战 波次 ","color":"red"},{"score":{"name":"@s","objective":"range_wave"}}]
playsound minecraft:block.note_block.bit player @s ~ ~ ~ 0.9 1.4
