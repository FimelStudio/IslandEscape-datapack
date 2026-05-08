tag @s add gs.ready
gamemode adventure @s
tellraw @s [{"text":"[Last Stand] 已加入枪战大厅。","color":"red"},{"text":" [开始]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:gunfight/start"}}]
