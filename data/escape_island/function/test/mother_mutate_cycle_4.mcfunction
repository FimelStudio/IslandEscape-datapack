function escape_island:dev/_reset_player_state
scoreboard players set $game player_count 4
function escape_island:util/apply_scaling
function escape_island:game/_make_mother
function skill:mother/mutate
tellraw @s [{"text":"[TEST] 4人局变异触发：","color":"gold"},{"text":"hunt=","color":"gray"},{"score":{"name":"@s","objective":"cd_mother_hunt"}},{"text":"，mutate_cd=","color":"gray"},{"score":{"name":"@s","objective":"cd_mother_mutate"}},{"text":"。预期 hunt=1200，mutate_cd=0。","color":"green"}]
execute if entity @s[tag=state.mutated] run tellraw @s {"text":"[TEST] 当前为猎手状态：PASS","color":"green"}
execute unless entity @s[tag=state.mutated] run tellraw @s {"text":"[TEST] 没有进入猎手状态：FAIL","color":"red"}
scoreboard players set @s cd_mother_hunt 1
function skill:mother/mutate/cooldown_tick
tellraw @s [{"text":"[TEST] 猎手到期：","color":"gold"},{"text":"hunt=","color":"gray"},{"score":{"name":"@s","objective":"cd_mother_hunt"}},{"text":"，mutate_cd=","color":"gray"},{"score":{"name":"@s","objective":"cd_mother_mutate"}},{"text":"。预期 hunt=0，mutate_cd=600。","color":"green"}]
execute if entity @s[tag=!state.mutated] run tellraw @s {"text":"[TEST] 已自动回到隐藏母体：PASS","color":"green"}
execute unless entity @s[tag=!state.mutated] run tellraw @s {"text":"[TEST] 仍是猎手状态：FAIL","color":"red"}
scoreboard players set @s cd_mother_mutate 1
function skill:mother/mutate/cooldown_tick
tellraw @s [{"text":"[TEST] 冷却结束：","color":"gold"},{"text":"mutate_cd=","color":"gray"},{"score":{"name":"@s","objective":"cd_mother_mutate"}},{"text":"。预期 0，热键栏重新出现变异脉冲。","color":"green"}]
tellraw @s [{"text":"[返回感染测试菜单]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
