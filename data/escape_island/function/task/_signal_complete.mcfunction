# Signal tower complete — trigger helicopter countdown
tellraw @a {"text":"§a[信号塔] 修复完成！直升机已被呼叫。","color":"green"}
scoreboard players set $game dawn_active 1
function escape_island:escape/helicopter_call
