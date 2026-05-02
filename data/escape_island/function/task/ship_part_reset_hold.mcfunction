execute if score @s ship_hold_time matches 1.. run title @s actionbar {"text":"船舶部件投入中断","color":"red"}
scoreboard players set @s ship_hold_time 0
