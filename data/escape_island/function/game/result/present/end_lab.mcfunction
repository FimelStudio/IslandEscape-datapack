# 仅表现；结果与锁已由 result/accept 确定。
tellraw @a [{"text":"[v0.2/调试撤离] ","color":"dark_purple","bold":true},{"text":"潜艇带走了 "},{"score":{"name":"$game","objective":"escaped_count"}},{"text":" 名持有通行证的人。","color":"white"}]
execute if score $game escape_result matches 1 run tellraw @a {"text":"说明: 潜艇不计入 v0.1 主线平衡验收。","color":"gray"}
execute if score $game escape_result matches 2 run tellraw @a {"text":"说明: 潜艇不计入 v0.1 主线平衡验收。","color":"gray"}
