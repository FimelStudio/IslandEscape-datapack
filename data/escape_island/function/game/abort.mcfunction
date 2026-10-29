execute unless score $game in_game matches 1 unless score $game ie.mode matches 4 run return 0
function escape_island:game/cleanup
scoreboard players set $game ending_triggered 1
tellraw @a {"text":"[海岛逃生] 对局已中止，临时状态与预约已清理。","color":"gold"}
