execute if score $game signal_progress matches 1.. run bossbar set escape_island:signal visible true
execute if score $game signal_progress matches 1.. run bossbar set escape_island:signal players @a
execute store result bossbar escape_island:signal value run scoreboard players get $game signal_progress
