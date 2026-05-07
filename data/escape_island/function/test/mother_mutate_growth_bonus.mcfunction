function escape_island:dev/_reset_player_state
scoreboard players set $game player_count 8
function escape_island:util/apply_scaling
function escape_island:game/_make_mother
scoreboard players set @s mother_phase 3
function skill:mother/mutate
tellraw @s [{"text":"[TEST] 成长II后变异：","color":"gold"},{"text":"hunt=","color":"gray"},{"score":{"name":"@s","objective":"cd_mother_hunt"}},{"text":"。预期 1500 tick / 75秒。","color":"green"}]
scoreboard players set @s cd_mother_hunt 1
function skill:mother/mutate/cooldown_tick
tellraw @s [{"text":"[TEST] 成长II后回伪装冷却：","color":"gold"},{"text":"mutate_cd=","color":"gray"},{"score":{"name":"@s","objective":"cd_mother_mutate"}},{"text":"。预期 700 tick / 35秒。","color":"green"}]
tag @s add infected.common
scoreboard players set @s mother_phase 3
function escape_island:role/mother_phase_up
tellraw @s [{"text":"[TEST] 成长III感染者脉冲：","color":"gold"},{"text":"如果你短暂获得速度/抗性效果，说明脉冲已发放。当前 phase=","color":"gray"},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"。","color":"green"}]
tag @s remove infected.common
function escape_island:role/kit_mother
tellraw @s [{"text":"[返回感染测试菜单]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
