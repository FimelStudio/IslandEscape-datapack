scoreboard players remove @a[tag=ie.active,scores={skill.shotgun_cd=1..}] skill.shotgun_cd 1
scoreboard players remove @a[tag=ie.active,scores={skill.shotgun_reload=1..}] skill.shotgun_reload 1
execute as @a[tag=ie.active,tag=skill.shotgun.reloading,scores={skill.shotgun_reload=0}] run function skill:weapon/shotgun/reload_finish
