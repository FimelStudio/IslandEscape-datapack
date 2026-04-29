tag @s remove skill.viro_hit

execute if entity @a[tag=role.mother,tag=!state.dead,distance=..6] run tag @s add skill.viro_hit
execute if entity @a[tag=role.infected,tag=!state.dead,distance=..6] run tag @s add skill.viro_hit
execute if entity @a[tag=state.infected_period,tag=!state.dead,distance=..6] run tag @s add skill.viro_hit
execute if entity @e[tag=test.dummy,tag=role.mother,distance=..6] run tag @s add skill.viro_hit
execute if entity @e[tag=test.dummy,tag=role.infected,distance=..6] run tag @s add skill.viro_hit

execute if entity @s[tag=skill.viro_hit] run function skill:virologist/detector/hit
execute unless entity @s[tag=skill.viro_hit] run function skill:virologist/detector/miss
tag @s remove skill.viro_hit

scoreboard players operation @s skill.detector_cd = #cooldown skill.detector_cfg
function skill:virologist/detector/update_item
