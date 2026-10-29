# 仅表现；结果与锁已由 result/accept 确定。
execute if score $game escaped_count matches 1.. run tellraw @a [{"text":"[v0.1 胜负] ","color":"green","bold":true},{"text":"幸存者撤离胜利 — 直升机带走了 ","color":"white"},{"score":{"name":"$game","objective":"escaped_count"}},{"text":" 名幸存者。","color":"white"}]
execute if score $game escaped_count matches 0 run tellraw @a {"text":"[v0.1 胜负] 直升机空载离开，本局不计为幸存者撤离胜。","color":"yellow"}
execute if score $game escape_result matches 1 run tellraw @a {"text":"说明: v0.1 判定为幸存者胜利（部分撤离）；完整撤离仅作为表现加分。","color":"yellow"}
execute if score $game escape_result matches 2 run tellraw @a {"text":"说明: v0.1 判定为幸存者胜利（完整撤离）。","color":"green"}
