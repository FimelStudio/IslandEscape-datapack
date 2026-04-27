advancement revoke @s only skill:doctor/antidote/use
execute store result score @s skill.antidote_item run clear @s minecraft:tipped_arrow[custom_data={skill:"doctor_antidote"}] 0
execute if score @s skill.antidote_item matches 0 run function skill:doctor/antidote/update_item
