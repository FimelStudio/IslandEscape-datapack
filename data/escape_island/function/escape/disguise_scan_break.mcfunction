tellraw @a {"text":"§c[扫描] 伪装信号被病毒学家识破，登载认证中断。","color":"red"}
execute as @a[tag=state.disguise_scanning] run gamemode adventure @s
tag @a remove state.disguise_scanning
tag @a remove state.boarding
tag @a remove state.boarding.heli
tag @a remove state.boarding.ship
tag @a remove state.boarding.sub
schedule clear escape_island:escape/_disguise_scan_complete
