# 仅清理参与独立枪战的玩家，避免无条件修改全体队伍。
execute as @a[tag=gs.player] at @s run function escape_island:player/reset
scoreboard players set $game gs_active 0
tag @a remove gs.ready
tag @a remove gs.player
tag @a remove gs.dead
