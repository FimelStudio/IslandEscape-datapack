execute as @a[tag=team.human] at @s if entity @e[tag=marker.ship_dock,distance=..8] run function escape_island:escape/boarding_check
function escape_island:util/recount_escaped
function escape_island:game/end_ship
