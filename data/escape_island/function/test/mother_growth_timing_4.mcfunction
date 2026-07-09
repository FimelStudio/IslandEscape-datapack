function escape_island:dev/_reset_player_state
scoreboard players set $game player_count 4
function escape_island:util/apply_scaling
function escape_island:game/_make_mother
scoreboard players set $game phase_timer 7199
function escape_island:role/tick_mother
tellraw @s [{"text":"[TEST] T+5:59.95：","color":"gray"},{"text":"phase="},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"，mother_hp="},{"score":{"name":"@s","objective":"mother_hp"}},{"text":"。预期 phase 1 / 70 HP，不成长。","color":"green"}]
scoreboard players set $game phase_timer 7200
function escape_island:role/tick_mother
tellraw @s [{"text":"[TEST] T+6:00：","color":"gold"},{"text":"phase=","color":"gray"},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"，mother_hp=","color":"gray"},{"score":{"name":"@s","objective":"mother_hp"}},{"text":"。预期 phase 2 / 75 HP。","color":"green"}]
scoreboard players set $game phase_timer 10799
function escape_island:role/tick_mother
tellraw @s [{"text":"[TEST] T+8:59.95：","color":"gray"},{"text":"phase="},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"。预期仍为 phase 2。","color":"green"}]
scoreboard players set $game phase_timer 10800
function escape_island:role/tick_mother
tellraw @s [{"text":"[TEST] T+9:00：","color":"gold"},{"text":"phase=","color":"gray"},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"，mother_hp=","color":"gray"},{"score":{"name":"@s","objective":"mother_hp"}},{"text":"。预期 phase 3 / 75 HP。","color":"green"}]
scoreboard players set $game phase_timer 14399
function escape_island:role/tick_mother
tellraw @s [{"text":"[TEST] T+11:59.95：","color":"gray"},{"text":"phase="},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"。预期仍为 phase 3。","color":"green"}]
scoreboard players set $game phase_timer 14400
function escape_island:role/tick_mother
tellraw @s [{"text":"[TEST] T+12:00：","color":"gold"},{"text":"phase=","color":"gray"},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"，mother_hp=","color":"gray"},{"score":{"name":"@s","objective":"mother_hp"}},{"text":"。预期 phase 4 / 80 HP。","color":"green"}]
tellraw @s [{"text":"[返回感染测试菜单]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
