execute as @a[tag=team.human,tag=!state.escaped] at @s if entity @e[tag=entity.helicopter,distance=..5] run function escape_island:escape/boarding_check
execute as @a[tag=infected.mother,tag=state.disguised,tag=!state.escaped] at @s if entity @e[tag=entity.helicopter,distance=..5] run function escape_island:escape/_board_disguised_mother

function escape_island:util/recount_escaped

function escape_island:game/end_helicopter
