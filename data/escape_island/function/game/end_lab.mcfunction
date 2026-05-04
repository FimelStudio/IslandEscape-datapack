execute if score $game ending_triggered matches 1.. run return 0
scoreboard players set $game in_game 0
scoreboard players set $game ending_triggered 1

tellraw @a [{"text":"[ 结局 3 ] ","color":"dark_purple","bold":true},{"text":"§5实验室撤离§r — 潜艇带走了 "},{"score":{"name":"$game","objective":"escaped_count"}},{"text":" 名持有通行证的人。","color":"white"}]

function escape_island:game/settle
