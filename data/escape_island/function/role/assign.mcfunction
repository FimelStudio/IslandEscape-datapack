
tag @a add state.role_candidate

execute if score $game player_count matches 4..7 run function escape_island:role/_assign_doctor_guaranteed

function escape_island:role/_assign_remaining

tag @a remove state.role_candidate
