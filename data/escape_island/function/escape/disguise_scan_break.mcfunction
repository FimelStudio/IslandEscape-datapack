tellraw @a {"text":"[扫描] 异常身份认证中断。","color":"red"}
execute as @a[tag=state.disguise_scanning] at @s run function escape_island:escape/cancel_disguise_boarding
