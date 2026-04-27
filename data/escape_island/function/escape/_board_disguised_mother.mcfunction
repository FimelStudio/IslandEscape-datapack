# Mother (disguised) boards — trigger 8-second scan
tag @s add state.disguise_scanning
tellraw @a {"text":"§7扫描系统检测到异常信号……","color":"gray","italic":true}
schedule function escape_island:escape/_disguise_scan_complete 160t
