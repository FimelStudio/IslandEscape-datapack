advancement revoke @s only skill:doctor/antidote/use
clear @s minecraft:sugar[custom_data={skill:"doctor_antidote_used"}]

execute unless entity @s[tag=role.doctor] run function skill:doctor/antidote/cleanup_non_doctor
execute unless entity @s[tag=role.doctor] run return 0

execute if score @s skill.antidote_charges matches ..0 run title @s actionbar {"text":"解毒针已用尽，等待补给","color":"red"}
execute if score @s skill.antidote_charges matches ..0 run function skill:doctor/antidote/update_item
execute if score @s skill.antidote_charges matches ..0 run return 0

execute if score @s skill.antidote_cd matches 1.. run title @s actionbar {"text":"解毒针冷却中","color":"yellow"}
execute if score @s skill.antidote_cd matches 1.. run function skill:doctor/antidote/update_item
execute if score @s skill.antidote_cd matches 1.. run return 0

tag @s add skill.antidote.user
execute if entity @s[tag=state.infected_period] run tag @s add skill.antidote.target
execute unless entity @s[tag=state.infected_period] at @s as @a[tag=state.infected_period,tag=team.human,distance=..5,sort=nearest,limit=1] unless entity @s[tag=skill.antidote.user] run tag @s add skill.antidote.target

execute if entity @a[tag=skill.antidote.target,limit=1] run function skill:doctor/antidote/start
execute unless entity @a[tag=skill.antidote.target,limit=1] run title @s actionbar {"text":"5格内没有感染期目标","color":"gray"}

tag @s remove skill.antidote.user
tag @a remove skill.antidote.target
