scoreboard players set $game dev_mode 0
function escape_island:dev/reset_runtime
function escape_island:training/reset
function escape_island:dev/clear_markers
tellraw @s [{"text":"[DEV] 开发沙盒已关闭。","color":"gray"},{"text":" [自测菜单]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
