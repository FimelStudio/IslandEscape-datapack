execute if score $game gen_state matches 0 run return 0
execute if score $game gen_state matches 2 run return 0
execute if score $game gen_state matches 3 run return 0

execute if score $game gen_progress matches 1..60 run scoreboard players remove $game gen_progress 1
execute store result bossbar escape_island:gen value run scoreboard players get $game gen_progress

execute if score $game gen_progress matches 0 run bossbar set escape_island:gen visible false
execute if score $game gen_progress matches 0 run tellraw @a {"text":"§a[发电机] 稳定运行完成！部分区域恢复供电。","color":"green","bold":true}
execute if score $game gen_progress matches 0 run playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1 1
execute if score $game gen_progress matches 0 run scoreboard players set $game gen_done 1
execute if score $game gen_progress matches 0 run scoreboard players set $game gen_state 3
