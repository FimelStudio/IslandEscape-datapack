scoreboard players set @s scan_active 0
scoreboard players set @s scan_time 0
scoreboard players set @s scan_result 0

execute at @s run tellraw @a[tag=team.human,tag=!state.dead,distance=..10] {"text":"[隔离扫描] 读条中断（人数不足或未持续操作）。","color":"gray"}
execute at @s run playsound minecraft:block.note_block.didgeridoo master @a[distance=..12] ~ ~ ~ 0.5 0.8
