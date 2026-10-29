
execute if score $tick ie.hygiene matches 0 as @a[tag=ie.active,tag=!role.doctor] run function skill:doctor/antidote/cleanup_non_doctor

scoreboard players add @a[tag=ie.active,tag=role.doctor] skill.antidote_charges 0
scoreboard players remove @a[tag=ie.active,tag=role.doctor,scores={skill.antidote_cd=1..}] skill.antidote_cd 1
scoreboard players remove @a[tag=ie.active,tag=role.doctor,scores={skill.antidote_regen_cd=1..}] skill.antidote_regen_cd 1

execute as @a[tag=ie.active,tag=role.doctor] if score @s skill.antidote_charges >= #max_charges skill.antidote_cfg run scoreboard players set @s skill.antidote_regen_cd 0
execute as @a[tag=ie.active,tag=role.doctor] if score @s skill.antidote_charges < #max_charges skill.antidote_cfg unless score @s skill.antidote_regen_cd matches 1.. run function skill:doctor/antidote/add_charge

execute as @a[tag=ie.active,tag=role.doctor,scores={skill.antidote_cd=0,skill.antidote_state=2}] run function skill:doctor/antidote/update_item
execute as @a[tag=ie.active,tag=role.doctor,scores={skill.antidote_cd=1..}] run function skill:doctor/antidote/cooldown_tick
execute as @a[tag=ie.active,tag=role.doctor] run function skill:doctor/antidote/ensure_item
