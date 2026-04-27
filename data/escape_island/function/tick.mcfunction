# escape_island:tick  —  called every game tick by #minecraft:tick
# Runs game logic during a match, or lightweight training/dev logic outside a match.

# Refresh respawn anchors every tick. If a player dies, immediate_respawn
# brings them back to this near-current spot so death can enter a locked state.
execute as @a[tag=role.survivor,tag=!state.sporifying,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s run spawnpoint @s ~ ~ ~
execute as @a[tag=role.infected,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s run spawnpoint @s ~ ~ ~
execute as @a[tag=role.mother,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s run spawnpoint @s ~ ~ ~
function escape_island:infection/death_check
execute as @a[tag=state.sporifying] at @s at @e[type=minecraft:marker,tag=entity.downed_anchor,distance=..3,sort=nearest,limit=1] run tp @s ~ ~ ~
execute as @a[tag=state.dead] at @s at @e[type=minecraft:marker,tag=entity.dead_anchor,distance=..3,sort=nearest,limit=1] run tp @s ~ ~ ~

execute if score $game in_game matches 1 run function escape_island:game/phase_check

# Outside a formal match, keep sandbox infection/death timers alive.
scoreboard players set $training_needed dev_count 0
execute unless score $game in_game matches 1 if entity @a[tag=state.training] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if entity @a[tag=state.infected_period] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if entity @a[tag=state.sporifying] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if entity @a[tag=state.dead] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if entity @a[scores={role=1..}] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if score $training_needed dev_count matches 1 run function escape_island:training/tick
