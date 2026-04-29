advancement revoke @s only skill:doctor/antidote/use
execute unless items entity @s hotbar.6 minecraft:tipped_arrow[minecraft:custom_data~{skill:"doctor_antidote"}] run function skill:doctor/antidote/update_item
