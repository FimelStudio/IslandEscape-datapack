execute if score $game signal_done matches 1 run return 0
scoreboard players set $game signal_done 1
scoreboard players operation $game signal_progress = Tunable tunable.signal_global_target
bossbar set escape_island:signal visible false
tellraw @a {"text":"§a信号网络上线！求救信号已发出，直升机正在靠近。","color":"green","bold":true}
playsound minecraft:block.beacon.power_select master @a ~ ~ ~ 1 0.6
function escape_island:game/check_helicopter_ready
