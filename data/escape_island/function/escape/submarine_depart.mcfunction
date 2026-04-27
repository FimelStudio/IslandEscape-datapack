# Submarine available after lab terminal activated — 45s window
scoreboard players set $game sub_countdown 900
bossbar set escape_island:sub visible true
bossbar set escape_island:sub players @a
bossbar set escape_island:sub max 900

tellraw @a {"text":"§5[实验室] 潜艇已启动！45 秒后离开。","color":"dark_purple"}
function escape_island:game/phase_4_escape

schedule function escape_island:escape/_sub_go 900t
