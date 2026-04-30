execute if entity @e[type=minecraft:marker,tag=skill.trap.marker,distance=..1.5,limit=1,sort=nearest] run return run function skill:mechanic/trap/recall
execute if score #recall_len skill.trap_tmp matches ..11 run scoreboard players add #recall_len skill.trap_tmp 1
execute if score #recall_len skill.trap_tmp matches ..11 positioned ^ ^ ^0.5 run return run function skill:mechanic/trap/recall_raycast
