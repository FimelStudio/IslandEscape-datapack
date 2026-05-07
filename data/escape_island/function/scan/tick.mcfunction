scoreboard players set $scan_readers scan_result 0
execute as @a[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,distance=..3] run scoreboard players add $scan_readers scan_result 1

execute if score $scan_readers scan_result matches ..1 run function escape_island:scan/cancel
execute if score @s scan_active matches ..0 run return 0

bossbar set escape_island:scan visible true
bossbar set escape_island:scan players @a[tag=team.human,tag=!state.dead,distance=..12]
bossbar set escape_island:scan max 120
execute store result bossbar escape_island:scan value run scoreboard players get @s scan_time

scoreboard players operation $scan_sec scan_result = @s scan_time
scoreboard players operation $scan_sec scan_result /= $const_20 cd_mother_rotsense
execute as @a[tag=team.human,tag=!state.dead,distance=..6] run title @s actionbar [{"text":"隔离扫描中 ","color":"aqua"},{"score":{"name":"$scan_sec","objective":"scan_result"}},{"text":"秒","color":"aqua"}]

execute if score @s scan_result matches ..0 run function escape_island:scan/cancel
execute if score @s scan_time matches ..0 run function escape_island:scan/resolve
scoreboard players set @s scan_result 0
