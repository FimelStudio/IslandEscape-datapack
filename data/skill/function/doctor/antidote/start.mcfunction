execute as @a[tag=skill.antidote.target] run function escape_island:infection/cure
tellraw @s {"text":"§b解毒针已注射。","color":"aqua"}
tellraw @a[tag=skill.antidote.target] {"text":"§b船医为你注射了解毒针。","color":"aqua"}
playsound minecraft:entity.witch.drink player @s ~ ~ ~ 0.8 1.4 1
execute as @a[tag=skill.antidote.target] at @s run particle minecraft:instant_effect ~ ~1 ~ 0.25 0.45 0.25 0.02 18 force @s

scoreboard players remove @s skill.antidote_charges 1
execute if score @s skill.antidote_charges matches ..-1 run scoreboard players set @s skill.antidote_charges 0
scoreboard players operation @s skill.antidote_cd = #cooldown skill.antidote_cfg
execute if score @s skill.antidote_charges < #max_charges skill.antidote_cfg unless score @s skill.antidote_regen_cd matches 1.. run scoreboard players operation @s skill.antidote_regen_cd = #regen_cd skill.antidote_cfg
function skill:doctor/antidote/update_item
