execute if score $game ending_triggered matches 1.. run return 0
scoreboard players set $game in_game 0
scoreboard players set $game ending_triggered 1

tellraw @a [{"text":"[ 结局 2 ] ","color":"aqua","bold":true},{"text":"§b轮船撤离§r — 海风号带走了 "},{"score":{"name":"$game","objective":"escaped_count"}},{"text":" 名幸存者。","color":"white"}]

function escape_island:game/settle
