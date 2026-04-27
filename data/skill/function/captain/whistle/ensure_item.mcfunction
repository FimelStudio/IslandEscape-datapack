advancement revoke @s only skill:captain/whistle/use
clear @s minecraft:goat_horn[custom_data={skill:"captain_whistle"}]
execute store result score @s skill.whistle_item run clear @s minecraft:sugar[custom_data={skill:"captain_whistle"}] 0
execute if score @s skill.whistle_item matches 0 run function skill:captain/whistle/update_item
