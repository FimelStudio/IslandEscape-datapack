# escape_island:test/full_simulation  —  fast-forward time to test full match flow
# Sets debug mode and accelerates all timers by 5x
scoreboard players set Tunable tunable.debug 1
tellraw @s {"text":"§e[TEST] Debug模式开启，计时器加速x5。","color":"yellow"}
