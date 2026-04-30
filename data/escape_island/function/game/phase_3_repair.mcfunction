
execute if score $game cur_phase matches 3 run return 0
scoreboard players set $game cur_phase 3

time set midnight

tellraw @a {"text":"[第 3 阶段] §c黑夜抢修§r — 修复信号塔和发电机，呼叫撤离。","color":"yellow"}
playsound minecraft:ambient.cave master @a ~ ~ ~ 1 0.5
tellraw @a {"text":"你注意到海岸边竖着一块铭牌——研究站，地下入口。","color":"gray","italic":true}
execute as @a[tag=role.priest] run tellraw @s {"text":"[神父] 铭牌下方有一行被划掉的文字，字迹很旧，但你认得出这是一个人名。","color":"dark_purple","italic":true}
execute as @a run clear @s *[custom_data~{item:"generator_action"}]
tellraw @a {"text":"[任务] 发电机启动后，靠近发电机会在副手临时出现交互器；对准发电机按住右键维修或破坏。","color":"aqua"}

execute at @e[tag=marker.mob_lab_researcher] run summon minecraft:zombie ~ ~ ~ {Tags:["entity.researcher"],CustomName:{"text":"感染研究员","color":"red"},Health:30.0f,Attributes:[{Name:"generic.max_health",Base:30.0},{Name:"generic.attack_damage",Base:5.0}],PersistenceRequired:1b}
