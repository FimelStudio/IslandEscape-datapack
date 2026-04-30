clear @s minecraft:tripwire_hook[minecraft:custom_data~{skill:"mechanic_trap"}]
clear @s minecraft:tripwire_hook[minecraft:custom_data~{skill:"mechanic_infected_trap"}]
clear @s minecraft:sugar[custom_data={skill:"mechanic_trap_used"}]
clear @s minecraft:sugar[custom_data={skill:"mechanic_infected_trap_used"}]
scoreboard players set @s skill.trap_cd 0
scoreboard players set @s skill.trap_state 0
scoreboard players set @s skill.trap_charges 0
scoreboard players set @s skill.trap_place_cd 0
