execute if score $game ending_triggered matches 1.. run return 0
scoreboard players set $game in_game 0
scoreboard players set $game ending_triggered 1

execute if score $game escaped_count matches 1.. run tellraw @a [{"text":"[ 结局 1 ] ","color":"gold","bold":true},{"text":"§a直升机撤离§r — ","color":"white"},{"score":{"name":"$game","objective":"escaped_count"}},{"text":" 名幸存者逃出了海岛。","color":"white"}]
execute if score $game escaped_count matches 0 run tellraw @a {"text":"[ 结局 1 ] §6直升机撤离§r — 直升机空载飞走了。","color":"white"}

function escape_island:game/settle
