execute as @a[tag=state.boarding,tag=infected.common] run function escape_island:escape/boarding_convert_kick
execute as @a[tag=state.boarding,tag=!state.escaped] run function escape_island:escape/boarding_check
function escape_island:util/recount_escaped

tellraw @a {"text":"§5潜艇已离港！","color":"dark_purple"}
kill @e[type=minecraft:interaction,tag=entity.sub_door]
kill @e[tag=entity.sub_door_hint]
bossbar set escape_island:sub visible false

execute unless score $game ending_triggered matches 1.. unless score $game escape_route matches 1.. run scoreboard players set $game escape_route 3
function escape_island:escape/_ending_resolve
