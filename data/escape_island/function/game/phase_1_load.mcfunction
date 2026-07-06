
gamerule pvp true

tag @a add team.human

function escape_island:role/assign
execute as @a[tag=team.human] run function escape_island:talent/auto_assign

execute as @a run function escape_island:role/give_kit

function escape_island:util/spawn_scatter

function escape_island:ui/tellraw_phase
function escape_island:ui/show_v01_goals

bossbar set escape_island:phase visible true
bossbar set escape_island:phase players @a
bossbar set escape_island:phase name {"text":"v0.1 主线: 找物资 -> 修信号塔 -> 直升机撤离","color":"yellow"}

tellraw @a {"text":"[第 1 阶段] §e黄昏登岛§r — 探索岛屿，寻找物资；夜晚优先修复信号塔。2 分钟后觉醒。","color":"yellow"}
