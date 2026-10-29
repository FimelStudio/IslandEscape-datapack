function escape_island:test/reset_state
tag @s add ie.active
scoreboard players operation @s ie.session = $game ie.match_id
scoreboard players set $game signal_done 1
scoreboard players set $game signal_progress 100
function escape_island:game/check_helicopter_ready
tellraw @s {"text":"[测试] 已跳过信号塔/发电机，直接呼叫直升机","color":"gold"}
