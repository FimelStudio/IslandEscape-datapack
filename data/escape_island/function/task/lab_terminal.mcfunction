
execute if score @s lab_cards >= Tunable tunable.lab_card_required run function escape_island:task/_lab_unlock
execute unless score @s lab_cards >= Tunable tunable.lab_card_required run tellraw @s [{"text":"§5终端：需要 ","color":"dark_purple"},{"score":{"name":"Tunable","objective":"tunable.lab_card_required"}},{"text":" 张身份卡碎片。","color":"dark_purple"}]
