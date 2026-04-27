# escape_island:util/spawn_scatter  —  teleport each player to a unique spawn_island marker

# Tag each marker as available
tag @e[tag=marker.spawn_island] add spawn_available

# Per player: pick one available marker, tp, remove available tag
execute as @a run function escape_island:util/_scatter_one

# Clean up any leftover tags
tag @e remove spawn_available
