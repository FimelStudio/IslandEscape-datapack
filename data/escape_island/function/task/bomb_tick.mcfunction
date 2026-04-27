# Tick bomb countdown
scoreboard players remove $game bomb_countdown 1
execute store result bossbar escape_island:bomb value run scoreboard players get $game bomb_countdown

execute if score $game bomb_countdown matches ..0 run function escape_island:game/end_destroy
