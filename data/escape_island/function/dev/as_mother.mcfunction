# escape_island:dev/as_mother  —  make caller a sandbox mother
function escape_island:dev/_reset_player_state
tag @s add role.survivor
function escape_island:game/_make_mother
tellraw @s [{"text":"[DEV] 已设为母体。","color":"dark_red"},{"text":" [感染测试]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
