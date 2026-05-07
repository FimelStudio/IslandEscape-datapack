scoreboard players set $game in_game 0
function escape_island:dev/_reset_player_state
scoreboard players set $game player_count 8
function escape_island:util/apply_scaling
function escape_island:game/_make_mother
tag @s add team.human
team join survivors @s
scoreboard players set @s spore_load 0
scoreboard players set @s mother_passive_stick 0
scoreboard players set @s cd_mother_passive_spore 0
tellraw @s {"text":"[TEST] 单人模拟：你同时带母体和幸存者标记，用于验证贴身被动。正式局母体不会污染自己。","color":"gold"}
function escape_island:mother/passive_disguise
function escape_island:mother/passive_disguise
function escape_island:mother/passive_disguise
function escape_island:mother/passive_disguise
function escape_island:mother/passive_disguise
tellraw @s [{"text":"[TEST] 贴近5秒：","color":"gold"},{"text":"stick=","color":"gray"},{"score":{"name":"@s","objective":"mother_passive_stick"}},{"text":"，spore=","color":"gray"},{"score":{"name":"@s","objective":"spore_load"}},{"text":"。预期 stick=5，spore=0。","color":"green"}]
function escape_island:mother/passive_disguise
tellraw @s [{"text":"[TEST] 贴近6秒触发：","color":"gold"},{"text":"stick=","color":"gray"},{"score":{"name":"@s","objective":"mother_passive_stick"}},{"text":"，spore=","color":"gray"},{"score":{"name":"@s","objective":"spore_load"}},{"text":"，cd=","color":"gray"},{"score":{"name":"@s","objective":"cd_mother_passive_spore"}},{"text":"。预期 spore=10，cd=10。","color":"green"}]
scoreboard players set @s cd_mother_passive_spore 1
function escape_island:mother/passive_disguise
tellraw @s [{"text":"[TEST] 冷却到期再脉冲：","color":"gold"},{"text":"spore=","color":"gray"},{"score":{"name":"@s","objective":"spore_load"}},{"text":"，cd=","color":"gray"},{"score":{"name":"@s","objective":"cd_mother_passive_spore"}},{"text":"。预期 spore=20，cd=10。","color":"green"}]
tag @s add state.mutated
scoreboard players set @s cd_mother_passive_spore 0
function escape_island:mother/passive_disguise
tellraw @s [{"text":"[TEST] 猎手状态暂停：","color":"gold"},{"text":"spore=","color":"gray"},{"score":{"name":"@s","objective":"spore_load"}},{"text":"。预期仍为 20。","color":"green"}]
function escape_island:dev/_reset_player_state
tellraw @s [{"text":"[返回感染测试菜单]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
