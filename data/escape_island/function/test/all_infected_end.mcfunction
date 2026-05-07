function escape_island:test/reset_state
scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 3
scoreboard players set $game ending_triggered 0

tag @s add team.human
tag @s remove state.dead
tag @s remove state.escaped
tag @s remove state.spectator
team join survivors @s

tellraw @s {"text":"[TEST] 正在把唯一幸存者转化。预期：立刻出现“岛上再无生者……”标题，约 3 秒后进入孢子升腾 Bad End。","color":"gold"}
function escape_island:infection/turn
