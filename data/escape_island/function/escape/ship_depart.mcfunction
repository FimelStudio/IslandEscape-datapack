execute if score $game cur_phase matches 4 run return 0

scoreboard players set $game cur_phase 4
scoreboard players set $game ship_countdown 30
bossbar set escape_island:signal visible false
bossbar set escape_island:gen visible false
bossbar set escape_island:heli visible false
bossbar set escape_island:sub visible false
bossbar set escape_island:ship name {"text":"轮船登船窗口","color":"aqua"}
bossbar set escape_island:ship visible true
bossbar set escape_island:ship players @a
bossbar set escape_island:ship max 30
bossbar set escape_island:ship value 30

tellraw @a {"text":"§b[轮船] 修复完成！30 秒后离港。快上船！","color":"aqua"}
playsound minecraft:block.bell.use master @a ~ ~ ~ 1 0.5

function escape_island:escape/ship_spawn_door
