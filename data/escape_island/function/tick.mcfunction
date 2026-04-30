
scoreboard players enable @a ie.dialog
scoreboard players enable @a ie.eat_health
execute as @a[scores={ie.dialog=1..}] run function escape_island:dialog/trigger
execute as @a[scores={ie.eat_health=1..}] run function skill:mother/eat/apply_config_trigger

execute as @a[tag=role.survivor,tag=!state.sporifying,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s run spawnpoint @s ~ ~ ~
execute as @a[tag=role.infected,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s run spawnpoint @s ~ ~ ~
execute as @a[tag=role.mother,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s run spawnpoint @s ~ ~ ~
function escape_island:infection/death_check
execute as @a[tag=state.sporifying] at @s at @e[type=minecraft:marker,tag=entity.downed_anchor,distance=..3,sort=nearest,limit=1] run tp @s ~ ~ ~
execute as @a[tag=state.dead] at @s at @e[type=minecraft:marker,tag=entity.dead_anchor,distance=..3,sort=nearest,limit=1] run tp @s ~ ~ ~
execute as @a[scores={signal_repair_time=1..,signal_repair_seen=0}] run function escape_island:task/signal_tower_reset_hold
scoreboard players remove @a[scores={signal_repair_seen=1..}] signal_repair_seen 1

execute if score $game in_game matches 1 run function escape_island:game/phase_check

scoreboard players set $training_needed dev_count 0
execute unless score $game in_game matches 1 if entity @a[tag=state.training] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if entity @a[tag=state.infected_period] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if entity @a[tag=state.sporifying] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if entity @a[tag=state.dead] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if entity @a[scores={role=1..}] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if score $training_needed dev_count matches 1 run function escape_island:training/tick
