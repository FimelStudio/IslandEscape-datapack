# escape_island:util/recount_escaped  —  count escaped players without double-counting
scoreboard players set $game escaped_count 0
execute as @a[tag=state.escaped] run scoreboard players add $game escaped_count 1
