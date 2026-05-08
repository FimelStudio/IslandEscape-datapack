function escape_island:range/cleanup
tag @s add range.active
scoreboard players set @s range_score 0
scoreboard players set @s range_combo 0
scoreboard players set @s range_timer 0
scoreboard players set @s range_lives 3
gamemode adventure @s
clear @s
function skill:weapon/pistol/give
give @s minecraft:iron_nugget[minecraft:custom_data={ammo:1},minecraft:item_name={text:"9mm 弹药",italic:false,color:"gray"}] 64
execute at @e[type=minecraft:marker,tag=marker.range_spawn,limit=1] run tp @s ~ ~ ~
function escape_island:range/reset
tellraw @s {"text":"[训练场] 已进入。靶标已生成，使用 M-7 命中靶标计分。","color":"green"}
