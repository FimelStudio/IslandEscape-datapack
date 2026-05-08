scoreboard players remove @s skill.rifle_mag 1
scoreboard players set @s skill.rifle_fire_cd 3

playsound minecraft:entity.generic.explode master @a[distance=..28] ~ ~ ~ 0.6 1.35
execute anchored eyes positioned ^ ^ ^20 as @e[tag=infected.common,tag=!state.dead,distance=..3,sort=nearest,limit=1] run damage @s 4 minecraft:generic
execute anchored eyes positioned ^ ^ ^20 as @e[tag=infected.mother,tag=!state.dead,distance=..3,sort=nearest,limit=1] run damage @s 3 minecraft:generic
execute anchored eyes positioned ^ ^ ^20 run particle minecraft:crit ~ ~ ~ 0.3 0.3 0.3 0.05 5 force @a[distance=..28]

execute if entity @s[tag=range.active] run scoreboard players set #hit skill.pistol_tmp 0
execute if entity @s[tag=range.active] anchored eyes positioned ^ ^ ^5  as @e[tag=range.target,tag=!range.reaction.hidden,distance=..3,sort=nearest,limit=1] run function escape_island:range/target_hit
execute if entity @s[tag=range.active] anchored eyes positioned ^ ^ ^10 as @e[tag=range.target,tag=!range.reaction.hidden,distance=..3,sort=nearest,limit=1] run function escape_island:range/target_hit
execute if entity @s[tag=range.active] anchored eyes positioned ^ ^ ^15 as @e[tag=range.target,tag=!range.reaction.hidden,distance=..3,sort=nearest,limit=1] run function escape_island:range/target_hit
execute if entity @s[tag=range.active] anchored eyes positioned ^ ^ ^20 as @e[tag=range.target,tag=!range.reaction.hidden,distance=..3,sort=nearest,limit=1] run function escape_island:range/target_hit
execute if entity @s[tag=range.active] anchored eyes positioned ^ ^ ^25 as @e[tag=range.target,tag=!range.reaction.hidden,distance=..3,sort=nearest,limit=1] run function escape_island:range/target_hit
execute if entity @s[tag=range.active] run function escape_island:range/on_shot

title @s actionbar [{"text":"SR-17  ","color":"green"},{"score":{"name":"@s","objective":"skill.rifle_mag"}},{"text":"/30","color":"dark_gray"}]

execute if score @s skill.rifle_mag matches ..0 run function skill:weapon/rifle/reload_start
