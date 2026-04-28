clear @s minecraft:structure_void[minecraft:custom_data={skill:"mother/zombie_editor"}]
execute unless items entity @s hotbar.4 minecraft:red_dye[minecraft:custom_data~{skill:"mother/eat"}] run function skill:mother/eat/refresh_ready
