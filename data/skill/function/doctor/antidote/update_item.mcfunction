execute store result storage skill:doctor.antidote item.charges int 1 run scoreboard players get @s skill.antidote_charges
scoreboard players operation @s skill.antidote_sec = @s skill.antidote_cd
scoreboard players operation @s skill.antidote_sec /= #twenty skill.antidote_cfg
execute store result storage skill:doctor.antidote item.sec int 1 run scoreboard players get @s skill.antidote_sec

execute if score @s skill.antidote_cd matches 1.. run scoreboard players set @s skill.antidote_state 2
execute if score @s skill.antidote_cd matches 1.. run function skill:doctor/antidote/item_cooldown with storage skill:doctor.antidote item
execute unless score @s skill.antidote_cd matches 1.. if score @s skill.antidote_charges matches 1.. run scoreboard players set @s skill.antidote_state 1
execute unless score @s skill.antidote_cd matches 1.. if score @s skill.antidote_charges matches 1.. run function skill:doctor/antidote/item_ready with storage skill:doctor.antidote item
execute unless score @s skill.antidote_cd matches 1.. unless score @s skill.antidote_charges matches 1.. run scoreboard players set @s skill.antidote_state 0
execute unless score @s skill.antidote_cd matches 1.. unless score @s skill.antidote_charges matches 1.. run function skill:doctor/antidote/item_empty with storage skill:doctor.antidote item
