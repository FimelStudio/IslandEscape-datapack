# 多名训练玩家共用一次世界规则快照；重复进入不会覆盖原值。
execute if score $training ie.rules_saved matches 1 run return 0
execute store result score $training ie.prev_respawn run gamerule immediate_respawn
scoreboard players set $training ie.rules_saved 1
gamerule immediate_respawn true
