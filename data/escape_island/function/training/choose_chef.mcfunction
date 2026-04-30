function escape_island:training/clear_role
tag @s add team.human
function escape_island:role/_tag_chef
function escape_island:role/_give_base_survivor
function escape_island:role/kit_chef
title @s title {"text":"§a厨师","bold":true}
tellraw @s [{"text":"[训练模式] 已切换为厨师。","color":"green"},{"text":" [职业选择]","color":"light_purple","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/role_menu"}},{"text":" [刷测试人偶]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/spawn_dummies"}}]
