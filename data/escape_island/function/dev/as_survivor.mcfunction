execute if score $game in_game matches 1 run return 0
execute if score $game ie.mode matches 4 run return 0
execute if score $game gs_active matches 1 run return 0
function escape_island:dev/_reset_player_state
tag @s add team.human
scoreboard players set @s role 1
team join survivors @s
function escape_island:role/_give_base_survivor
tellraw @s [{"text":"[DEV] 已设为幸存者。","color":"green"},{"text":" [感染测试]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
