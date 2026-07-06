title @a title {"text":"游戏结束","color":"gold","bold":true}
title @a subtitle {"text":"查看聊天框结算","color":"gray"}

tellraw @a {"text":"─────────────────────────────","color":"gray"}
tellraw @a {"text":"v0.1 结算","color":"gold","bold":true}

execute if score $game escape_result matches 1 run title @a title {"text":"幸存者撤离胜利","color":"green","bold":true}
execute if score $game escape_result matches 1 run title @a subtitle {"text":"至少一名幸存者成功撤离","color":"yellow"}
execute if score $game escape_result matches 1 run tellraw @a {"text":"胜方: 幸存者阵营 | 原因: 至少一名幸存者通过撤离载具离岛。","color":"green","bold":true}
execute if score $game escape_result matches 1 run tellraw @a [{"text":"撤离人数: ","color":"aqua"},{"score":{"name":"$game","objective":"escaped_count"}},{"text":" | 结果: 部分撤离","color":"yellow"}]

execute if score $game escape_result matches 2 run title @a title {"text":"幸存者撤离胜利","color":"green","bold":true}
execute if score $game escape_result matches 2 run title @a subtitle {"text":"达到完整撤离阈值","color":"green"}
execute if score $game escape_result matches 2 run tellraw @a {"text":"胜方: 幸存者阵营 | 原因: 撤离人数达到本局完整撤离阈值。","color":"green","bold":true}
execute if score $game escape_result matches 2 run tellraw @a [{"text":"撤离人数: ","color":"aqua"},{"score":{"name":"$game","objective":"escaped_count"}},{"text":" | 结果: 完整撤离","color":"green"}]

execute if score $game escape_result matches 3 run title @a title {"text":"感染阵营胜利","color":"dark_red","bold":true}
execute if score $game escape_result matches 3 run title @a subtitle {"text":"所有幸存者被感染或病毒爆发","color":"red"}
execute if score $game escape_result matches 3 run tellraw @a {"text":"胜方: 感染阵营 | 原因: 幸存者全部转化，或时间耗尽触发病毒爆发。","color":"dark_red","bold":true}

execute if score $game escape_result matches 4 run title @a title {"text":"幸存者肃清胜利","color":"green","bold":true}
execute if score $game escape_result matches 4 run title @a subtitle {"text":"母体死亡，感染者被清除","color":"dark_green"}
execute if score $game escape_result matches 4 run tellraw @a {"text":"胜方: 幸存者阵营 | 原因: 母体死亡，场上感染者被肃清。","color":"green","bold":true}

execute if score $game escape_result matches 1..2 if score $game escape_route matches 1 run tellraw @a {"text":"撤离方式: 直升机","color":"gold"}
execute if score $game escape_result matches 1..2 if score $game escape_route matches 2 run tellraw @a {"text":"撤离方式: 轮船（v0.1 可选路线）","color":"aqua"}
execute if score $game escape_result matches 1..2 if score $game escape_route matches 3 run tellraw @a {"text":"撤离方式: 潜艇（v0.2/调试路线）","color":"dark_purple"}

execute if score $game escape_result matches 0 run tellraw @a {"text":"[v0.1 结算] 本局触发了非主线或调试结局，不计入 v0.1 平衡验收。","color":"gray"}
