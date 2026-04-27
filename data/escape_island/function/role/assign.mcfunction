# escape_island:role/assign  —  randomly assign roles to all survivors
# Roles are tagged in order of priority. Remaining players get no role tag (generic survivor).
# Small-group guarantee: Doctor always included in 4-7 player pools.

tag @a add candidate

# 4-7 player games: Doctor is guaranteed (pick first)
execute if score $game player_count matches 4..7 run function escape_island:role/_assign_doctor_guaranteed

# For 8+ players, or after Doctor is assigned, assign remaining roles
function escape_island:role/_assign_remaining

tag @a remove candidate
