advancement revoke @s only skill:virologist/detector/use
clear @s minecraft:glass_bottle[minecraft:custom_data~{role_item:"virologist.reagent"}]
clear @s minecraft:glass_bottle[minecraft:custom_data~{skill:"viro_detector"}]
execute unless items entity @s hotbar.6 minecraft:potion[minecraft:custom_data~{skill:"viro_detector"}] run function skill:virologist/detector/update_item
