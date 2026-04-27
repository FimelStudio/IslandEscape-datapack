# escape_island:training/start  —  single-player tutorial mode
# Sets up a sandbox where skills can be practiced without a real match.

scoreboard players set $game in_game 0
gamerule immediate_respawn true
tag @s add state.training
tellraw @s [{"text":"[训练模式] 已进入训练模式。","color":"yellow"},{"text":" [发全部套件]","color":"light_purple","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/give_all_kits"}},{"text":" [退出训练]","color":"gray","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/reset"}},{"text":" [自测菜单]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
gamemode survival @s
effect clear @s
attribute @s minecraft:movement_speed base set 0.1
effect give @s minecraft:saturation 1 20 true
