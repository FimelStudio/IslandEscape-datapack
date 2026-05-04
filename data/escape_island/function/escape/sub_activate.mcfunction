advancement revoke @s only escape_island:interaction/sub_activate

execute unless score $game in_game matches 1 run tellraw @s {"text":"游戏未开始","color":"red"}
execute unless score $game in_game matches 1 run return 0

execute if score $game sub_countdown matches 1.. run tellraw @s {"text":"潜艇已启动","color":"red"}
execute if score $game sub_countdown matches 1.. run return 0

execute unless entity @e[type=minecraft:marker,tag=marker.lab_sub,distance=..3,limit=1] run tellraw @s {"text":"离潜艇太远","color":"red"}
execute unless entity @e[type=minecraft:marker,tag=marker.lab_sub,distance=..3,limit=1] run return 0

function escape_island:escape/submarine_depart
