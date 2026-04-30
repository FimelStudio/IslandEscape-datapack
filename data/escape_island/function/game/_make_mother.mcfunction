
tag @s remove team.human
tag @s add team.infected
tag @s add infected.mother
scoreboard players set @s role 11
scoreboard players set @s is_mother 1
team join mother_hidden @s

attribute @s minecraft:max_health base set 60
effect give @s minecraft:instant_health 1 10 true
effect give @s minecraft:saturation 1 20 true
attribute @s minecraft:armor base set 4
attribute @s minecraft:armor_toughness base set 2
attribute @s minecraft:knockback_resistance base set 0.8
attribute @s minecraft:attack_damage base set 6
attribute @s minecraft:movement_speed base set 0.105

scoreboard players set @s mother_hp 60
scoreboard players set @s mother_last_hp 60
scoreboard players set @s mother_regen_cd 5
scoreboard players operation @s used_firework_last = @s used_firework

function escape_island:role/kit_mother

tellraw @s [{"text":"[ 母体觉醒 ]\n","bold":true,"color":"dark_red"},{"text":"你被柯尔文咬伤了。你的身体正在改变。\n任务: 感染所有幸存者，或让岛屿沉没。","color":"red"}]
title @s title {"text":"§4§l母体"}
title @s subtitle {"text":"§c感染。扩散。胜利。"}
