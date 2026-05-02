scoreboard players remove $game ship_countdown 1
execute store result bossbar escape_island:ship value run scoreboard players get $game ship_countdown
execute if score $game ship_countdown matches 10 run tellraw @a {"text":"§b[轮船] 10 秒后离港！","color":"aqua"}
execute if score $game ship_countdown matches 0 run function escape_island:escape/_ship_go
