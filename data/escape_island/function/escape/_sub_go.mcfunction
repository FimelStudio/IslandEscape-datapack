execute as @a[tag=state.boarding,tag=infected.common] run function escape_island:escape/boarding_convert_kick
execute as @a[tag=state.boarding,tag=!state.escaped] run function escape_island:escape/boarding_check
function escape_island:util/recount_escaped

tellraw @a {"text":"§5潜艇已离港！","color":"dark_purple"}
kill @e[type=minecraft:interaction,tag=entity.sub_door]
kill @e[tag=entity.sub_door_hint]
bossbar set escape_island:sub visible false

function escape_island:game/end_lab
