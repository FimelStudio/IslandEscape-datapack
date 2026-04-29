execute at @s run kill @e[type=minecraft:marker,tag=skill.trap_marker,distance=..3,sort=nearest,limit=1]
execute at @s run playsound minecraft:block.tripwire.detach player @s ~ ~ ~ 0.8 1.2
execute if score @s skill.trap_charges < #max_traps skill.trap_cfg run scoreboard players add @s skill.trap_charges 1
execute unless score @s skill.trap_charges < #max_traps skill.trap_cfg run scoreboard players set @s skill.trap_cd 0
title @s actionbar {"text":"已拆除附近机关陷阱","color":"dark_green"}
tag @s add skill.trap_recalled
function skill:mechanic/trap/update_item
