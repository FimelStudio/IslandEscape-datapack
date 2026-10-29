
scoreboard players remove @a[tag=ie.active,tag=role.marine,scores={skill.suppress_cd=1..}] skill.suppress_cd 1

execute as @a[tag=ie.active,tag=role.marine,scores={skill.suppress_cd=0,skill.suppress_state=2}] run function skill:marine/suppress/update_item
execute as @a[tag=ie.active,tag=role.marine,scores={skill.suppress_cd=1..}] run function skill:marine/suppress/cooldown_tick
execute as @a[tag=ie.active,tag=role.marine] run function skill:marine/suppress/ensure_item
