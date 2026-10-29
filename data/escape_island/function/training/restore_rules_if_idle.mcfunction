# 最后一名在线训练玩家退出后释放世界规则；清理会先移除训练标记。
execute unless score $training ie.rules_saved matches 1 run return 0
execute if entity @a[tag=state.training] run return 0
execute if score $training ie.prev_respawn matches 1 run gamerule immediate_respawn true
execute if score $training ie.prev_respawn matches 0 run gamerule immediate_respawn false
scoreboard players set $training ie.rules_saved 0
