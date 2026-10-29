# 仅表现；结果与锁已由 result/accept 确定。
tellraw @a [{"text":"[v0.1 可选撤离] ","color":"aqua","bold":true},{"text":"幸存者撤离胜利 — 轮船带走了 "},{"score":{"name":"$game","objective":"escaped_count"}},{"text":" 名幸存者。","color":"white"}]
execute if score $game escape_result matches 1 run tellraw @a {"text":"说明: v0.1 判定为幸存者胜利（部分撤离）；轮船路线仅作可选测试。","color":"yellow"}
execute if score $game escape_result matches 2 run tellraw @a {"text":"说明: v0.1 判定为幸存者胜利（完整撤离）；轮船路线仅作可选测试。","color":"green"}
