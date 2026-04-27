# escape_island:util/recount_players  —  count online players
scoreboard players set $game player_count 0
execute as @a run scoreboard players add $game player_count 1
