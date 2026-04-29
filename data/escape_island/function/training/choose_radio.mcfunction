function escape_island:training/clear_role
tag @s add role.survivor
function escape_island:role/_tag_radio
function escape_island:role/_give_base_survivor
function escape_island:role/kit_radio
title @s title {"text":"§3通讯员","bold":true}
tellraw @s [{"text":"[训练模式] 已切换为通讯员。","color":"dark_aqua"},{"text":" [职业选择]","color":"light_purple","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/role_menu"}},{"text":" [刷测试人偶]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/spawn_dummies"}}]
