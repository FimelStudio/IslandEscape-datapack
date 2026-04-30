
tag @e[tag=marker.spawn_island] add state.spawn.available

execute as @a run function escape_island:util/_scatter_one

tag @e remove state.spawn.available
