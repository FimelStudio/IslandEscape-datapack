execute if score $game ending_triggered matches 1.. run return 0
scoreboard players set $game in_game 0
scoreboard players set $game ending_triggered 1
scoreboard players set $game escape_result 3

tellraw @a {"text":"[v0.1 胜负] 感染阵营胜利 — 所有幸存者被感染，或病毒倒计时结束。","color":"dark_red","bold":true}
playsound minecraft:entity.wither.death master @a ~ ~ ~ 1 0.6

function escape_island:game/settle
