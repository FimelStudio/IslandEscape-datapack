scoreboard players remove @s skill.sniper_mag 1
scoreboard players set @s skill.sniper_cd 20
scoreboard players set @s skill.sniper_bolt 10
tag @s add sniper.bolting
playsound minecraft:entity.firework_rocket.blast master @a[distance=..48] ~ ~ ~ 1 0.7
execute anchored eyes positioned ^ ^ ^10 as @e[tag=infected.common,tag=!state.dead,distance=..3,sort=nearest,limit=1] run damage @s 14 minecraft:generic
execute anchored eyes positioned ^ ^ ^10 as @e[tag=infected.mother,tag=!state.dead,distance=..3,sort=nearest,limit=1] run damage @s 10 minecraft:generic
execute anchored eyes positioned ^ ^ ^10 run particle minecraft:end_rod ~ ~ ~ 0.2 0.2 0.2 0.02 20 force @a[distance=..48]

execute if entity @s[tag=range.active] run scoreboard players set #hit skill.pistol_tmp 0
execute if entity @s[tag=range.active] anchored eyes positioned ^ ^ ^10 as @e[tag=range.target,tag=!range.reaction.hidden,distance=..2,sort=nearest,limit=1] run function escape_island:range/target_hit
execute if entity @s[tag=range.active] anchored eyes positioned ^ ^ ^20 as @e[tag=range.target,tag=!range.reaction.hidden,distance=..2,sort=nearest,limit=1] run function escape_island:range/target_hit
execute if entity @s[tag=range.active] anchored eyes positioned ^ ^ ^30 as @e[tag=range.target,tag=!range.reaction.hidden,distance=..2,sort=nearest,limit=1] run function escape_island:range/target_hit
execute if entity @s[tag=range.active] run function escape_island:range/on_shot

execute if score @s skill.sniper_mag matches ..0 run function skill:weapon/sniper/reload_start
