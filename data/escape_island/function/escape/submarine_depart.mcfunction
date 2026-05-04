scoreboard players set $game sub_countdown 45
bossbar set escape_island:sub visible true
bossbar set escape_island:sub players @a
bossbar set escape_island:sub max 45
bossbar set escape_island:sub value 45
bossbar set escape_island:sub name {"text":"潜艇倒计时","color":"dark_purple"}

tellraw @a {"text":"§5[实验室] 潜艇已启动！45 秒后离开。靠近潜艇右键登艇。","color":"dark_purple"}
playsound minecraft:entity.warden.sonic_boom master @a ~ ~ ~ 1 0.5

execute at @e[tag=marker.lab_sub,limit=1] run function escape_island:escape/sub_spawn_door
function escape_island:game/phase_4_escape
