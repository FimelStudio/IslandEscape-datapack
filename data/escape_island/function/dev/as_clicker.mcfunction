execute if score $game in_game matches 1 run return 0
execute if score $game ie.mode matches 4 run return 0
execute if score $game gs_active matches 1 run return 0
function escape_island:dev/_reset_player_state
tag @s add team.infected
tag @s add infected.common
tag @s add infected.special
tag @s add infected.clicker
scoreboard players set @s role 12
scoreboard players set @s skill.clicker_cd 0
scoreboard players set @s skill.clicker_state 0
team join infected @s
function escape_island:visual/infected_common
attribute @s minecraft:attack_damage base set 4
function skill:clicker/hearing_spore/update_item
tellraw @s [{"text":"[DEV] 已设为循声者。","color":"dark_green"},{"text":" [感染测试]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
