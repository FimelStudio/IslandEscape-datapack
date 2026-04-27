# escape_island:infection/spore_load_decay  —  decay spore_load after 15s of no new pollution

# Decrement decay cooldown for all active survivors
execute as @a[tag=role.survivor,tag=!state.infected_period,scores={spore_load=1..}] run scoreboard players remove @s spore_decay_cd 1

# When cooldown hits 0: remove 15 pollution every 5 seconds
# Common infection tick runs once per second.
scoreboard players add $tick decay_cycle 1
execute if score $tick decay_cycle matches 5.. run scoreboard players set $tick decay_cycle 0
execute if score $tick decay_cycle matches 0 run execute as @a[tag=role.survivor,scores={spore_load=1..,spore_decay_cd=..0}] run scoreboard players remove @s spore_load 15

# Clamp to 0
execute as @a[scores={spore_load=..-1}] run scoreboard players set @s spore_load 0
