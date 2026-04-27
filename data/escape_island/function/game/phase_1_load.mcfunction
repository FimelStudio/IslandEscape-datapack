# escape_island:game/phase_1_load  —  Phase 1 setup (黄昏登岛, PvP off)

# Phase 1: PvP off (enabled again at Phase 2)
gamerule pvp false

# Tag and kit all players as survivors
tag @a add role.survivor

# Assign roles
function escape_island:role/assign

# Give kits via give_kit dispatcher
execute as @a run function escape_island:role/give_kit

# Teleport each player to a unique spawn_island marker
function escape_island:util/spawn_scatter

# Announce Phase 1
function escape_island:ui/tellraw_phase

# Show phase bossbar
bossbar set escape_island:phase visible true
bossbar set escape_island:phase players @a

tellraw @a {"text":"[第 1 阶段] §e黄昏登岛§r — 探索岛屿，寻找物资。2 分钟后觉醒。","color":"yellow"}
