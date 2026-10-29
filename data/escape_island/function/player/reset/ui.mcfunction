# 自动生成：tools/state_contract.json；请通过 python tools/generate_state.py 更新。
# 执行者 @s 是待重置玩家；只清理本模块拥有的临时状态。
tag @s remove mvp.global
tag @s remove mvp.infected
tag @s remove mvp.survivor
scoreboard players reset @s ie.dialog
scoreboard players reset @s ie.eat_health
