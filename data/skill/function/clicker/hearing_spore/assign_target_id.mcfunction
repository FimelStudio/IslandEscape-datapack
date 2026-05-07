# 为人类玩家分配循声孢子追踪用的临时编号。
scoreboard players add #next_target skill.clicker_cfg 1
scoreboard players operation @s skill.clicker_id = #next_target skill.clicker_cfg
