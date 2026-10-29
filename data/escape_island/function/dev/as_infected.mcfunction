execute if score $game in_game matches 1 run return 0
execute if score $game ie.mode matches 4 run return 0
execute if score $game gs_active matches 1 run return 0
function escape_island:dev/_reset_player_state
tag @s add team.infected
tag @s add infected.common
scoreboard players set @s role 12
team join infected @s
function escape_island:visual/infected_common
attribute @s minecraft:attack_damage base set 4
tellraw @s [{"text":"[DEV] 已设为感染者。","color":"red"},{"text":" [感染测试]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
