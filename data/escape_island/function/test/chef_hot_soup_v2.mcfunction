function escape_island:test/start_solo

scoreboard players set @s skill.soup_cd 0
tag @s add role.chef
tag @s add team.human
tag @s add state.infected_period
scoreboard players set @s infect_time 20
function skill:chef/hot_soup/update_item

tellraw @s {"text":"[TEST] 厨师热汤 v0.2 已准备：你现在感染期 20 秒，热汤已就绪。","color":"gold"}
tellraw @s {"text":"[TEST] 先远离队友右键热汤：预期给自己回血，并把 infect_time 从 20 拉到 28（+8s 缓冲）。","color":"green"}
tellraw @s {"text":"[TEST] 再靠近8格内队友右键：预期优先作用于队友，不清除其感染期，仅缓冲 +8s。","color":"green"}
tellraw @s [{"text":"[查看状态]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:debug/show_state"}},{"text":" 观察 infect_time 与 skill.soup_cd","color":"gray"}]
tellraw @s [{"text":"[返回自测菜单]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
