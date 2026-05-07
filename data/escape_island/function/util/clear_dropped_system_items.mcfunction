tag @s add ie.checked_drop
execute if data entity @s Item.components."minecraft:custom_data".skill run kill @s
execute if data entity @s Item.components."minecraft:custom_data".ui run kill @s
execute if data entity @s Item.components."minecraft:custom_data".weapon run kill @s
