scoreboard players remove @a[tag=marine,scores={skill.gm_input_cd=1..}] skill.gm_input_cd 1
scoreboard players remove @a[tag=marine,scores={skill.gm_delay=1..}] skill.gm_delay 1
execute as @a[tag=marine,scores={skill.gm_burst=1..,skill.gm_delay=..0}] at @s anchored eyes run function skill:marine/gun_mastery/fire_one
