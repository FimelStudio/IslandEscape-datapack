execute if score $game gs_active matches 1 run return 0
execute if score $game in_game matches 1 run return 0
execute if score $game ie.mode matches 4 run return 0
tag @s add ie.active
scoreboard players operation @s ie.session = $game ie.match_id


function escape_island:training/clear_role
function escape_island:training/acquire_rules
tag @s add state.training
tellraw @s [{"text":"[训练模式] 已进入训练模式。","color":"yellow"},{"text":" [选择职业]","color":"light_purple","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/role_menu"}},{"text":" [退出训练]","color":"gray","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/reset"}},{"text":" [自测菜单]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
gamemode adventure @s
effect clear @s
attribute @s minecraft:movement_speed base set 0.1
effect give @s minecraft:saturation 1 20 true
function escape_island:training/role_menu
