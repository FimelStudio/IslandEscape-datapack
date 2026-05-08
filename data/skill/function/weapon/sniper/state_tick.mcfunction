execute if score @s skill.sniper_zoom_flag matches 0 run tag @s remove sniper.zooming
scoreboard players set @s skill.sniper_zoom_flag 0
execute if score @s skill.sniper_cd matches 1.. run scoreboard players remove @s skill.sniper_cd 1
execute if score @s skill.sniper_bolt matches 1.. run scoreboard players remove @s skill.sniper_bolt 1
execute if score @s skill.sniper_bolt matches 0 if entity @s[tag=sniper.bolting] run tag @s remove sniper.bolting
