# 兼容入口；时钟、个人状态和规则分别拥有各自更新职责。
execute unless score $game in_game matches 1 run return 0
scoreboard players add $game phase_timer 1
execute if score $game ie.ruleset matches 1 run function escape_island:game/rules/v01/phase
execute if score $game ie.mutate_left matches 1.. run scoreboard players remove $game ie.mutate_left 1
execute if score $game cur_phase matches 5 if score $game ie.mutate_left matches 0 run function escape_island:game/end_mutate
execute unless score $game in_game matches 1 run return 0
scoreboard players add $tick cycle20 1
execute if score $tick cycle20 matches 20.. run scoreboard players set $tick cycle20 0
execute if score $tick cycle20 matches 0 run function escape_island:game/_tick_20
scoreboard players add $tick cycle5 1
execute if score $tick cycle5 matches 5.. run scoreboard players set $tick cycle5 0
execute if score $tick cycle5 matches 0 run function escape_island:ui/update_actionbar
