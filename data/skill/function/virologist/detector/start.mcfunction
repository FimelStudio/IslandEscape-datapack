tag @s remove skill.virologist.hit

execute if entity @a[tag=infected.mother,tag=state.disguise_scanning,tag=!state.dead,distance=..6] run function escape_island:escape/disguise_scan_break
execute if entity @a[tag=infected.mother,tag=!state.dead,distance=..6] run tag @s add skill.virologist.hit
execute if entity @a[tag=infected.common,tag=!state.dead,distance=..6] run tag @s add skill.virologist.hit
execute if entity @a[tag=state.infected_period,tag=!state.dead,distance=..6] run tag @s add skill.virologist.hit
execute if entity @e[tag=test.dummy,tag=infected.mother,distance=..6] run tag @s add skill.virologist.hit
execute if entity @e[tag=test.dummy,tag=infected.common,distance=..6] run tag @s add skill.virologist.hit

execute if entity @s[tag=skill.virologist.hit] run function skill:virologist/detector/hit
execute unless entity @s[tag=skill.virologist.hit] run function skill:virologist/detector/miss
tag @s remove skill.virologist.hit

scoreboard players operation @s skill.detector_cd = #cooldown skill.detector_cfg
function skill:virologist/detector/update_item
