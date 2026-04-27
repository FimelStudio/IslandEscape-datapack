function escape_island:dev/clear_markers
scoreboard players set $game dev_mode 1
function escape_island:training/start
function escape_island:dev/setup_markers
tellraw @s [{"text":"[DEV] 无地图开发沙盒已创建。","color":"aqua"},{"text":" [感染测试]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}},{"text":" [地图检查]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:debug/validate_map"}},{"text":" [清理沙盒]","color":"gray","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/stop"}}]
