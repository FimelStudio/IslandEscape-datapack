execute if score @s gs_lives matches ..0 run return 0
tag @s remove gs.dead
scoreboard players set @s gs_invuln 60
gamemode adventure @s
spreadplayers ~ ~ 2 12 false @s
tellraw @s {"text":"[Last Stand] 重生，无敌 3 秒。","color":"yellow"}
