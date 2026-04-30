function skill:virologist/detector/tick
scoreboard players remove @a[tag=role.virologist,scores={skill.viro_passive_cd=1..}] skill.viro_passive_cd 1
execute as @a[tag=role.virologist,scores={skill.viro_passive_cd=..0}] at @s run function skill:virologist/passive
execute as @a[tag=!role.virologist] run function skill:virologist/cleanup_non_virologist
