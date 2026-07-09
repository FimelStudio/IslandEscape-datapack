
execute if score $game cur_phase matches 3 run return 0
scoreboard players set $game cur_phase 3

time set midnight

bossbar set escape_island:phase name {"text":"第 3 阶段: 幸存者修信号塔 / 感染者阻止撤离","color":"red"}
tellraw @a {"text":"[第 3 阶段] §c黑夜抢修§r — 幸存者修复信号塔呼叫直升机；感染阵营阻止修塔和撤离。","color":"yellow"}
tellraw @a[tag=team.human] {"text":"[幸存者目标] 找到线缆，结伴修复信号塔；信号上线后立刻去直升机坪。","color":"aqua"}
tellraw @a[tag=team.infected] {"text":"[感染阵营目标] 拦截修塔者，优先感染落单幸存者，不要让他们完成撤离链路。","color":"red"}
playsound minecraft:ambient.cave master @a ~ ~ ~ 1 0.5
tellraw @a {"text":"你注意到海岸边竖着一块铭牌——研究站，地下入口。","color":"gray","italic":true}
execute as @a[tag=role.priest] run tellraw @s {"text":"[神父] 铭牌下方有一行被划掉的文字，字迹很旧，但你认得出这是一个人名。","color":"dark_purple","italic":true}
execute as @a run clear @s *[custom_data~{item:"generator_action"}]
tellraw @a {"text":"[任务] 发电机启动后，靠近发电机会在副手临时出现交互器；对准发电机按住右键维修或破坏。","color":"aqua"}

function escape_island:task/spawn_lab_zombies
