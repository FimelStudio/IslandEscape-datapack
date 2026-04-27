# escape_island:dev/as_infected  —  make caller a sandbox infected
function escape_island:dev/_reset_player_state
tag @s add role.infected
scoreboard players set @s role 12
team join infected @s
attribute @s minecraft:attack_damage base set 4
tellraw @s [{"text":"[DEV] 已设为感染者。","color":"red"},{"text":" [感染测试]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
