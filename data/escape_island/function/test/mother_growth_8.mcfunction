function escape_island:dev/_reset_player_state
scoreboard players set $game player_count 8
function escape_island:util/apply_scaling
function escape_island:game/_make_mother
function escape_island:role/mother_phase_up
tellraw @s [{"text":"[TEST] 8人局成长 I：","color":"gold"},{"text":"phase=","color":"gray"},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"，mother_hp=","color":"gray"},{"score":{"name":"@s","objective":"mother_hp"}},{"text":"。预期 65 HP。","color":"green"}]
function escape_island:role/mother_phase_up
tellraw @s [{"text":"[TEST] 8人局成长 II：","color":"gold"},{"text":"phase=","color":"gray"},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"，mother_hp=","color":"gray"},{"score":{"name":"@s","objective":"mother_hp"}},{"text":"。预期仍为 65 HP，嚎叫增强。","color":"green"}]
function escape_island:role/mother_phase_up
tellraw @s [{"text":"[TEST] 8人局成长 III：","color":"gold"},{"text":"phase=","color":"gray"},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"，mother_hp=","color":"gray"},{"score":{"name":"@s","objective":"mother_hp"}},{"text":"。预期 70 HP。","color":"green"}]
tellraw @s [{"text":"[返回感染测试菜单]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
