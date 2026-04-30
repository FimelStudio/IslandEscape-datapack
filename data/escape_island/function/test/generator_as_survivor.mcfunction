tag @s add team.human
tag @s remove team.infected
tag @s remove infected.common
tag @s remove infected.mother
clear @s *[custom_data~{item:"generator_action"}]
tellraw @s {"text":"[Batch 7B] 已切回幸存者：靠近发电机，副手为空会临时出现交互器；对准发电机按住右键可维修。","color":"green"}
tellraw @s [{"text":"[模拟感染者破坏]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/generator_as_infected"}}]
