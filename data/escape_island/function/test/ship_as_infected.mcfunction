tag @s remove team.human
tag @s add team.infected
tag @s add infected.common
gamemode adventure @s
tellraw @s {"text":"[Batch 9A] 已切为感染者干扰模拟：普通感染者站在船坞旁每秒 -1，可拖慢或抵消单人修复。","color":"red"}
tellraw @s [{"text":"[切回幸存者]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/ship_as_survivor"}}]
