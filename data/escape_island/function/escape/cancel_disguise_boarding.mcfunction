# @s 为认证失败的伪装母体；只驱离该玩家，不影响其他候机幸存者。
execute unless entity @s[tag=state.disguise_scanning] run return 0
execute if entity @s[tag=state.boarding.heli] at @e[type=minecraft:marker,tag=heli.selected_pad,limit=1] run tp @s ~4 ~1 ~
tag @s remove state.boarding
tag @s remove state.boarding.heli
tag @s remove state.boarding.ship
tag @s remove state.boarding.sub
tag @s remove state.disguise_scanning
scoreboard players set @s ie.scan_left 0
gamemode adventure @s
