bossbar set escape_island:gen max 10
scoreboard players remove @s gen_countdown 1
execute if score @s gen_countdown matches ..0 run scoreboard players set @s gen_countdown 0
execute store result bossbar escape_island:gen value run scoreboard players get @s gen_countdown
execute as @a[distance=..4] run title @s actionbar [{"text":"发电机预热 ","color":"gold"},{"score":{"name":"@e[type=minecraft:marker,tag=marker.generator,sort=nearest,limit=1]","objective":"gen_countdown"}},{"text":" 秒","color":"gold"}]
execute if score @s gen_countdown matches 0 run scoreboard players set @s gen_state 2
execute if score @s gen_countdown matches 0 run scoreboard players set @s gen_countdown 60
execute if score @s gen_countdown matches 60 run tellraw @a {"text":"§a[发电机] 预热完成，开始稳定运行 60 秒。","color":"green"}
execute if score @s gen_countdown matches 60 at @s run playsound minecraft:block.beacon.ambient master @a[distance=..24] ~ ~ ~ 0.8 1.4
