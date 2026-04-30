scoreboard objectives add skill.trap_cd dummy
scoreboard objectives add skill.trap_cfg dummy
scoreboard objectives add skill.trap_item dummy
scoreboard objectives add skill.trap_state dummy
scoreboard objectives add skill.trap_sec dummy
scoreboard objectives add skill.trap_charges dummy
scoreboard objectives add skill.trap_place_cd dummy
scoreboard objectives add skill.trap_tmp dummy

function skill:mechanic/trap/config

advancement revoke @a only skill:mechanic/trap/use
scoreboard players set @a skill.trap_cd 0
scoreboard players set @a skill.trap_item 0
scoreboard players set @a skill.trap_state 0
scoreboard players set @a skill.trap_sec 0
scoreboard players operation @a skill.trap_charges = #max_traps skill.trap_cfg
scoreboard players set @a skill.trap_place_cd 0
scoreboard players set #active skill.trap_tmp 0
tag @a remove skill.trap.recalled
