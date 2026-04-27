scoreboard players add @s skill.antidote_charges 1
execute if score @s skill.antidote_charges > #max_charges skill.antidote_cfg run scoreboard players operation @s skill.antidote_charges = #max_charges skill.antidote_cfg
execute if score @s skill.antidote_charges < #max_charges skill.antidote_cfg run scoreboard players operation @s skill.antidote_regen_cd = #regen_cd skill.antidote_cfg
playsound minecraft:block.brewing_stand.brew player @s ~ ~ ~ 0.45 1.3 1
title @s actionbar {"text":"解毒针补给 +1","color":"aqua"}
function skill:doctor/antidote/update_item
