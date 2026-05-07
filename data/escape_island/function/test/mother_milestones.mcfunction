scoreboard players set $game in_game 0
function escape_island:dev/_reset_player_state
scoreboard players set $game player_count 8
function escape_island:util/apply_scaling
function escape_island:game/_make_mother
tellraw @s {"text":"[TEST] 下一步用你自己模拟“第一名普通感染者转化”。预期出现大标题：第一名感染者。","color":"gold"}
function escape_island:infection/turn
tellraw @s {"text":"[TEST] 若刚才出现母体私聊、warden roar 和第一名感染者标题，则首次感染里程碑通过。","color":"green"}
tellraw @s {"text":"[TEST] 下一步直接模拟第三名感染者里程碑。预期 actionbar 提示“第三名感染者已就位”。","color":"gold"}
function escape_island:mother/milestone_third_infect
tellraw @s {"text":"[TEST] 若出现第三人 actionbar / 私聊提示，则第三名感染者里程碑通过。","color":"green"}
function escape_island:dev/_reset_player_state
scoreboard players set $game player_count 8
function escape_island:util/apply_scaling
function escape_island:game/_make_mother
tellraw @s [{"text":"[返回感染测试菜单]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
