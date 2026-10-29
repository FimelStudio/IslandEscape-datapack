function skill:virologist/detector/tick
scoreboard players remove @a[tag=ie.active,tag=role.virologist,scores={skill.viro_passive_cd=1..}] skill.viro_passive_cd 1
execute as @a[tag=ie.active,tag=role.virologist,scores={skill.viro_passive_cd=..0}] at @s run function skill:virologist/passive
execute if score $tick ie.hygiene matches 0 as @a[tag=ie.active,tag=!role.virologist] run function skill:virologist/cleanup_non_virologist
