# Generator started: 60-second maintenance window
scoreboard players set $game gen_progress 1200
bossbar set escape_island:gen visible true
bossbar set escape_island:gen players @a
bossbar set escape_island:gen max 1200
tellraw @a {"text":"§a[发电机] 启动！维持 60 秒。","color":"green"}
playsound minecraft:block.piston.extend master @a ~ ~ ~ 1 0.5
