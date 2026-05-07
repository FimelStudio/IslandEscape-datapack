scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 3
scoreboard players set $game phase_timer 14999
scoreboard players set $game final_pressure 0
scoreboard players set $game heli_countdown 0
scoreboard players set $game ship_countdown 0
scoreboard players set $game sub_countdown 0
scoreboard players set $game bomb_countdown 0
scoreboard players set $game signal_done 0
scoreboard players set $game gen_done 0
tag @s add infected.mother
tag @s remove state.dead
tag @s remove state.mutated
scoreboard players set @s cd_mother_mutate 900
function escape_island:game/phase_check
tellraw @s [{"text":"[TEST] 无撤离倒计时，12:30终局高压=","color":"gold"},{"score":{"name":"$game","objective":"final_pressure"}},{"text":"，母体变异CD=","color":"gold"},{"score":{"name":"@s","objective":"cd_mother_mutate"}},{"text":"。预期 1 / 0。","color":"green"}]

scoreboard players set $game cur_phase 3
scoreboard players set $game phase_timer 14999
scoreboard players set $game final_pressure 0
scoreboard players set $game ship_countdown 45
scoreboard players set @s cd_mother_mutate 900
function escape_island:game/phase_check
tellraw @s [{"text":"[TEST] 轮船撤离倒计时中，终局高压=","color":"gold"},{"score":{"name":"$game","objective":"final_pressure"}},{"text":"，母体变异CD=","color":"gold"},{"score":{"name":"@s","objective":"cd_mother_mutate"}},{"text":"。预期 0 / 900。","color":"green"}]

scoreboard players set $game ship_countdown 0
scoreboard players set $game final_pressure 0
tag @s remove infected.mother
clear @s minecraft:phantom_membrane[minecraft:custom_data={skill:"mother/mutate"}]
clear @s minecraft:gray_dye[minecraft:custom_data={skill:"mother/mutate_cd"}]
clear @s minecraft:red_dye[minecraft:custom_data={skill:"mother/mutate_hunt"}]
tellraw @s [{"text":"[返回自测菜单]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
