function escape_island:test/reset_state
scoreboard players set $game phase_timer 18000
tag @s add team.human
function escape_island:game/phase_5_mutate
tellraw @s {"text":"[测试] 15分到！20秒后天启","color":"dark_red"}
