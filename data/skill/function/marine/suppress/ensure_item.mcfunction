advancement revoke @s only skill:marine/suppress/use
clear @s minecraft:crossbow[minecraft:custom_data~{role_item:"marine.suppress"}]
execute unless items entity @s hotbar.6 minecraft:crossbow[minecraft:custom_data~{skill:"marine_suppress"}] run function skill:marine/suppress/update_item
