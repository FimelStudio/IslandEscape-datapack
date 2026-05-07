tag @s add state.boarding
tag @s add state.boarding.sub
tag @s remove state.boarding.heli
tag @s remove state.boarding.ship
gamemode spectator @s
tellraw @s {"text":"§5已登艇，等待潜艇离港……","color":"dark_purple"}
title @s title {"text":"§5已登艇","bold":true}
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.2
