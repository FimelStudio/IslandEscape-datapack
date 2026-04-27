advancement revoke @s only skill:doctor/antidote/use
clear @s minecraft:tipped_arrow[custom_data={skill:"doctor_antidote"}]
tag @s remove skill.antidote_user
tag @s remove skill.antidote_target
scoreboard players set @s skill.antidote_cd 0
scoreboard players set @s skill.antidote_regen_cd 0
scoreboard players set @s skill.antidote_charges 0
scoreboard players set @s skill.antidote_state 0
