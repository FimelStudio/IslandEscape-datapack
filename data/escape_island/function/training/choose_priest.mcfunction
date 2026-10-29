execute if score $game in_game matches 1 run return 0
execute if score $game ie.mode matches 4 run return 0
execute if score $game gs_active matches 1 run return 0
function escape_island:training/clear_role
tag @s add team.human
function escape_island:role/_tag_priest
function escape_island:role/_give_base_survivor
function escape_island:role/kit_priest
title @s title {"text":"§e神父","bold":true}
tellraw @s [{"text":"[训练模式] 已切换为神父。","color":"yellow"},{"text":" [职业选择]","color":"light_purple","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/role_menu"}},{"text":" [刷测试人偶]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/spawn_dummies"}}]
