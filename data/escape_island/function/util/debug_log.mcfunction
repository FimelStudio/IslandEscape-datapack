# Utility: log a debug message if debug mode is on
execute if score Tunable tunable.debug matches 1.. run tellraw @a[gamemode=creative] {"text":"[DEBUG] ","color":"gray"}
