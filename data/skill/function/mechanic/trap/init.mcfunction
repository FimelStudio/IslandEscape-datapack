scoreboard objectives add skill.trap_cd dummy
scoreboard objectives add skill.trap_cfg dummy
scoreboard objectives add skill.trap_item dummy
scoreboard objectives add skill.trap_state dummy
scoreboard objectives add skill.trap_sec dummy
scoreboard objectives add skill.trap_charges dummy
scoreboard objectives add skill.trap_place_cd dummy
scoreboard objectives add skill.trap_tmp dummy

function skill:mechanic/trap/config

scoreboard players set #active skill.trap_tmp 0
