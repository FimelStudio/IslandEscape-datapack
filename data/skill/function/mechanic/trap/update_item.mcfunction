clear @s minecraft:tripwire_hook[minecraft:custom_data~{skill:"mechanic_trap"}]
clear @s minecraft:tripwire_hook[minecraft:custom_data~{skill:"mechanic_infected_trap"}]
clear @s minecraft:tripwire_hook[minecraft:custom_data~{role_item:"mechanic.trap"}]
clear @s minecraft:tripwire_hook[minecraft:custom_data~{role_item:"mechanic.infected_trap"}]
scoreboard players operation @s skill.trap_sec = @s skill.trap_cd
scoreboard players operation @s skill.trap_sec /= #twenty skill.trap_cfg
execute store result storage skill:mechanic.trap item.sec int 1 run scoreboard players get @s skill.trap_sec
execute store result storage skill:mechanic.trap item.charges int 1 run scoreboard players get @s skill.trap_charges

execute if score @s skill.trap_charges matches ..0 run scoreboard players set @s skill.trap_state 2
execute if score @s skill.trap_charges matches ..0 run function skill:mechanic/trap/item_cooldown with storage skill:mechanic.trap item
execute if score @s skill.trap_charges matches 1.. run scoreboard players set @s skill.trap_state 1
execute if score @s skill.trap_charges matches 1.. if entity @s[tag=infected.common] run function skill:mechanic/trap/item_infected_ready with storage skill:mechanic.trap item
execute if score @s skill.trap_charges matches 1.. unless entity @s[tag=infected.common] run function skill:mechanic/trap/item_ready with storage skill:mechanic.trap item
