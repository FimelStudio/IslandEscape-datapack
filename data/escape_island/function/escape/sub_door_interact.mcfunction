advancement revoke @s only escape_island:interaction/sub_door_interact

execute if entity @s[tag=team.infected] run tellraw @s {"text":"§7感染者无法登艇","color":"red"}
execute if entity @s[tag=team.infected] run return 0

execute if score $game sub_countdown matches ..0 run tellraw @s {"text":"潜艇已离开","color":"red"}
execute if score $game sub_countdown matches ..0 run return 0

function escape_island:escape/board_sub
