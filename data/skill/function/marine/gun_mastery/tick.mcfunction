scoreboard players remove @a[tag=role.marine,scores={skill.gm_input_cd=1..}] skill.gm_input_cd 1
scoreboard players remove @a[tag=role.marine,scores={skill.gm_delay=1..}] skill.gm_delay 1
execute as @a[tag=role.marine,scores={skill.gm_burst=1..,skill.gm_delay=..0}] at @s anchored eyes run function skill:marine/gun_mastery/fire_one

execute as @a[tag=role.marine,scores={skill.gm_burst=..0}] if score @s skill.gm_runtime matches 1 run scoreboard players set @s skill.gm_runtime 0
