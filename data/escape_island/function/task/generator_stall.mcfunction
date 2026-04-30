scoreboard players set @s gen_state 3
scoreboard players set @s gen_overload 20
execute at @s run tellraw @a {"text":"§c[发电机] 过载熄火！燃料仍在，幸存者按住右键发电机即可维修。","color":"red"}
execute at @s run playsound minecraft:block.fire.extinguish master @a[distance=..24] ~ ~ ~ 1 0.8
execute at @s run particle minecraft:smoke ~ ~1 ~ 0.5 0.4 0.5 0.02 24 force
