advancement revoke @s only skill:chef/hot_soup/use
clear @s minecraft:mushroom_stew[minecraft:custom_data~{role_item:"chef.stew"}]
clear @s minecraft:sugar[minecraft:custom_data~{skill:"cook_soup"}]
execute unless items entity @s hotbar.6 minecraft:mushroom_stew[minecraft:custom_data~{skill:"cook_soup"}] run function skill:chef/hot_soup/update_item
