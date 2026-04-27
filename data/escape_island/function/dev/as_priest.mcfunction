function escape_island:dev/_reset_player_state
tag @s add role.survivor
tag @s add role.priest
scoreboard players set @s role 10
team join survivors @s
function escape_island:role/_give_base_survivor
function escape_island:role/kit_priest
tellraw @s [{"text":"[DEV] 已设为神父幸存者。","color":"white"},{"text":" [感染测试]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
