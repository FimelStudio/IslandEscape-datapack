function escape_island:dev/_reset_player_state
tag @s add role.survivor
scoreboard players set @s role 1
team join survivors @s
function escape_island:role/_give_base_survivor
tellraw @s [{"text":"[DEV] 已设为幸存者。","color":"green"},{"text":" [感染测试]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
