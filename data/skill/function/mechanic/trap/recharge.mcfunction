scoreboard players add @s skill.trap_charges 1
execute if score @s skill.trap_charges < #max_traps skill.trap_cfg run scoreboard players operation @s skill.trap_cd = #cooldown skill.trap_cfg
execute unless score @s skill.trap_charges < #max_traps skill.trap_cfg run scoreboard players set @s skill.trap_cd 0
function skill:mechanic/trap/update_item
