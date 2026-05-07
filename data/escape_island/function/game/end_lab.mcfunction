execute if score $game ending_triggered matches 1.. run return 0
scoreboard players set $game in_game 0
scoreboard players set $game ending_triggered 1

tellraw @a [{"text":"[ 结局 3 ] ","color":"dark_purple","bold":true},{"text":"§5实验室撤离§r — 潜艇带走了 "},{"score":{"name":"$game","objective":"escaped_count"}},{"text":" 名持有通行证的人。","color":"white"}]
execute if score $game escape_result matches 1 run tellraw @a {"text":"§e结果：惨胜 / 部分撤离。潜艇保存了关键证据，但撤离人数未达到完整胜利阈值。","color":"yellow"}
execute if score $game escape_result matches 2 run tellraw @a {"text":"§a结果：完整幸存者胜利。撤离人数达到本局完整胜利阈值。","color":"green"}

function escape_island:game/settle
