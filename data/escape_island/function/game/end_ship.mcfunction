execute if score $game ending_triggered matches 1.. run return 0
scoreboard players set $game in_game 0
scoreboard players set $game ending_triggered 1

tellraw @a [{"text":"[v0.1 可选撤离] ","color":"aqua","bold":true},{"text":"幸存者撤离胜利 — 轮船带走了 "},{"score":{"name":"$game","objective":"escaped_count"}},{"text":" 名幸存者。","color":"white"}]
execute if score $game escape_result matches 1 run tellraw @a {"text":"说明: v0.1 判定为幸存者胜利（部分撤离）；轮船路线仅作可选测试。","color":"yellow"}
execute if score $game escape_result matches 2 run tellraw @a {"text":"说明: v0.1 判定为幸存者胜利（完整撤离）；轮船路线仅作可选测试。","color":"green"}

function escape_island:game/settle
