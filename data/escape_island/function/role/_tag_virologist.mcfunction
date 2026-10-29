function escape_island:role/clear
tag @s add team.human
tag @s add role.virologist
tag @s remove state.role_candidate
scoreboard players set @s role 7
