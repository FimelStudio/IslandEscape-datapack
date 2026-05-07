scoreboard players set @s scan_active 0
scoreboard players set @s scan_result 0

execute if entity @a[tag=state.infected_period,tag=team.human,tag=!state.dead,distance=..6,limit=1] run scoreboard players set @s scan_result 1
execute if entity @a[tag=infected.mother,tag=state.mutated,tag=!state.dead,distance=..6,limit=1] run scoreboard players set @s scan_result 2
execute if entity @a[tag=infected.common,tag=!state.dead,distance=..6,limit=1] run scoreboard players set @s scan_result 2
execute if score @s scan_result matches 0 if entity @a[tag=infected.mother,tag=!state.mutated,tag=!state.dead,distance=..6,limit=1] run scoreboard players set @s scan_result 1

execute if score @s scan_result matches 0 at @s run tellraw @a[tag=team.human,tag=!state.dead,distance=..10] {"text":"[隔离扫描] 结果：正常","color":"green"}
execute if score @s scan_result matches 1 at @s run tellraw @a[tag=team.human,tag=!state.dead,distance=..10] {"text":"[隔离扫描] 结果：孢子异常","color":"yellow"}
execute if score @s scan_result matches 2 at @s run tellraw @a[tag=team.human,tag=!state.dead,distance=..10] {"text":"[隔离扫描] 结果：严重异常","color":"red","bold":true}

execute if score @s scan_result matches 0 at @s run playsound minecraft:block.note_block.chime master @a[distance=..12] ~ ~ ~ 0.7 1.4
execute if score @s scan_result matches 1 at @s run playsound minecraft:block.beacon.deactivate master @a[distance=..12] ~ ~ ~ 0.8 1.0
execute if score @s scan_result matches 2 at @s run playsound minecraft:entity.warden.heartbeat master @a[distance=..12] ~ ~ ~ 0.9 0.8

scoreboard players operation @s scan_station_cd = Tunable tunable.scan_station_cd
scoreboard players set @s scan_time 0
