execute if score $game ie.mode matches 4 run return 0
execute if score $game gs_active matches 1 run return 0
execute if score $game in_game matches 1 run return 0
function escape_island:player/reset
tag @s add state.training
tag @s add ie.active
scoreboard players operation @s ie.session = $game ie.match_id
