execute if entity @a[tag=range.active] run return 0
execute if score $game gs_active matches 1 run return 0
execute if score $game in_game matches 1 run return 0
execute if score $game ie.mode matches 4 run return 0
function escape_island:range/cleanup
function escape_island:player/reset
tag @s add ie.active
scoreboard players operation @s ie.session = $game ie.match_id
tag @s add range.active
scoreboard players set @s range_score 0
scoreboard players set @s range_combo 0
scoreboard players set @s range_timer 0
scoreboard players set @s range_lives 3
scoreboard players set @s range_shots 0
scoreboard players set @s range_hits 0
scoreboard players set @s range_seq 1
scoreboard players set @s range_wave 1
scoreboard players set @s range_mode 0
gamemode adventure @s
clear @s
function skill:weapon/pistol/give
give @s minecraft:iron_nugget[minecraft:custom_data={ammo:1},minecraft:item_name={text:"9mm 弹药",italic:false,color:"gray"}] 64
execute at @e[type=minecraft:marker,tag=marker.range_spawn,limit=1] run tp @s ~ ~ ~
function escape_island:range/spawn_targets
tellraw @s {"text":"[训练场] 已进入。靶标已生成，所有武器均可命中玩家靶。输入指令选择挑战模式开始训练。","color":"green"}
