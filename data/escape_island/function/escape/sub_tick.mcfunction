scoreboard players remove $game sub_countdown 1
execute store result bossbar escape_island:sub value run scoreboard players get $game sub_countdown

execute if score $game sub_countdown matches ..0 run function escape_island:escape/_sub_go
