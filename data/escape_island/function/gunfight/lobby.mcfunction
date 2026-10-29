execute if score $game in_game matches 1 run return 0
execute if score $game ie.mode matches 4 run return 0
tag @s add gs.ready
gamemode adventure @s
tellraw @s [{"text":"[Last Stand] 已加入枪战大厅。","color":"red"},{"text":" [开始]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:gunfight/start"}}]
