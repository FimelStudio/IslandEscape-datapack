advancement revoke @s only skill:captain/whistle/use
clear @s minecraft:goat_horn[minecraft:custom_data~{skill:"captain_whistle"}]
execute unless items entity @s hotbar.6 minecraft:sugar[minecraft:custom_data~{skill:"captain_whistle"}] run function skill:captain/whistle/update_item
