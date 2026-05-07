function escape_island:dev/_reset_player_state
scoreboard players set $game player_count 4
function escape_island:util/apply_scaling
function escape_island:game/_make_mother
scoreboard players set $game phase_timer 5999
function escape_island:role/tick_mother
tellraw @s [{"text":"[TEST] T+4:59.95：","color":"gray"},{"text":"phase="},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"，mother_hp="},{"score":{"name":"@s","objective":"mother_hp"}},{"text":"。预期 phase 1 / 70 HP，不成长。","color":"green"}]
scoreboard players set $game phase_timer 6000
function escape_island:role/tick_mother
tellraw @s [{"text":"[TEST] T+5:00：","color":"gold"},{"text":"phase=","color":"gray"},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"，mother_hp=","color":"gray"},{"score":{"name":"@s","objective":"mother_hp"}},{"text":"。预期 phase 2 / 75 HP。","color":"green"}]
scoreboard players set $game phase_timer 9599
function escape_island:role/tick_mother
tellraw @s [{"text":"[TEST] T+7:59.95：","color":"gray"},{"text":"phase="},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"。预期仍为 phase 2。","color":"green"}]
scoreboard players set $game phase_timer 9600
function escape_island:role/tick_mother
tellraw @s [{"text":"[TEST] T+8:00：","color":"gold"},{"text":"phase=","color":"gray"},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"，mother_hp=","color":"gray"},{"score":{"name":"@s","objective":"mother_hp"}},{"text":"。预期 phase 3 / 75 HP。","color":"green"}]
scoreboard players set $game phase_timer 13199
function escape_island:role/tick_mother
tellraw @s [{"text":"[TEST] T+10:59.95：","color":"gray"},{"text":"phase="},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"。预期仍为 phase 3。","color":"green"}]
scoreboard players set $game phase_timer 13200
function escape_island:role/tick_mother
tellraw @s [{"text":"[TEST] T+11:00：","color":"gold"},{"text":"phase=","color":"gray"},{"score":{"name":"@s","objective":"mother_phase"}},{"text":"，mother_hp=","color":"gray"},{"score":{"name":"@s","objective":"mother_hp"}},{"text":"。预期 phase 4 / 85 HP。","color":"green"}]
tellraw @s [{"text":"[返回感染测试菜单]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
