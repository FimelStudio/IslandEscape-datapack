tag @s add doctor
tag @s add flag.has_inject
scoreboard players set @s skill.antidote_charges 1
scoreboard players set @s skill.antidote_cd 0
scoreboard players operation @s skill.antidote_regen_cd = #regen_cd skill.antidote_cfg
function skill:doctor/antidote/update_item
tellraw @s {"text":"§b[船医]§r 解毒针: 治愈队友感染期。§e自身孢子阈值 130（+30）。","color":"gray"}
