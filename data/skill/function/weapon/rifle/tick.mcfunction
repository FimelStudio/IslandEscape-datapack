scoreboard players remove @a[scores={skill.rifle_fire_cd=1..}] skill.rifle_fire_cd 1
scoreboard players remove @a[tag=skill.rifle.reloading,scores={skill.rifle_reload=1..}] skill.rifle_reload 1
execute as @a[tag=skill.rifle.reloading,scores={skill.rifle_reload=0}] run function skill:weapon/rifle/reload_finish
