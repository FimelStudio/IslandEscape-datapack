scoreboard players set $game in_game 0
function escape_island:dev/_reset_player_state
scoreboard players set $game player_count 4
function escape_island:util/apply_scaling
function escape_island:game/_make_mother
tellraw @s {"text":"[TEST] 单人 debug：下一步会把你临时转成普通感染者，用自己模拟核心母体提示分支。正式多人局会显示真正的母体玩家名。","color":"gold"}
function escape_island:infection/turn
tellraw @s {"text":"[TEST] 若上方出现“核心母体: 你的名字。死亡后你将在母体附近复活。”则感染链提示分支通过。","color":"green"}
tellraw @s [{"text":"[返回感染测试菜单]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
