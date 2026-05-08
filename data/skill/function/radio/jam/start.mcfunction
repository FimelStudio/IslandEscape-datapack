scoreboard players add @s skill.forger_uses 1

execute if score @s skill.forger_uses matches 2.. run scoreboard players operation @s skill.radio_jam_cd = #lockout skill.radio_jam_cfg
execute unless score @s skill.forger_uses matches 2.. run scoreboard players operation @s skill.radio_jam_cd = #cooldown skill.radio_jam_cfg

function skill:radio/forger/fake_tower

execute if score @s skill.forger_uses matches ..1 run function skill:radio/jam/update_item
execute if score @s skill.forger_uses matches 2.. run tellraw @s {"text":"[信号欺骗] 误报能力已耗尽，系统锁定中。","color":"dark_purple"}
execute if score @s skill.forger_uses matches 2.. run function skill:radio/jam/update_item
