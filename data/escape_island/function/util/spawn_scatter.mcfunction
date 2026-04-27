
tag @e[tag=marker.spawn_island] add spawn_available

execute as @a run function escape_island:util/_scatter_one

tag @e remove spawn_available
