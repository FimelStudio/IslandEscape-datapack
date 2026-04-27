# Tick generator countdown
execute if score $game gen_progress matches 1201.. run return 0
execute if score $game gen_progress matches 1..1200 run scoreboard players remove $game gen_progress 1
execute store result bossbar escape_island:gen value run scoreboard players get $game gen_progress

execute if score $game gen_progress matches 0 run bossbar set escape_island:gen visible false
execute if score $game gen_progress matches 0 run tellraw @a {"text":"§c[发电机] 电力耗尽。","color":"red"}
