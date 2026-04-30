advancement revoke @s only skill:doctor/antidote/use
clear @s minecraft:tipped_arrow[custom_data={skill:"doctor_antidote"}]
clear @s minecraft:sugar[custom_data={skill:"doctor_antidote_used"}]
tag @s remove skill.antidote.user
tag @s remove skill.antidote.target
scoreboard players set @s skill.antidote_cd 0
scoreboard players set @s skill.antidote_regen_cd 0
scoreboard players set @s skill.antidote_charges 0
scoreboard players set @s skill.antidote_state 0
