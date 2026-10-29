# 正常结束、中止、重载和重新开局共用；重复执行不会再次结算或发奖。
scoreboard players set $game in_game 0
scoreboard players add $game ie.match_id 1
function escape_island:game/cancel_schedules
execute as @a[tag=ie.active] at @s run function escape_island:player/reset
execute as @a[tag=ie.participant] at @s run function escape_island:player/reset
execute as @a[tag=state.training] at @s run function escape_island:player/reset
execute as @a[tag=team.human] at @s run function escape_island:player/reset
execute as @a[tag=team.infected] at @s run function escape_island:player/reset
execute as @a[tag=gs.player] at @s run function escape_island:player/reset
execute as @a[tag=range.active] at @s run function escape_island:player/reset
function escape_island:training/restore_rules_if_idle
function escape_island:game/reset_world
function escape_island:game/restore_rules
