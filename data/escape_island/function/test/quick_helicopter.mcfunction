function escape_island:test/reset_state
scoreboard players set $game signal_done 1
scoreboard players set $game gen_done 1
function escape_island:game/check_helicopter_ready
tellraw @s {"text":"[测试] 已跳过信号塔/发电机，直接呼叫直升机","color":"gold"}
