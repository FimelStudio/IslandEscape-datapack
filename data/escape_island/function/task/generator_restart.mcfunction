scoreboard players set @s gen_state 1
scoreboard players set @s gen_countdown 10
scoreboard players set @s gen_overload 0
execute at @s run tellraw @a {"text":"§a[发电机] 故障已排除，重新预热。","color":"green"}
execute at @s run playsound minecraft:block.piston.extend master @a[distance=..24] ~ ~ ~ 1 1.2
function escape_island:task/generator_attach_interactions
