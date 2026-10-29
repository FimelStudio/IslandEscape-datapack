execute unless score @s skill.shotgun_mag matches 1.. run return 0
scoreboard players remove @s skill.shotgun_mag 1
title @s actionbar [{"text":"SG-5 弹药 ","color":"gold"},{"score":{"name":"@s","objective":"skill.shotgun_mag"}},{"text":"/6","color":"gold"}]
scoreboard players set @s skill.shotgun_cd 20
playsound minecraft:item.crossbow.shoot master @a[distance=..24] ~ ~ ~ 1 0.7
execute anchored eyes positioned ^ ^ ^4 as @e[tag=infected.common,tag=!state.dead,distance=..4] run damage @s 5 minecraft:generic
execute anchored eyes positioned ^ ^ ^4 as @e[tag=infected.mother,tag=state.hunting,tag=!state.dead,distance=..4] run damage @s 4 minecraft:generic
execute anchored eyes positioned ^ ^ ^4 run particle minecraft:crit ~ ~ ~ 2 1 2 0.15 40 force @a[distance=..24]

execute if entity @s[tag=range.active] run scoreboard players set #hit skill.pistol_tmp 0
execute if entity @s[tag=range.active] anchored eyes positioned ^ ^ ^4 as @e[tag=range.target,tag=!range.reaction.hidden,distance=..4,sort=nearest,limit=1] run function escape_island:range/target_hit
execute if entity @s[tag=range.active] run function escape_island:range/on_shot
