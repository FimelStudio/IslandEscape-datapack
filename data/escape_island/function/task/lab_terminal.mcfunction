
execute if score @s lab_cards matches 4.. run function escape_island:task/_lab_unlock
execute unless score @s lab_cards matches 4.. run tellraw @s {"text":"§5终端：需要 4 张身份卡碎片。","color":"dark_purple"}
