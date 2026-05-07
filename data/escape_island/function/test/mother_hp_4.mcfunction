function escape_island:dev/_reset_player_state
scoreboard players set $game player_count 4
function escape_island:util/apply_scaling
function escape_island:game/_make_mother
tellraw @s [{"text":"[TEST] 4人局母体 HP 缩放：","color":"gold"},{"text":"Tunable=","color":"gray"},{"score":{"name":"Tunable","objective":"tunable.mother_hp"}},{"text":"，mother_hp=","color":"gray"},{"score":{"name":"@s","objective":"mother_hp"}},{"text":"。预期 70 HP = 35 心。","color":"green"}]
tellraw @s [{"text":"[返回感染测试菜单]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
