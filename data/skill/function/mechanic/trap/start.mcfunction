execute if score @s skill.trap_charges matches ..0 run title @s actionbar {"text":"机关陷阱充能耗尽","color":"yellow"}
execute if score @s skill.trap_charges matches ..0 run function skill:mechanic/trap/update_item
execute if score @s skill.trap_charges matches ..0 run return 0

execute store result score #active skill.trap_tmp if entity @e[type=minecraft:marker,tag=skill.trap.marker]
execute if score #active skill.trap_tmp >= #max_traps skill.trap_cfg run title @s actionbar {"text":"陷阱数量已达上限","color":"red"}
execute if score #active skill.trap_tmp >= #max_traps skill.trap_cfg run function skill:mechanic/trap/update_item
execute if score #active skill.trap_tmp >= #max_traps skill.trap_cfg run return 0

execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["entity.mechanic_trap","skill.trap.marker"],CustomName:'{"text":"机关陷阱","color":"gray"}'}
execute at @s run particle minecraft:dust{color:[0.1,0.8,0.2],scale:0.9} ~ ~0.08 ~ 0.25 0.03 0.25 0.01 18 force @a[distance=..8]
execute at @s run playsound minecraft:block.tripwire.attach player @a[distance=..12] ~ ~ ~ 0.8 1.4
title @s actionbar {"text":"机关陷阱已部署","color":"green"}

scoreboard players remove @s skill.trap_charges 1
scoreboard players set @s skill.trap_place_cd 10
execute if score @s skill.trap_cd matches ..0 run scoreboard players operation @s skill.trap_cd = #cooldown skill.trap_cfg
function skill:mechanic/trap/update_item
