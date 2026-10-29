# 仅表现；结果与锁已由 result/accept 确定。
tellraw @a {"text":"[v0.1 胜负] 感染阵营胜利 — 所有幸存者被感染，或病毒倒计时结束。","color":"dark_red","bold":true}
playsound minecraft:entity.wither.death master @a ~ ~ ~ 1 0.6
