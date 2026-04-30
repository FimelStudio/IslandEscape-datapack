tag @s add team.infected
tag @s add infected.common
tag @s remove team.human
tag @s remove infected.mother
clear @s *[custom_data~{item:"generator_action"}]
tellraw @s {"text":"[Batch 7B] 已切为感染者破坏模拟：靠近运行中的发电机，副手为空会临时出现交互器；对准发电机按住右键破坏。","color":"red"}
tellraw @s [{"text":"[切回幸存者维修]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/generator_as_survivor"}}]
