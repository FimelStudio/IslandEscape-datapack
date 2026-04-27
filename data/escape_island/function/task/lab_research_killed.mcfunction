# Called when a researcher zombie is killed by a player
# Drop ID card fragment
advancement revoke @s only escape_island:infection/researcher_killed
execute at @s run loot spawn ~ ~ ~ loot escape_island:mob/researcher_drops
