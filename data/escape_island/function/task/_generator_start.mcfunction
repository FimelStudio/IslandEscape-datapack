scoreboard players set @s gen_state 1
scoreboard players set @s gen_countdown 10
scoreboard players set @s gen_overload 0
bossbar set escape_island:gen visible true
bossbar set escape_island:gen players @a
bossbar set escape_island:gen max 10
execute store result bossbar escape_island:gen value run scoreboard players get @s gen_countdown
execute at @s run tellraw @a {"text":"§a[发电机] 燃料就绪，开始 10 秒预热。","color":"green"}
execute at @s run playsound minecraft:block.piston.extend master @a[distance=..24] ~ ~ ~ 1 0.5
function escape_island:task/generator_attach_interactions
