execute if score $game cur_phase matches 4 run return 0

scoreboard players set $game cur_phase 4
scoreboard players operation $game ship_countdown = Tunable tunable.ship_boarding_seconds
bossbar set escape_island:signal visible false
bossbar set escape_island:gen visible false
bossbar set escape_island:heli visible false
bossbar set escape_island:sub visible false
bossbar set escape_island:ship name {"text":"轮船登船窗口","color":"aqua"}
bossbar set escape_island:ship visible true
bossbar set escape_island:ship players @a
execute store result bossbar escape_island:ship max run scoreboard players get $game ship_countdown
execute store result bossbar escape_island:ship value run scoreboard players get $game ship_countdown

tellraw @a [{"text":"§b[轮船] 修复完成！","color":"aqua"},{"score":{"name":"$game","objective":"ship_countdown"}},{"text":" 秒后离港。快上船！","color":"aqua"}]
playsound minecraft:block.bell.use master @a ~ ~ ~ 1 0.5

function escape_island:escape/ship_spawn_door
