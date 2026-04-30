scoreboard players set @s gen_state 4
scoreboard players set @s gen_countdown 0
scoreboard players set @s gen_overload 0
scoreboard players set $game gen_done 1
bossbar set escape_island:gen visible false
execute at @s run tellraw @a {"text":"§a[发电机] 稳定运行完成！部分区域恢复供电。","color":"green","bold":true}
execute at @s run playsound minecraft:block.beacon.activate master @a[distance=..32] ~ ~ ~ 1 1
kill @e[type=minecraft:interaction,tag=entity.generator_interaction]
