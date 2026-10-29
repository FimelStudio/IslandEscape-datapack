tag @s add state.dead
tag @s add state.spectator
team join spectator @s
function escape_island:visual/spectator
effect clear @s
attribute @s minecraft:movement_speed base set 0.1
scoreboard players set @s mother_respawn -1
gamemode spectator @s
function escape_island:infection/anchor/remove {kind:"dead"}
