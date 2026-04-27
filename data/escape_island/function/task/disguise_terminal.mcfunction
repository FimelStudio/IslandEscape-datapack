# escape_island:task/disguise_terminal  —  Mother accesses X-7 via lab terminal
# Requires 2 mother-specific ID card fragments

execute unless entity @s[tag=role.mother] run return 0
execute if score @s lab_cards matches 2.. run function escape_island:task/_give_disguise
execute unless score @s lab_cards matches 2.. run tellraw @s {"text":"§5终端：需要 2 张身份卡碎片。","color":"dark_purple"}
