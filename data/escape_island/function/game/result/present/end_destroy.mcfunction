# 仅表现；结果与锁已由 result/accept 确定。
tellraw @a {"text":"[v0.2/调试结局] 毁灭岛屿 — 孢子炸弹引爆，岛屿与所有感染体一同沉没。","color":"dark_red"}
function escape_island:util/recount_escaped
execute if score $game escaped_count matches 1.. run tellraw @a [{"text":"说明: v0.2 调试结果。","color":"gold","bold":true},{"score":{"name":"$game","objective":"escaped_count"}},{"text":" 名幸存者带着证据离开，病毒源被摧毁。","color":"gold"}]
execute if score $game escaped_count matches 0 run tellraw @a {"text":"说明: v0.2 调试结果。无人撤离，但病毒源已被摧毁。","color":"yellow"}
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 2 0.5
