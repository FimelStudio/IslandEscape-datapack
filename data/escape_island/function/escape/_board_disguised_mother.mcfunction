execute if entity @s[tag=state.disguise_scanning] run title @s actionbar {"text":"身份扫描中……","color":"dark_purple"}
execute if entity @s[tag=state.disguise_scanning] run return 0

tag @s add state.boarding
tag @s add state.boarding.heli
tag @s remove state.boarding.ship
tag @s remove state.boarding.sub
gamemode spectator @s
tag @s add state.disguise_scanning
title @s title {"text":"正在扫描身份","color":"dark_purple","bold":true}
tellraw @a {"text":"§7扫描系统检测到异常信号……","color":"gray","italic":true}
scoreboard players set @s ie.scan_left 160
