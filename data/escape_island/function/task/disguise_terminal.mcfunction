
execute unless entity @s[tag=infected.mother] run return 0
execute if score @s lab_cards matches 2.. run function escape_island:task/_give_disguise
execute unless score @s lab_cards matches 2.. run tellraw @s {"text":"§5终端：需要 2 张身份卡碎片。","color":"dark_purple"}
